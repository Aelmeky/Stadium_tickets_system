
-- Requirements 2.1 for the Milestone :



-- 1) Creates All the tables in our database
CREATE PROCEDURE createAllTables
AS
CREATE TABLE Stadium(
id INT PRIMARY KEY IDENTITY,
status BIT,
location VARCHAR(20),
capacity INT,
name VARCHAR(20)
)
CREATE TABLE Club(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
location VARCHAR(20),
)
CREATE TABLE StadiumManager(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
username VARCHAR(20),
password VARCHAR(20),
s_id INT,
CONSTRAINT FK_MANAGER FOREIGN KEY (s_id) REFERENCES Stadium(id)
)
CREATE TABLE ClubRepresentative(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
username VARCHAR(20),
password VARCHAR(20),
c_id INT,
CONSTRAINT FK_REP FOREIGN KEY (c_id) REFERENCES Club(id)
)
CREATE TABLE Fan(
n_id VARCHAR(20) PRIMARY KEY,
phoneNo INT,
name VARCHAR(20),
address VARCHAR(20),
status BIT,
birthDate DATETIME,
username VARCHAR(20),
password VARCHAR(20)
)
CREATE TABLE SportAssociationManager(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
username VARCHAR(20),
password VARCHAR(20)
)
CREATE TABLE SystemAdmin(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
username VARCHAR(20),
password VARCHAR(20)
)

CREATE TABLE Match(
id INT PRIMARY KEY IDENTITY,
startTime DATETIME,
endTime   DATETIME,
s_id INT,
c_id_1 INT,
c_id_2 INT,
CONSTRAINT FK_MATCH_1 FOREIGN KEY (s_id) REFERENCES Stadium(id),
CONSTRAINT FK_MATCH_2 FOREIGN KEY (c_id_1) REFERENCES Club(id),
CONSTRAINT FK_MATCH_3 FOREIGN KEY (c_id_2) REFERENCES Club(id)
)
CREATE TABLE HostRequest(
id INT PRIMARY KEY IDENTITY,
status VARCHAR(20),
match_id int,
man_id int,
rep_id int,
CONSTRAINT FK_HOST_1 FOREIGN KEY (match_id) REFERENCES Match(id),
CONSTRAINT FK_HOST_2 FOREIGN KEY (man_id) REFERENCES StadiumManager(id),
CONSTRAINT FK_HOST_3 FOREIGN KEY (rep_id) REFERENCES ClubRepresentative(id)
)
CREATE TABLE Ticket(
id INT PRIMARY KEY IDENTITY,
status BIT,
f_id VARCHAR(20),
m_id INT,
CONSTRAINT FK_TICKET_1 FOREIGN KEY (f_id) REFERENCES Fan(n_id),
CONSTRAINT FK_TICKET_2 FOREIGN KEY (m_id) REFERENCES Match(id))

-- END (1)
-- EXECUTE createAllTables

-- 2) Drops all the tables in our database
CREATE PROCEDURE dropAllTables
AS 
DROP TABLE SystemAdmin
DROP TABLE SportAssociationManager
DROP TABLE Ticket
DROP TABLE Fan
DROP TABLE HostRequest
DROP TABLE StadiumManager
DROP TABLE ClubRepresentative
DROP TABLE Match
DROP TABLE Club
DROP TABLE Stadium

-- END (2)
-- EXECUTE dropAllTables


-- 3) Drops all procedures (except this one), views and functions in our database 
-- Note : Uncompleted yet
CREATE PROCEDURE dropAllProceduresFunctionsViews
AS
DROP PROCEDURE dropAllTables
DROP PROCEDURE createAllTables
DROP PROCEDURE clearAllTables
DROP PROCEDURE addRepresentative
DROP PROCEDURE viewAvailableStadiumsOn
DROP PROCEDURE addHostRequest
DROP FUNCTION allUnassignedMatches
DROP PROCEDURE addStadiumManager
DROP FUNCTION allPendingRequests
DROP PROCEDURE acceptRequest
DROP PROCEDURE rejectRequest
DROP PROCEDURE addFan
DROP FUNCTION upcomingMatchesOfClub
-- END (3)
-- EXECUTE dropAllProceduresFunctionsViews



-- 4) Clears all data in our tables
CREATE PROCEDURE clearAllTables
AS

-- Drop the constraints first in order to be able to truncate tables 
ALTER TABLE StadiumManager DROP CONSTRAINT FK_MANAGER 
ALTER TABLE ClubRepresentative DROP CONSTRAINT FK_REP
ALTER TABLE Match DROP CONSTRAINT FK_MATCH_1
ALTER TABLE Match DROP CONSTRAINT FK_MATCH_2
ALTER TABLE Match DROP CONSTRAINT FK_MATCH_3
ALTER TABLE HostRequest DROP CONSTRAINT FK_HOST_1
ALTER TABLE HostRequest DROP CONSTRAINT FK_HOST_2
ALTER TABLE HostRequest DROP CONSTRAINT FK_HOST_3
ALTER TABLE Ticket DROP CONSTRAINT FK_TICKET_1
ALTER TABLE Ticket DROP CONSTRAINT FK_TICKET_2

-- Truncate all tables
TRUNCATE TABLE SystemAdmin
TRUNCATE TABLE SportAssociationManager
TRUNCATE TABLE Ticket
TRUNCATE TABLE HostRequest
TRUNCATE TABLE Stadium
TRUNCATE TABLE Match
TRUNCATE TABLE Club
TRUNCATE TABLE ClubRepresentative
TRUNCATE TABLE StadiumManager
TRUNCATE TABLE Fan

-- Add the constraints again
ALTER TABLE StadiumManager ADD CONSTRAINT FK_MANAGER FOREIGN KEY (s_id) REFERENCES Stadium(id)
ALTER TABLE ClubRepresentative ADD CONSTRAINT FK_REP FOREIGN KEY (c_id) REFERENCES Club(id)
ALTER TABLE Match ADD CONSTRAINT  FK_MATCH_1 FOREIGN KEY (s_id) REFERENCES Stadium(id)
ALTER TABLE Match ADD CONSTRAINT FK_MATCH_2 FOREIGN KEY (c_id_1) REFERENCES Club(id)
ALTER TABLE Match ADD CONSTRAINT FK_MATCH_3 FOREIGN KEY (c_id_2) REFERENCES Club(id)
ALTER TABLE HostRequest ADD CONSTRAINT FK_HOST_1 FOREIGN KEY (match_id) REFERENCES Match(id)
ALTER TABLE HostRequest ADD CONSTRAINT FK_HOST_2 FOREIGN KEY (man_id) REFERENCES StadiumManager(id)
ALTER TABLE HostRequest ADD CONSTRAINT FK_HOST_3 FOREIGN KEY (rep_id) REFERENCES ClubRepresentative(id)
ALTER TABLE Ticket ADD CONSTRAINT FK_TICKET_1 FOREIGN KEY (f_id) REFERENCES Fan(n_id)
ALTER TABLE Ticket ADD CONSTRAINT FK_TICKET_2 FOREIGN KEY (m_id) REFERENCES Match(id)

-- END (4)
-- EXECUTE clearAllTables
--                                                              End part 2.1 in the milestone

-- Milestone Requirement 2.3 :

-- xiii)
-- Add a new club representative to the database
CREATE PROCEDURE addRepresentative
@name VARCHAR(20),
@clubName VARCHAR(20),
@userName VARCHAR(20),
@password VARCHAR(20)
AS
INSERT INTO ClubRepresentative VALUES(@name,@userName ,@password,(SELECT id FROM Club c WHERE c.name = @clubName))

-- End (xiii)



-- xiv) Get the stadiums free on an input date
CREATE PROCEDURE viewAvailableStadiumsOn
@date DATETIME
AS 
SELECT s.name,s.location,s.capacity FROM Stadium s LEFT JOIN Match m ON s.id = m.s_id WHERE s.status=0 
AND NOT EXISTS(
SELECT * FROM Match m2 WHERE (@date BETWEEN m2.startTime AND m2.endTime AND m2.s_id=s.id)
OR (DATEADD(HH,2,@date) BETWEEN m2.startTime AND m2.endTime AND m2.s_id=s.id)
)

-- END (xiv)


-- xv) add a new request to host the match
CREATE PROCEDURE addHostRequest
@clubName VARCHAR(20),
@stadiumName VARCHAR(20),
@startTime DATETIME
AS
INSERT INTO HostRequest VALUES('unhandled',
(SELECT m.id FROM Match m WHERE m.startTime=@startTime AND m.c_id_1 = (SELECT c.id FROM Club c WHERE c.name = @clubName)),
(SELECT r.id FROM ClubRepresentative r INNER JOIN Club c ON c.id=r.c_id WHERE c.name = @clubName),
(SELECT man.id FROM StadiumManager man INNER JOIN Stadium s ON s.id=man.s_id WHERE s.name = @stadiumName)
)

-- END (xv)

-- xvi) Returns info about the match hosted by the input club but not assigned to a stadium yet
CREATE FUNCTION [allUnassignedMatches]
(@clubName VARCHAR(20))
RETURNS TABLE
AS
RETURN SELECT c2.name AS guestName,m.startTime FROM Club c1 INNER JOIN Match m 
ON m.c_id_1=c1.id INNER JOIN Club c2 ON m.c_id_2=c2.id 
WHERE c1.name=@clubName AND m.s_id IS NULL

-- END (xvi)

-- xvii) Add a new stadium manager to the database
CREATE PROCEDURE addStadiumManager
@name VARCHAR(20),
@stadiumName VARCHAR(20),
@userName VARCHAR(20),
@password VARCHAR(20)
AS
INSERT INTO StadiumManager VALUES(@name,@userName,@password,(SELECT s.id FROM Stadium s WHERE s.name=@stadiumName))

-- END (xvii)


-- xviii) Returns info about all unhandled requests for the input stadium manager
CREATE FUNCTION [allPendingRequests]
(@userName VARCHAR(20))
RETURNS TABLE 
AS
RETURN SELECT rep.name AS representative, c2.name AS guestName, m.startTime FROM HostRequest h INNER JOIN StadiumManager s 
ON h.man_id=s.id INNER JOIN Match m on h.match_id=m.id INNER JOIN ClubRepresentative rep ON m.c_id_1=rep.c_id 
INNER JOIN Club c2 ON m.c_id_2=c2.id WHERE s.username=@userName AND h.status='unhandled'

-- END (xviii)

-- xix) Accept the request from club representative to host a match by setting the request status to be accepted and assign the stadium id to the match
CREATE PROCEDURE acceptRequest
@userName VARCHAR(20),
@hostName VARCHAR(20),
@guestName VARCHAR(20),
@startTime DATETIME
AS
UPDATE HostRequest
SET status='accepted'
WHERE man_id = (SELECT s.id FROM StadiumManager s WHERE s.username=@userName) AND 
match_id = (SELECT M.id FROM Match m INNER JOIN Club c1 ON m.c_id_1=c1.id INNER JOIN Club c2 ON m.c_id_2=c2.id
WHERE c1.name=@hostName AND c2.name=@guestName AND m.startTime = @startTime)
UPDATE Match
SET s_id= (SELECT s.id FROM Stadium s INNER JOIN StadiumManager m ON m.s_id=s.id WHERE m.username=@userName)
WHERE id = (SELECT M.id FROM Match m INNER JOIN Club c1 ON m.c_id_1=c1.id INNER JOIN Club c2 ON m.c_id_2=c2.id
WHERE c1.name=@hostName AND c2.name=@guestName AND m.startTime = @startTime)

-- END (xix)

-- xx) reject the request from the club representative 
CREATE PROCEDURE rejectRequest
@userName VARCHAR(20),
@hostName VARCHAR(20),
@guestName VARCHAR(20),
@startTime DATETIME
AS
UPDATE HostRequest
SET status='rejected'
WHERE man_id = (SELECT s.id FROM StadiumManager s WHERE s.username=@userName) AND 
match_id = (SELECT M.id FROM Match m INNER JOIN Club c1 ON m.c_id_1=c1.id INNER JOIN Club c2 ON m.c_id_2=c2.id
WHERE c1.name=@hostName AND c2.name=@guestName AND m.startTime = @startTime)

-- END (xx)

-- xxi) Add a new fan to the database
CREATE PROCEDURE addFan
@name VARCHAR(20),
@userName VARCHAR(20),
@password VARCHAR(20),
@nationalID VARCHAR(20),
@birthDate DATETIME,
@address VARCHAR(20),
@phoneNumber INT
AS
INSERT INTO Fan VALUES(@nationalID,@phoneNumber,@name,@address,0,@birthDate,@userName,@password)

-- END (xxi)

-- xxii) Get all coming matches for the input club 
CREATE FUNCTION [upcomingMatchesOfClub]
(@clubName VARCHAR(20))
RETURNS TABLE
AS
RETURN SELECT c1.name AS host, c2.name AS guest, m.startTime, s.name FROM Match m INNER JOIN Club c1 ON m.c_id_1=c1.id INNER JOIN Club c2 ON m.c_id_2=c2.id
INNER JOIN Stadium s ON m.s_id = s.id WHERE @clubName IN (c1.name, c2.name) AND (m.startTime > CURRENT_TIMESTAMP ) 

-- END (xxii)



--xxii) creating function upcomingMatchesOfClub
CREATE FUNCTION upcomingMatchesOfClub
(@clubName VARCHAR(20))
RETURNS TABLE 
AS
RETURN 
(
SELECT c1.name, c2.name, m.startTime, s.name
FROM Club c1 INNER JOIN Match m ON (m.c_id_1 = c1.id) INNER JOIN Club c2 ON (m.c_id_2 = c2.id) INNER JOIN Stadium s ON (s.id = m.s_id)
WHERE c1.name = @clubName AND c1.id <> c2.id AND m.startTime > CURRENT_TIMESTAMP
)

-- END (xxii)


-- xxiii) creating function availableMatchesToAttend
CREATE FUNCTION availableMatchesToAttend
(@theDate DATETIME)
RETURNS TABLE 
AS 
RETURN 
(
SELECT c1.name, c2.name, m.startTime, s.name
FROM Club c1 INNER JOIN Match m ON (m.c_id_1 = c1.id) INNER JOIN Club c2 ON (m.c_id_2 = c2.id) INNER JOIN Stadium s ON (s.id = m.s_id) INNER JOIN Ticket t ON (t.m_id = m.id)
WHERE exists (SELECT id FROM Ticket WHERE status = 0 AND m_id = m.id) AND m.startTime >= @theDate AND c1.id <> c2.id
)

-- END (xxiii)


-- xxiv) creating procedure purchaseTicket
CREATE PROCEDURE purchaseTicket 
(@natId VARCHAR(20), @hclubName VARCHAR(20), @gclubName VARCHAR(20), @startTime DATETIME)
AS
DECLARE @matchId int;
SELECT @matchId = m.id 
FROM Match m INNER JOIN Club c1 ON (m.c_id_1 = c1.id) INNER JOIN Club c2 ON (m.c_id_2 = c2.id)
WHERE c1.name = @hclubName AND c2.name = @gclubName AND c1.id <> c2.id AND m.startTime = @startTime;
DECLARE @ticketId int;
SELECT TOP 1 @ticketId = id
FROM Ticket 
WHERE status = 0 AND @matchId = m_id
UPDATE Ticket 
SET f_id = @natId , status = 1
WHERE id = @ticketId 


-- END (xxiv)

-- xxv) creating procedure updateMatchHost
CREATE PROCEDURE updateMatchHost 
(@hclubName VARCHAR(20), @gclubName VARCHAR(20), @startTime DATETIME)
AS
UPDATE Match 
SET c_id_1 = (SELECT id FROM Club WHERE name = gclubName) , c_id_2 = (SELECT id FROM Club WHERE name = hclubName)
WHERE id = (SELECT m.id 
FROM Match m INNER JOIN Club c1 ON (m.c_id_1 = c1.id) INNER JOIN Club c2 ON (m.c_id_2 = c2.id)
WHERE c1.name = @hclubName AND c2.name = @gclubName AND c1.id <> c2.id AND m.startTime = @startTime)

-- END (xxv) 

--xxvi) creating view matchesPerTeam 

CREATE VIEW matchesPerTeam
AS
SELECT c.name , count(m.id)
FROM Club c INNER JOIN Match m ON (m.c_id_1 = c.id OR m.c_id_2 = c.id)
WHERE m.startTime < CURRENT_TIMESTAMP
GROUP BY (c.name)

--END (xxvi)	

-- xxvii) creating view clubsNeverMatched
CREATE VIEW clubsNeverMatched 
AS 
SELECT c1.name, c2.name	
FROM Club c1, Club c2
WHERE NOT EXISTS (SELECT c1.name , c2.name 
					FROM Club c1, Club c2, Match m 
					WHERE m.c_id_1 = c1.id AND m.c_id_2 = c2.id )

--	END (xxvii)
