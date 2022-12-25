<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addanewmatch.aspx.cs" Inherits="stadium_tickets_system.addanewmatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/vendor/bootstrap/css/bootstrap-reboot.min.css" rel="stylesheet" />
    <link href="Helper/css/style.default.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
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
             <asp:TextBox ID="starttime" runat="server"></asp:TextBox>
           
        </div>
        <div>
            EndTime:
            <asp:TextBox ID="endtime" runat="server"></asp:TextBox>
        </div>
        

      
        <asp:Button ID="addingmatch" runat="server" Text="add the match" OnClick="addingmatch_Click" />
        
    </form>
   
</body>
</html>
