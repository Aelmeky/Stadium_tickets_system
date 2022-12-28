<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Milestone3.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style>
           html,body{
            height:100%;
            margin:0;
        }
        .backgnd {
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(Helper/background.jpg);
        }

        .btn_margin {
            margin: 10px;
            padding-top:20px;
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
    </style>
</head>
<body class="backgnd">
       <div id="preloader">
        <img class="preloader" src="Helper/loading-img.gif" alt="">
    </div>
    <form id="form1" runat="server">
        <center>
            <div>
                <div class="btn_margin">
                    <asp:Button Text="Register as a Fan" ID="button_fan" OnClick="method_register_fan" CssClass="btn btn-primary" Height="100px" Width="400px" runat="server" />
                    <br />
                </div>
                <div class="btn_margin">
                    <asp:Button Text="Register as a Stadium Manager" ID="button_stadiummanager" OnClick="method_register_stadiumManager" Height="100px" Width="400px" CssClass="btn btn-primary"  runat="server" />
                    <br />
                </div>
                <div class="btn_margin">
                    <asp:Button Text="Register as a Club Representative" ID="button_clubrepresentative" OnClick="method_register_clubRepresentative" CssClass="btn btn-primary" Height="100px" Width="400px" runat="server" />
                    <br />
                </div>
                <div class="btn_margin">
                    <asp:Button Text="Register as a Sport Association Manager" ID="button_sport_association_manager" OnClick="method_register_sport_association_manager" CssClass="btn btn-primary" Height="100px" Width="400px" runat="server" />
                </div>
            </div>
        </center>
    </form>
       <script src="Helper/js/all.js"></script>
    <script src="Helper/js/custom.js"></script>
</body>
</html>
