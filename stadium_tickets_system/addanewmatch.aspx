<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addanewmatch.aspx.cs" Inherits="stadium_tickets_system.addanewmatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="please add the new match here"></asp:Label>


        </div>
      
              Host Club&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Guest Club:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Start Time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EndTime:


        <p>
            <asp:TextBox ID="hostclub1" runat="server"></asp:TextBox>
            <asp:TextBox ID="guestclub1" runat="server"></asp:TextBox>
             <asp:TextBox ID="starttime" runat="server"></asp:TextBox>
             <asp:TextBox ID="endtime" runat="server"></asp:TextBox>
       
      
        <p>
       
      
        <asp:Button ID="addingmatch" runat="server" Text="add the match" OnClick="addingmatch_Click" />
      
        </p>
      
    </form>
   
</body>
</html>
