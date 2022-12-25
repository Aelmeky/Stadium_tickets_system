<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deletematch.aspx.cs" Inherits="stadium_tickets_system.deletematch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
                    <asp:TextBox ID="starttime1" runat="server"></asp:TextBox>
        </div>
        <div>
            End time:
              <asp:TextBox ID="endtime1" runat="server"></asp:TextBox>
        </div>

        <asp:Button ID="deletema" runat="server" Text="delete" OnClick="deletema_Click" />
    </form>
</body>
</html>
