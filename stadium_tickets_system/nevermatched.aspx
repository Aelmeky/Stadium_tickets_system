﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nevermatched.aspx.cs" Inherits="stadium_tickets_system.nevermatched" %>

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
                     <asp:LinkButton ID="alreadypalyedmatches" runat="server" Text="view already palyed matches" OnClick="alreadyplayedmatches" />
            </div>
        <div>
            The club names who never scheduled to play with each other</div>
        <asp:Table ID="never" runat="server" CssClass ="table">
                <asp:TableHeaderRow>
                <asp:TableHeaderCell>Host club</asp:TableHeaderCell>
                <asp:TableHeaderCell>Guest club</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </form>
</body>
</html>