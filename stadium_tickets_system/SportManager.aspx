﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportManager.aspx.cs" Inherits="stadium_tickets_system.SportManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div >
             <asp:Button ID="addnewmatch" runat="server" OnClick="addanewmatch" Text="add new match" />
        </div>
       <div>
           <asp:Button ID="deleteamatch" runat="server" Text="delete a match" OnClick="deleteaMatch" />
       </div>
        <div>
            <asp:Button ID="upcomingmatches" runat="server" Text="view all upcoming matches" OnClick="allupcomingmatches"/>
        </div>
        <div>
            <asp:Button ID="alreadypalyedmatches" runat="server" Text="view already palyed matches" OnClick="alreadyplayedmatches" />
        </div>
        <div>
                    <asp:Button ID="neverscheduled" runat="server" Text="view clubs never matched"  OnClick="nevermatched"/>
        </div>
    </form>
</body>
</html>
