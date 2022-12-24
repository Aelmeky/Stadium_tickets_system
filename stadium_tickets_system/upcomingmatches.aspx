<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upcomingmatches.aspx.cs" Inherits="stadium_tickets_system.upcomingmatches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            all the upcoming matches</div>
        <asp:Table ID="upcoming" runat="server">
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
