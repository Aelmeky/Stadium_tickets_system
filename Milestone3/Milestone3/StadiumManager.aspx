<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StadiumManager.aspx.cs" Inherits="Milestone3.StadiumManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="Helper/css/style.default.css" rel="stylesheet" />
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .text {
            color: saddlebrown;

        }
        #Image1{
            padding:10px;
            border-radius: 10%;
        }

        * {
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-weight:bold;
            margin: 0;
            padding: 0;
        }

        .backgnd {
            
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(Helper/background.jpg);
        }

        footer {
            text-align: center;
            padding: 3px;
            background-color: #333;
            color: white;
        }

        .center {
            padding: 80px 0px 0px 200px;
        }

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

        /* Add a color to the active/current link */
    </style>
</head>
<body class="backgnd">
    <form id="form1" runat="server">
    <div class="topnav">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="goStadiumInfo">View Stadium Info</asp:LinkButton>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="goHostRequests">View Host Requests</asp:LinkButton>

    </div>
        <div>
            <center>
            <div>
                <asp:Image ID="Image1" runat="server" ImageUrl="Helper/img-07.jpg" Width="50%" Height="50%"/>
                <div>
                    <div>
                        <div style="position: relative">
                            <label style="color: black; font-weight: bold">Name:</label>
                            <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                            <asp:Label ID="label1" runat="server" Text="Label" class="text"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <div>
                            <label style="color: black; font-weight: bold">Location:</label>
                            <asp:PlaceHolder ID="PlaceHolder4" runat="server"></asp:PlaceHolder>
                            <asp:Label ID="label2" runat="server" Text="Label" class="text"></asp:Label>
                        </div>
                        <label style="color: black; font-weight: bold">Capacity:</label>
                        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                        <asp:Label ID="label3" runat="server" Text="Label" class="text"></asp:Label>
                    </div>
                    <label style="color: black; font-weight: bold">Status:</label>
                    <asp:PlaceHolder ID="PlaceHolder5" runat="server"></asp:PlaceHolder>
                    <asp:Label ID="Label5" runat="server" Text="Label" class="text"></asp:Label>
                </div>
            </div>
                </center>
        </div>
    </form>

</body>
</html>
