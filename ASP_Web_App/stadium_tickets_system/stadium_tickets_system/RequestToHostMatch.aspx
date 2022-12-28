<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestToHostMatch.aspx.cs" Inherits="stadium_tickets_system.RequestToHostMatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Request To Host a Match</h1>
            <h2>Matches</h2>
           <asp:DropDownList ID="ddlmat" runat="server" Width="596px"></asp:DropDownList>
           <asp:Button ID="selmat" runat="server" Text="View Stadiums" onClick ="ViewStds"/>
             
            <h2>Stadiums</h2>

            <asp:DropDownList ID="ddlstd" runat="server" Width="478px"></asp:DropDownList>
            <asp:Button ID="selstd" runat="server" Text="Make a Request" OnClick ="MakeReq" /><br /><br />
            <asp:Label ID="msg" runat="server" Text="Please select a match and a stadium to make a host request."></asp:Label>

        </div>
    </form>
</body>
</html>
