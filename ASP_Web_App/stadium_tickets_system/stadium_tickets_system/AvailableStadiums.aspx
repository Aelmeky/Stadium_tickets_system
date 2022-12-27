<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvailableStadiums.aspx.cs" Inherits="stadium_tickets_system.AvailableStadiums" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 103px; width: 1013px">
            <h1>Available Stadiums
            </h1>
            <asp:Label ID="Label1" runat="server" Text="Start Datetime: "></asp:Label>
            <asp:TextBox type = "datetime-local" ID="startTimeInput" runat="server" Width="210px"></asp:TextBox>
            <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="View" />
            <br />
            <p>Please input datetime as YYYY-MM-DD hh:mm</p>
            <asp:Table ID="availableStadiumsTable" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>
                        Stadium Name
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Location
                    </asp:TableHeaderCell>

                    <asp:TableHeaderCell>
                        Capacity
                    </asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </div>
        
    </form>
</body>
</html>
