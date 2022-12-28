﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpcomingMatches.aspx.cs" Inherits="stadium_tickets_system.UpcomingMatches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style>
       .backgnd {
            
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(background.jpg);
        }
       .topnav {
            background-color: #333;
            overflow: hidden;
        }

     
       .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
       }

        .topnav a:hover {
            background-color: white;
            color: black;
        }
         @import "compass/css3";
 @import "https://fonts.googleapis.com/css?family=Montserrat:300,400,700";
 .rwd-table {
	 margin: 1em 0;
	 min-width: 300px;
}
 .rwd-table tr {
	 border-top: 1px solid #ddd;
	 border-bottom: 1px solid #ddd;
}
 .rwd-table th {
	 display: none;
}
 .rwd-table td {
	 display: block;
}
 .rwd-table td:first-child {
	 padding-top: 0.5em;
}
 .rwd-table td:last-child {
	 padding-bottom: 0.5em;
}
 .rwd-table td:before {
	 content: attr(data-th) ": ";
	 font-weight: bold;
	 width: 6.5em;
	 display: inline-block;
}
 @media (min-width: 480px) {
	 .rwd-table td:before {
		 display: none;
	}
}
 .rwd-table th, .rwd-table td {
	 text-align: left;
}
 @media (min-width: 480px) {
	 .rwd-table th, .rwd-table td {
		 display: table-cell;
		 padding: 0.25em 0.5em;
	}
	 .rwd-table th:first-child, .rwd-table td:first-child {
		 padding-left: 0;
	}
	 .rwd-table th:last-child, .rwd-table td:last-child {
		 padding-right: 0;
	}
}
 body {
	 padding: 0 2em;
	 font-family: Montserrat, sans-serif;
	 -webkit-font-smoothing: antialiased;
	 text-rendering: optimizeLegibility;
	 color: #444;
	 background: #eee;
}
 h1 {
	 font-weight: normal;
	 letter-spacing: -1px;
	 color: #34495e;
}
h2 {
        font-weight:bolder;
        color: #70362a;
        }
 .rwd-table {
	 background: #34495e;
	 color: #fff;
	 border-radius: 0.4em;
	 overflow: hidden;
}
 .rwd-table tr {
	 border-color: #46637f;
}
 .rwd-table th, .rwd-table td {
	 margin: 0.5em 1em;
}
 @media (min-width: 480px) {
	 .rwd-table th, .rwd-table td {
		 padding: 1em !important;
	}
}
 .rwd-table th, .rwd-table td:before {
	 color: #dd5;
}

    </style>

</head>
<body class ="backgnd">
    <form id="form1" runat="server">
        <div class="topnav">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="goClubInfo">View Club Info</asp:LinkButton>
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="goUpcomingMatches">View Upcoming Matches</asp:LinkButton>
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="goAvailableStadiums">View Available Stadiums</asp:LinkButton>
            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="goHostReq">Make Host Request</asp:LinkButton>

        </div>
        <div>
            <h1>Upcoming Matches</h1>
            <h2>Upcoming Matches that is assigned to a Stadium</h2>
            <asp:Table ID="upcomingMatchesTableWithStadium" runat="server" class="rwd-table">
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
            <asp:Table ID="upcomingMatchesTableWithoutStadium" runat="server" class="rwd-table">
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
