<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nevermatched.aspx.cs" Inherits="stadium_tickets_system.nevermatched" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            The club names who never scheduled to play with each other</div>
        <asp:Table ID="never" runat="server">
                <asp:TableHeaderRow>
                <asp:TableHeaderCell>Host club</asp:TableHeaderCell>
                <asp:TableHeaderCell>Guest club</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </form>
</body>
</html>
