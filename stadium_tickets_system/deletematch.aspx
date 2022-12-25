<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deletematch.aspx.cs" Inherits="stadium_tickets_system.deletematch" %>

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
    <form id="form1" runat="server">
         <div class="topnav">
                     <asp:LinkButton ID="addnewmatch" runat="server" OnClick="addanewmatch" > add New Match</asp:LinkButton>
                     <asp:LinkButton ID="upcomingmatches" runat="server" Text="view all upcoming matches" OnClick="allupcomingmatches"/>
                     <asp:LinkButton ID="alreadypalyedmatches" runat="server" Text="view already palyed matches" OnClick="alreadyplayedmatches" />
                     <asp:LinkButton ID="neverscheduled" runat="server" Text="view clubs never matched"  OnClick="nevermatched"/>
            </div>
        <div>
           <h1> delete the match you want </h1></div>
        <div>
            Host Club:
             <asp:DropDownList ID="DropDownListhost1" runat="server">
             </asp:DropDownList>
        </div>
       <div>
           Guest Club:
           <asp:DropDownList ID="DropDownguest1" runat="server">
             </asp:DropDownList>

       </div>
        <div>
            Start time:
                    <input id="starttime1" type="datetime-local" runat="server" />
        </div>
        <div>
            End time:
               <input id="endtime1" type="datetime-local" runat="server" />
        </div>

        <asp:Button ID="deletema" runat="server" Text="delete" OnClick="deletema_Click" />
    </form>
</body>
</html>
