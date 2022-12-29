<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HostRequests.aspx.cs" Inherits="Milestone3.HostRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/css/style.default.css" rel="stylesheet" />
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
           html,body{
            height:100%;
            margin:0;
        }
        .preloader {
            position: absolute;
            margin: 0 auto;
            left: 1%;
            right: 1%;
            top: 25%;
            width: 320px;
            background: center center no-repeat none;
            background-size: auto auto;
            background-size: 95px 95px;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -ms-border-radius: 50%;
            -o-border-radius: 50%;
            border-radius: 50%;
        }

        #preloader {
            width: 100%;
            height: 100%;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: #fff;
            z-index: 11000;
            position: fixed;
            display: block
        }


        .text {
            background-color: cornsilk;
            border: 1px solid #333333;
            word-spacing: 10px;
            box-shadow: 0 0 1px #93291b inset;
            color: black;
            border-radius: 2%;
        }


        * {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-weight: bold;
            margin: 0;
            padding: 0;
        }

        .backgnd {
            /* Full height */
            height: 100%;
            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(Helper/background.jpg);
        }


        .topnav {
            background-color: #333;
            overflow: hidden;
        }

        .accbtn {
            background-color: green;
            color: white;
            padding: 5px;
            margin: 5px;
            border-radius: 50%
        }

        .rjtbtn {
            background-color: red;
            color: white;
            padding: 5px;
            margin: 5px;
            border-radius: 50%;
        }

        .message {
            color: black;
            font-size: 30px;
        }
        /* Style the links inside the navigation bar */
        .topnav a {
            float: left;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

            /* Change the color of links on hover */
            .topnav a:hover {
                background-color: white;
                color: black;
            }
    </style>
</head>
<body class="backgnd">
    <div id="preloader">
        <img class="preloader" src="Helper/loading-img.gif" alt="">
    </div>

    <form id="form1" runat="server">
        <center>
            <div class="topnav">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="goStadiumInfo">View Stadium Info</asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="goHostRequests">View Host Requests</asp:LinkButton>
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" CssClass="accbtn" Text="Accept" OnClick="Accept_btn" />
                <asp:Button ID="Button2" runat="server" CssClass="rjtbtn" Text="Reject" OnClick="Reject_btn" />
            </div>
            <div>
                <asp:Label ID="message" runat="server" Text="Note that: You can only edit unhandled requests" CssClass="message"></asp:Label>
            </div>
            <div>
                <asp:ListBox ID="myRequests" runat="server" Height="500px" CssClass="text"></asp:ListBox>
            </div>
        </center>
    </form>
    <script src="Helper/js/all.js"></script>
    <script src="Helper/js/custom.js"></script>
</body>
</html>
