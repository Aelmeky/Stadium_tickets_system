<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepresentativeClubInfo.aspx.cs" Inherits="stadium_tickets_system.RepresentativeClubInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
                   html,body{
            height:100%;
            margin:0;
        }
        * {
            padding: 0;
            margin: 0;
        }
               .backgnd {
            
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(Helper/background.jpg);
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
        .button {
          background-color: dimgrey;
          border: thin;
          color: black;
          padding: 16px 32px;
          margin-top: 23px;
          margin-bottom:31px;
          text-align: center;
          font-size: 16px;
          opacity: 0.7;
          transition: 0.3s;
          display: inline-block;
          text-decoration: none;
          cursor: pointer;
        }
        .button:hover {opacity: 1}

         .select {
            display: inline-block;
            width: 200px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            background-color: white;
        }
        /* Style the arrow inside the select element */
        .select after {
        background-position: center;
        background-repeat: no-repeat;
        width: 20px;
        height: 20px;
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        pointer-events: none;
      }
  /* Style the options inside the select element */
        .select option {
        color: black;
        background-color: white;
        display: flex;
        white-space: pre;
        min-height: 20px;
        padding: 12px;
      }


     h2 ,h1{
            font-weight:bolder;
            color: #70362a;
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
            <h1>Club Information</h1>

             <asp:Table ID="infoTable" runat="server" class="rwd-table">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>
                        Club ID
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Club Name
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Location
                    </asp:TableHeaderCell>

                </asp:TableHeaderRow>
                
            </asp:Table>
        </div>
    </form>
</body>
</html>
