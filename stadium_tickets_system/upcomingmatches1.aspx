﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upcomingmatches1.aspx.cs" Inherits="stadium_tickets_system.upcomingmatches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style>
        .topnav {
            background-color: #333;
            overflow: hidden;
        }
            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

           .topnav a:hover {
                    background-color: white;
                    color: black;
           }
           *{
               padding:0;
               margin:0;
           }
            .table {
                  font-family: Arial, Helvetica, sans-serif;
                  border-collapse: collapse;
                  width: 100%;
            }
                .table td, .table th {
                  border: 1px solid #ddd;
                  padding: 8px;
                }

                .table tr:nth-child(even){background-color: darkgrey;}

                .table tr:hover {background-color: dimgray;}

                .table th {
                  padding-top: 12px;
                  padding-bottom: 12px;
                  text-align: left;
                  background-color: black;
                  color: white;
                }
           .container {
            height:585px;
            width:100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(Helper/background.jpg);
            }
            
           .cont {
          display: flex;
           flex-direction: column;
          align-items: center;
          width: 50%;
          position: relative;
          margin: auto;
           background-color: gainsboro;
          opacity :0.8; 
          
        }
              .label {
      display: block;
      margin-top: 20px;
      margin-bottom: 20px;
      font-size: 25px;
    }
    </style>
   
</head>
<body>
    <div class="container">
    <form id="form1" runat="server">
                <div class="topnav">
                     <asp:LinkButton ID="addnewmatch" runat="server" OnClick="addanewmatch" > add New Match</asp:LinkButton>
                     <asp:LinkButton ID="deleteamatch" runat="server" Text="delete a match" OnClick="deleteaMatch" />
                     
                     <asp:LinkButton ID="alreadypalyedmatches" runat="server" Text="view already palyed matches" OnClick="alreadyplayedmatches" />
                     <asp:LinkButton ID="neverscheduled" runat="server" Text="view clubs never matched"  OnClick="nevermatched"/>
            </div>
        <div class="cont">
        <div>
            <asp:Label ID="Label1" runat="server" Text="All the upcoming matches" CssClass="label"></asp:Label></div>
        <div>
              <asp:Table ID="upcoming" runat="server" class ="table">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>host club</asp:TableHeaderCell>
                <asp:TableHeaderCell>guest club</asp:TableHeaderCell>
                <asp:TableHeaderCell>start time</asp:TableHeaderCell>
                <asp:TableHeaderCell>end time</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
        </div>
      </div>
    </form>
        </div>
</body>
</html>