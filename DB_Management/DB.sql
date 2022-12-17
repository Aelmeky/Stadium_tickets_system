
-- Requirements 2.1 for the Milestone :



-- 1) Creates All the tables in our database
GO
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
username VARCHAR(20) UNIQUE,
password VARCHAR(20),
s_id INT,
CONSTRAINT FK_MANAGER FOREIGN KEY (s_id) REFERENCES Stadium(id) ON DELETE CASCADE ON UPDATE CASCADE
)
CREATE TABLE ClubRepresentative(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
username VARCHAR(20) UNIQUE,
password VARCHAR(20),
c_id INT,
CONSTRAINT FK_REP FOREIGN KEY (c_id) REFERENCES Club(id) ON DELETE CASCADE ON UPDATE CASCADE
)
CREATE TABLE Fan(
n_id VARCHAR(20) PRIMARY KEY,
phoneNo INT,
name VARCHAR(20),
address VARCHAR(20),
status BIT,
birthDate DATETIME,
username VARCHAR(20) UNIQUE,
password VARCHAR(20)
)
CREATE TABLE SportAssociationManager(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
username VARCHAR(20) UNIQUE,
password VARCHAR(20)
)
CREATE TABLE SystemAdmin(
id INT PRIMARY KEY IDENTITY,
name VARCHAR(20),
username VARCHAR(20) UNIQUE,
password VARCHAR(20)
)

CREATE TABLE Match(
id INT PRIMARY KEY IDENTITY,
startTime DATETIME,
endTime   DATETIME,
s_id INT,
c_id_1 INT,
c_id_2 INT,
CONSTRAINT FK_MATCH_1 FOREIGN KEY (s_id) REFERENCES Stadium(id) ON DELETE SET NULL,
CONSTRAINT FK_MATCH_2 FOREIGN KEY (c_id_1) REFERENCES Club(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_MATCH_3 FOREIGN KEY (c_id_2) REFERENCES Club(id)
)
CREATE TABLE HostRequest(
id INT PRIMARY KEY IDENTITY,
status VARCHAR(20),
match_id int,
man_id int,
rep_id int,
CONSTRAINT FK_HOST_1 FOREIGN KEY (match_id) REFERENCES Match(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_HOST_2 FOREIGN KEY (man_id) REFERENCES StadiumManager(id),
CONSTRAINT FK_HOST_3 FOREIGN KEY (rep_id) REFERENCES ClubRepresentative(id)
)
CREATE TABLE Ticket(
id INT PRIMARY KEY IDENTITY,
status BIT,
f_id VARCHAR(20),
m_id INT,
CONSTRAINT FK_TICKET_1 FOREIGN KEY (f_id) REFERENCES Fan(n_id),
CONSTRAINT FK_TICKET_2 FOREIGN KEY (m_id) REFERENCES Match(id) ON DELETE CASCADE ON UPDATE CASCADE)
GO


-- END (1)


-- 2) Drops all the tables in our database
GO
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
GO

-- END (2)



-- 3) Drops all procedures (except this one), views and functions in our database 
GO
CREATE PROCEDURE dropAllProceduresFunctionsViews
AS
DROP PROCEDURE dropAllTables
DROP PROCEDURE createAllTables
DROP PROCEDURE clearAllTables
DROP VIEW allAssocManagers
DROP VIEW allClubRepresentatives
DROP VIEW allStadiumManagers
DROP VIEW allFans
DROP VIEW allMatches
DROP VIEW allTickets
DROP VIEW allCLubs
DROP VIEW allStadiums
DROP VIEW allRequests
DROP PROCEDURE addAssociationManager
DROP PROCEDURE addNewMatch
DROP VIEW clubsWithNoMatches
DROP PROCEDURE deleteMatch
DROP PROCEDURE deleteMatchesOnStadium
DROP PROCEDURE addClub
DROP PROCEDURE addTicket
DROP PROCEDURE deleteClub
DROP PROCEDURE addStadium
DROP PROCEDURE deleteStadium
DROP PROCEDURE blockFan
DROP PROCEDURE unblockFan
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
DROP FUNCTION availableMatchesToAttend
DROP PROCEDURE purchaseTicket
DROP PROCEDURE updateMatchHost
DROP VIEW matchesPerTeam
DROP VIEW clubsNeverMatched
DROP FUNCTION clubsNeverPlayed
DROP FUNCTION matchWithHighestAttendance
DROP FUNCTION matchesRankedByAttendance
DROP FUNCTION requestsFromClub
GO
-- END (3)
-- EXECUTE dropAllProceduresFunctionsViews



-- 4) Clears all data in our tables
GO
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
GO
-- END (4)
-- EXECUTE clearAllTables
--                                                              End part 2.1 in the milestone
-- start of part 2.2 "Basic Data Retrieval"

GO
CREATE VIEW allAssocManagers AS
SELECT username, password, name 
FROM SportAssociationManager
GO


GO
CREATE VIEW allClubRepresentatives AS 
SELECT rep.username, rep.password, rep.name AS representative_name, c.name AS club_name
FROM ClubRepresentative rep INNER JOIN Club c on rep.c_id = c.id
GO


GO
CREATE VIEW allStadiumManagers AS
SELECT manager.username, manager.password, manager.name AS manager_name, stad.name AS stadium_name
FROM StadiumManager manager INNER JOIN Stadium stad on manager.s_id = stad.id
GO


GO
CREATE VIEW allFans AS
SELECT username, password, name, n_id AS national_id, status AS blocked, birthDate
FROM Fan
GO


GO
CREATE VIEW allMatches AS
SELECT mat.startTime, c1.name AS host_club_name, c2.name AS guest_club_name
FROM MATCH mat INNER JOIN Club c1 on mat.c_id_1 = c1.id INNER JOIN Club c2 on mat.c_id_2 = c2.id
GO


GO
CREATE VIEW allTickets AS
SELECT c1.name AS host_club_name,c2.name AS guest_club_name, mat.startTime AS start_time, stad.name AS stadium_name
FROM Ticket tic INNER JOIN Match mat on tic.m_id = mat.id INNER JOIN Club c1 on mat.c_id_1 = c1.id 
INNER JOIN Club c2 on mat.c_id_2 = c2.id INNER JOIN Stadium stad on mat.s_id = stad.id
GO



GO
CREATE VIEW allCLubs AS 
SELECT name, location 
FROM Club
GO

GO
CREATE VIEW allStadiums AS
SELECT name, capacity, location, status AS available
FROM Stadium
GO


GO
CREATE VIEW allRequests AS
SELECT clubRep.username AS club_representative_username, stadMan.username AS stadium_manager_username, hostReq.status AS status
FROM HostRequest hostReq INNER JOIN ClubRepresentative clubRep on hostReq.rep_id = clubRep.id 
INNER JOIN StadiumManager stadMan on hostReq.man_id = stadMan.id 
GO


-- end of part 2.2

-- Milestone Requirement 2.3 :
-- i)

GO
CREATE PROCEDURE addAssociationManager 
@name varchar(20),@username varchar(20), @password varchar(20)
AS
INSERT INTO SportAssociationManager values(@name, @username, @password)
GO

-- ii)
GO
CREATE PROCEDURE addNewMatch 
@host_club_name varchar(20), @guest_club_name varchar(20), @start_time datetime, @end_time datetime
AS
INSERT INTO Match values (@start_time, @end_time, null,(SELECT c1.id FROM Club c1 WHERE c1.name=@host_club_name), (SELECT c2.id FROM Club c2 WHERE c2.name=@guest_club_name))
GO



-- iii)
GO
CREATE VIEW clubsWithNoMatches AS
SELECT Club.name
FROM Club LEFT JOIN Match ON Club.id = Match.c_id_1 OR Club.id = Match.c_id_2
WHERE Match.id IS NULL;
GO
-- End (iii)

-- iv)
GO
CREATE PROCEDURE deleteMatch
@host VARCHAR(20),
@guest VARCHAR(20)
AS
DELETE FROM Match
WHERE 
Match.c_id_1 = (SELECT id FROM Club WHERE Club.name = @host) 
AND
Match.c_id_2 = (SELECT id FROM Club WHERE Club.name = @guest);
GO
-- End (iv)


-- v)
GO
CREATE PROCEDURE deleteMatchesOnStadium
@std_name VARCHAR(20)
AS
DELETE FROM Match
WHERE 
(Match.s_id = (SELECT id FROM Stadium WHERE Stadium.name = @std_name))
AND
Match.startTime > CURRENT_TIMESTAMP
GO


-- End (v)

-- vi)

GO
CREATE PROCEDURE addClub
@club_name VARCHAR(20),
@club_loc VARCHAR(20)
AS
INSERT INTO Club VALUES (@club_name,@club_loc);
GO

-- End (vi)

-- vii)

GO
CREATE PROCEDURE addTicket
@host_club VARCHAR(20),
@guest_club VARCHAR(20),
@start DATETIME
AS
INSERT INTO Ticket(status,f_id,m_id)
VALUES (1,NULL,
(SELECT Match.id FROM Match,Club C1, Club C2
WHERE Match.c_id_1 = C1.id AND Match.c_id_2 = C2.id AND
C1.name = @host_club AND C2.name = @guest_club AND
Match.startTime = @start))
GO

-- End (vii)


-- viii)
GO
CREATE PROCEDURE deleteClub
@club_name VARCHAR(20)
AS
DELETE FROM Club WHERE Club.name = @club_name
GO

-- End(viii)


-- ix)
GO
CREATE PROCEDURE addStadium
@std_name VARCHAR(20),
@std_loc VARCHAR(20),
@cap INT
AS
INSERT INTO Stadium(name,status,location,capacity) VALUES (@std_name, 1, @std_loc, @cap);
GO

-- End(ix)

-- x)
GO
CREATE PROCEDURE deleteStadium
@std_name VARCHAR(20)
AS
DELETE FROM Stadium WHERE Stadium.name = @std_name
GO
-- End(x)


-- xi)

GO
CREATE PROCEDURE blockFan
@n_id VARCHAR(20)
AS
UPDATE Fan SET status = 0  WHERE Fan.n_id = @n_id
GO
-- End(xi)


-- xii)

GO
CREATE PROCEDURE unblockFan
@n_id VARCHAR(20)
AS
UPDATE Fan SET status = 1  WHERE Fan.n_id = @n_id
GO
-- End(xii)


-- xiii)
-- Add a new club representative to the database
GO
CREATE PROCEDURE addRepresentative
@name VARCHAR(20),
@clubName VARCHAR(20),
@userName VARCHAR(20),
@password VARCHAR(20)
AS
INSERT INTO ClubRepresentative VALUES(@name,@userName ,@password,(SELECT id FROM Club c WHERE c.name = @clubName))
GO
-- End (xiii)



-- xiv) Get the stadiums free on an input date
GO
CREATE FUNCTION viewAvailableStadiumsOn
(@date DATETIME)
RETURNS TABLE
AS 
RETURN
SELECT s.name,s.location,s.capacity FROM Stadium s LEFT JOIN Match m ON s.id = m.s_id WHERE s.status=1 
AND NOT EXISTS(
SELECT * FROM Match m2 WHERE (@date BETWEEN m2.startTime AND m2.endTime AND m2.s_id=s.id)
OR (DATEADD(HH,2,@date) BETWEEN m2.startTime AND m2.endTime AND m2.s_id=s.id)
)
GO
-- END (xiv)
 

-- xv) add a new request to host the match
GO
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
GO
-- END (xv)

-- xvi) Returns info about the match hosted by the input club but not assigned to a stadium yet
GO
CREATE FUNCTION [allUnassignedMatches]
(@clubName VARCHAR(20))
RETURNS TABLE
AS
RETURN SELECT c2.name AS guestName,m.startTime FROM Club c1 INNER JOIN Match m 
ON m.c_id_1=c1.id INNER JOIN Club c2 ON m.c_id_2=c2.id 
WHERE c1.name=@clubName AND m.s_id IS NULL
GO
-- END (xvi)

-- xvii) Add a new stadium manager to the database
GO
CREATE PROCEDURE addStadiumManager
@name VARCHAR(20),
@stadiumName VARCHAR(20),
@userName VARCHAR(20),
@password VARCHAR(20)
AS
INSERT INTO StadiumManager VALUES(@name,@userName,@password,(SELECT s.id FROM Stadium s WHERE s.name=@stadiumName))
GO
-- END (xvii)


-- xviii) Returns info about all unhandled requests for the input stadium manager
GO
CREATE FUNCTION [allPendingRequests]
(@userName VARCHAR(20))
RETURNS TABLE 
AS
RETURN SELECT rep.name AS representative, c2.name AS guestName, m.startTime FROM HostRequest h INNER JOIN StadiumManager s 
ON h.man_id=s.id INNER JOIN Match m on h.match_id=m.id INNER JOIN ClubRepresentative rep ON m.c_id_1=rep.c_id 
INNER JOIN Club c2 ON m.c_id_2=c2.id WHERE s.username=@userName AND h.status='unhandled'
GO
-- END (xviii)

-- xix) Accept the request from club representative to host a match by setting the request status to be accepted and assign the stadium id to the match
GO
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
GO
-- END (xix)

-- xx) reject the request from the club representative 
GO
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
GO
-- END (xx)

-- xxi) Add a new fan to the database
GO
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
GO
-- END (xxi)

-- xxii) Get all coming matches for the input club 
GO
CREATE FUNCTION [upcomingMatchesOfClub]
(@clubName VARCHAR(20))
RETURNS TABLE
AS
RETURN SELECT c1.name AS host, c2.name AS guest, m.startTime, s.name FROM Match m INNER JOIN Club c1 ON m.c_id_1=c1.id INNER JOIN Club c2 ON m.c_id_2=c2.id
INNER JOIN Stadium s ON m.s_id = s.id WHERE @clubName IN (c1.name, c2.name) AND (m.startTime > CURRENT_TIMESTAMP ) 
GO
-- END (xxii)





-- xxiii) creating function availableMatchesToAttend
GO
CREATE FUNCTION availableMatchesToAttend
(@theDate DATETIME)
RETURNS TABLE 
AS 
RETURN 
(
SELECT c1.name as host, c2.name as guest , m.startTime, s.name
FROM Club c1 INNER JOIN Match m ON (m.c_id_1 = c1.id) INNER JOIN Club c2 ON (m.c_id_2 = c2.id) INNER JOIN Stadium s ON (s.id = m.s_id) 
WHERE exists (SELECT id FROM Ticket WHERE status = 1 AND m_id = m.id) AND m.startTime >= @theDate 
)
GO
-- END (xxiii)


-- xxiv) creating procedure purchaseTicket
GO
CREATE PROCEDURE purchaseTicket 
(@natId VARCHAR(20), @hclubName VARCHAR(20), @gclubName VARCHAR(20), @startTime DATETIME)
AS
DECLARE @fstatus int;
SELECT @fstatus = status 
FROM Fan
WHERE n_id = @natId 
IF (@fstatus = 1)
	BEGIN
	DECLARE @matchId int;
	SELECT @matchId = m.id 
	FROM Match m INNER JOIN Club c1 ON (m.c_id_1 = c1.id) INNER JOIN Club c2 ON (m.c_id_2 = c2.id)
	WHERE c1.name = @hclubName AND c2.name = @gclubName AND m.startTime = @startTime;
	DECLARE @ticketId int;
	SELECT TOP 1 @ticketId = id
	FROM Ticket 
	WHERE status = 1 AND @matchId = m_id
	UPDATE Ticket 
	SET f_id = @natId , status = 0
	WHERE id = @ticketId 
	END
GO
-- END (xxiv)

-- xxv) creating procedure updateMatchHost
GO
CREATE PROCEDURE updateMatchHost 
(@hclubName VARCHAR(20), @gclubName VARCHAR(20), @startTime DATETIME)
AS
UPDATE Match 
SET c_id_1 = (SELECT id FROM Club WHERE name = @gclubName) , c_id_2 = (SELECT id FROM Club WHERE name = @hclubName)
WHERE id = (SELECT m.id 
FROM Match m INNER JOIN Club c1 ON (m.c_id_1 = c1.id) INNER JOIN Club c2 ON (m.c_id_2 = c2.id)
WHERE c1.name = @hclubName AND c2.name = @gclubName AND m.startTime = @startTime)
GO
-- END (xxv) 

--xxvi) creating view matchesPerTeam 
GO
CREATE VIEW matchesPerTeam
AS
SELECT c.name , count(m.id) AS nummatches
FROM Club c INNER JOIN Match m ON (m.c_id_1 = c.id OR m.c_id_2 = c.id)
WHERE m.startTime < CURRENT_TIMESTAMP
GROUP BY (c.name)
GO
--END (xxvi)	

-- xxvii) creating view clubsNeverMatched
GO
CREATE VIEW clubsNeverMatched 
AS 
SELECT c1.name AS host, c2.name	AS guest
FROM Club c1, Club c2
WHERE c1.id < c2.id
except (SELECT c1.name , c2.name 
					FROM Club c1, Club c2, Match m 
					WHERE m.c_id_1 IN (c1.id,c2.id) AND m.c_id_2 IN (c1.id,c2.id) AND CURRENT_TIMESTAMP >= m.endTime )
GO
--	END (xxvii)

-- xxviii) creating function clubsNeverPlayed
GO
CREATE FUNCTION clubsNeverPlayed
(@clubName VARCHAR(20))
RETURNS TABLE
AS
RETURN 
SELECT c.name	
FROM Club c
WHERE c.name <> @clubName
except(SELECT c.name	
		FROM Club c, Club c1, Match m 
		WHERE m.c_id_1 IN (c.id,c1.id) AND m.c_id_2 IN (c.id,c1.id) AND c1.name = @clubName AND CURRENT_TIMESTAMP >= m.endTime)
GO



-- xxiv) creating function matchWithHighestAttendance
GO
CREATE FUNCTION matchWithHighestAttendance()
RETURNS TABLE 
AS
RETURN 									
(
SELECT host, guest 
FROM (
SELECT host, guest, dense_rank() over (order by cou desc) as number
FROM(
SELECT c1.name AS host, c2.name AS guest, count(t.id) as cou
FROM Club c1 INNER JOIN Match m ON (c1.id = m.c_id_1) INNER JOIN Club c2 ON (c2.id = m.c_id_2) INNER JOIN Ticket t ON (t.m_id = m.id)
WHERE t.status = 0 AND CURRENT_TIMESTAMP > m.endTime
group by c1.name , c2.name
) as l

) AS L1
where number =1
)
GO
-- xxx) creating function matchesRankedByAttendance
GO
CREATE FUNCTION matchesRankedByAttendance ()
RETURNS TABLE 
AS 
RETURN 
(
SELECT host, guest 
FROM (
SELECT host, guest, rank() over (order by cou desc) as number
FROM(
SELECT c1.name AS host, c2.name AS guest, count(t.id) as cou
FROM Club c1 INNER JOIN Match m ON (c1.id = m.c_id_1) INNER JOIN Club c2 ON (c2.id = m.c_id_2) INNER JOIN Ticket t ON (t.m_id = m.id)
WHERE t.status = 0 AND CURRENT_TIMESTAMP > m.endTime
group by c1.name , c2.name
) as l
) AS L1
)
GO

-- xxvi) creating function requestsFromClub
GO
CREATE FUNCTION requestsFromClub
(@stadName varchar(20), @clubName varchar(20))
RETURNS TABLE 
AS 
RETURN 
SELECT c1.name as host ,c2.name as guest
FROM Club c1 INNER JOIN Match m ON (c1.id = m.c_id_1) INNER JOIN Club c2 ON (m.c_id_2 = c2.id)
INNER JOIN HostRequest h ON (h.match_id = m.id ) INNER JOIN ClubRepresentative cr ON (h.rep_id = cr.id ) 
INNER JOIN Stadium s ON (s.id = m.s_id) INNER JOIN Club c3 ON (c3.id = cr.id)
WHERE s.name = @stadName AND @clubName = c3.name  
GO









-- to test 
select * from StadiumManager
INSERT INTO Stadium values (1, 'Cairo', 20000, 'stadium1')
INSERT INTO Stadium values (1, 'Alex', 30000, 'stadium2')
INSERT INTO Stadium values (0, 'Suez', 30000, 'stadium3')
INSERT INTO Club values ('club1','Egypt')
insert into Club values ('club2', 'Egypt')
insert into Club values ('club3', 'Egypt')
insert into Club values ('club4', 'Egypt')
insert into StadiumManager values ('manager1', 'manager1username', '123',1)
insert into StadiumManager values ('manager2', 'manager2username', '123',2)
insert into StadiumManager values ('manager3', 'manager3username', '123',3)
insert into ClubRepresentative values ('representative1', 'rep1username', '123', 1)
insert into ClubRepresentative values ('representative2', 'rep2username', '123', 3)
insert into ClubRepresentative values ('representative3', 'rep3username', '123', 2)
insert into ClubRepresentative values ('representative4', 'rep4username', '123', 4)
insert into Fan values ('1', 123, 'fan1', 'address1', 1, '2002-1-2 01:10:59', 'fan1username', '123')
insert into Fan values ('2',456, 'fan2', 'address2', 1, '2002-1-3 01:10:59', 'fan2username', '123')
insert into Fan values ('3', 789, 'fan3', 'address3', 0, '2002-1-3 01:10:59', 'fan3username', '123')
insert into SportAssociationManager values ('manager1', 'managerusername','123')
insert into SystemAdmin values ('adminName', 'adminUsername', '123')
insert into Match values ('2022-12-15 01:00:00', '2022-12-15 03:00:00', 1, 2,3)
insert into Match values ('2021-12-15 01:00:00', '2021-12-15 03:00:00', 1, 1,3)
insert into Match values ('2023-12-15 01:00:00', '2023-12-15 03:00:00', 1, 1,4)
insert into HostRequest values ('accepted', 2, 1, 1)
insert into HostRequest values (1, 2, 1, 3)
insert into HostRequest values (1, 2, 1, 1)
insert into Ticket values (1,'1', 2)
insert into Ticket values (1,'2', 2)
insert into Ticket values (0,'3', 1)
insert into Ticket values (0,null, 1)
