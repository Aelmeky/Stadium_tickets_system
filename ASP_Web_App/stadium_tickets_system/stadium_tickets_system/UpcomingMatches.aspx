<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpcomingMatches.aspx.cs" Inherits="stadium_tickets_system.UpcomingMatches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Upcoming Matches</h1>
            <h2>Upcoming Matches that is assigned to a Stadium</h2>
            <asp:Table ID="upcomingMatchesTableWithStadium" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>
                        Host Club
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Guest Club
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Start Time
                    </asp:TableHeaderCell>


                    <asp:TableHeaderCell>
                        End Time
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Stadium Name
                    </asp:TableHeaderCell>
                </asp:TableHeaderRow>
                
            </asp:Table>

            <h2>Upcoming Matches that is not assigned to a Stadium</h2>
            <asp:Table ID="upcomingMatchesTableWithoutStadium" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>
                        Host Club
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Guest Club
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Start Time
                    </asp:TableHeaderCell>


                    <asp:TableHeaderCell>
                        End Time
                    </asp:TableHeaderCell>

                </asp:TableHeaderRow>
                
            </asp:Table>
        </div>
    </form>
</body>
</html>
