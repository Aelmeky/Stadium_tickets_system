<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportManager.aspx.cs" Inherits="stadium_tickets_system.SportManager" %>

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
    </style>
    
</head>
<body>
    <div class="container">
        <form id="form1" runat="server" >
        <div class="topnav">
                     <asp:LinkButton ID="addnewmatch" runat="server" OnClick="addanewmatch" > add New Match</asp:LinkButton>
                     <asp:LinkButton ID="deleteamatch" runat="server" Text="delete a match" OnClick="deleteaMatch" />
                     <asp:LinkButton ID="upcomingmatches" runat="server" Text="view all upcoming matches" OnClick="allupcomingmatches"/>
                     <asp:LinkButton ID="alreadypalyedmatches" runat="server" Text="view already palyed matches" OnClick="alreadyplayedmatches" />
                     <asp:LinkButton ID="neverscheduled" runat="server" Text="view clubs never matched"  OnClick="nevermatched"/>
            </div>
       
    </form>
    </div>
</body>
</html>
