<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="alreadyplayed.aspx.cs" Inherits="stadium_tickets_system.alreadyplayed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <style>
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
           *{
               padding:0;
               margin:0;
           }
           .container {
            height:986px;
            width:100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(Helper/background.jpg);
            }
                      .table{
                 border-collapse: collapse;
                 border: 1px solid black;
                 padding: 8px;

                 margin-left: auto;
                 margin-right:auto;
           }
           .table th, td {
	        border: 1px solid black;
	            padding: 8px;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="topnav">
                     <asp:LinkButton ID="addnewmatch" runat="server" OnClick="addanewmatch" > add New Match</asp:LinkButton>
                     <asp:LinkButton ID="deleteamatch" runat="server" Text="delete a match" OnClick="deleteaMatch" />
                     <asp:LinkButton ID="upcomingmatches" runat="server" Text="view all upcoming matches" OnClick="allupcomingmatches"/>
                     <asp:LinkButton ID="neverscheduled" runat="server" Text="view clubs never matched"  OnClick="nevermatched"/>
            </div>
        <div>
            The Already Played Matches</div>
        <asp:Table ID="playedmactes" runat="server" CssClass="table">
             <asp:TableHeaderRow>
                <asp:TableHeaderCell>host club</asp:TableHeaderCell>
                <asp:TableHeaderCell>guest club</asp:TableHeaderCell>
                <asp:TableHeaderCell>start time</asp:TableHeaderCell>
                <asp:TableHeaderCell>end time</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </form>
</body>
</html>
