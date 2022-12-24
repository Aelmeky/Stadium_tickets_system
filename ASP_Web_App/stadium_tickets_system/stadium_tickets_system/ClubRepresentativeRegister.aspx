<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentativeRegister.aspx.cs" Inherits="stadium_tickets_system.ClubRepresentativeRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id ="form1" runat ="server">
        <div>
                <h1>Club Representative Register</h1>
    <asp:Label ID="NameLabel" runat="server" Text="Name"></asp:Label>
    <br />
    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="UsernameLabel" runat="server" Text="Username"></asp:Label>
     <br />
    <asp:TextBox ID="Username" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="PasswordLabel" runat="server" Text="Password"></asp:Label>
    <br />
    <asp:TextBox ID="Password" runat="server"></asp:TextBox>
    <br />

    <asp:Label ID="ClubnameLabel" runat="server" Text="Club Name"></asp:Label>
    <br />
    
    <asp:TextBox ID="Clubname" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Register" runat="server" Text="Register" onClick ="RegisterClubRepresentative"/>
        </div>
    </form>
</body>
</html>
