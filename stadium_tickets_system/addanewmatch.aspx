<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addanewmatch.aspx.cs" Inherits="stadium_tickets_system.addanewmatch" %>

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
 </style>
</head>
<body>
    <form id="form1" runat="server">
          <div class="topnav">
                     <asp:LinkButton ID="deleteamatch" runat="server" Text="delete a match" OnClick="deleteaMatch" />
                     <asp:LinkButton ID="upcomingmatches" runat="server" Text="view all upcoming matches" OnClick="allupcomingmatches"/>
                     <asp:LinkButton ID="alreadypalyedmatches" runat="server" Text="view already palyed matches" OnClick="alreadyplayedmatches" />
                     <asp:LinkButton ID="neverscheduled" runat="server" Text="view clubs never matched"  OnClick="nevermatched"/>
            </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="please add the new match here"></asp:Label>
        </div>
        <div>
             Host Club:
             <asp:DropDownList ID="DropDownListhost" runat="server">
             </asp:DropDownList>
        </div>
        <div>

            Guest Club:
             <asp:DropDownList ID="DropDownListguest" runat="server">
             </asp:DropDownList>
        </div>
        <div>
             Start Time:
             <input id="starttime" type="datetime-local" runat="server" />
           
        </div>
        <div>
            EndTime:
             <input id="endtime" type="datetime-local" runat="server" />
        </div>
        

      
        <asp:Button ID="addingmatch" runat="server" Text="add the match" OnClick="addingmatch_Click" />
        
    </form>
   
</body>
</html>
