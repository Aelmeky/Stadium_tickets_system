<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deletematch.aspx.cs" Inherits="stadium_tickets_system.deletematch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            delete the match you want</div>

        Host Club:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Guest Club:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; End time:<br />
        <asp:TextBox ID="hostclub2" runat="server"></asp:TextBox>
        <asp:TextBox ID="guestclub2" runat="server"></asp:TextBox>
        <asp:TextBox ID="starttime1" runat="server"></asp:TextBox>
        <asp:TextBox ID="endtime1" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="deletema" runat="server" Text="delete" OnClick="deletema_Click" />
    </form>
</body>
</html>
