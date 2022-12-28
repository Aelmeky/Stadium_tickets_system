<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportManagerRegistration.aspx.cs" Inherits="stadium_tickets_system.SportManagerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Helper/css/style.default.css" rel="stylesheet" />
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
        <div class=" page-holder d-flex align-items-center">
            <div class="container">
                <div class="row align-items-center py-5">
                    <div class="col-5 col-lg-7 mx-auto mb-5 mb-lg-0">
                    
                        <div class="pr-lg-5">
                            <img src="illustration.svg" alt="" class="img-fluid" />     
                        </div>
                    </div>
                    <div class="col-lg-5 px-lg-4">
                        <h1 class="text-base text-primary text-uppercase mb-4">Sign up Here</h1>
            

                        <div class ="form-group mb-4">
                            <asp:TextBox required= "true" MaxLength="20" ID="AssociationName" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Name" runat="server" ></asp:TextBox>

                        </div>
                          <div class ="form-group mb-4">
                            <asp:TextBox required= "true" MaxLength="20" ID="AssociationUserName" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="User Name" runat="server" ></asp:TextBox>

                        </div>
                      
                             <div class ="form-group mb-4">
                            <asp:TextBox required= "true" MaxLength="20" TextMode="Password" ID="passValidate" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Password" runat="server" ></asp:TextBox>
                            
                               </div>

                        <div style="color:red; font-weight:bold;">
                            <asp:Label runat="server" ID="labelResult"></asp:Label>
                        </div>
                                                
            
                       
                        <asp:Button Text="Sign up" CssClass="btn btn-primary" Height="50px" Width="400px" runat="server" OnClick="Regiser_Sport_Manager" />
                    </div>
                </div>
               
                <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100 " style="text-align:end;margin-top:390px">
                    <div class="container-fluid">
                        <div class="row">   
                            <div class="col-md-6 text-center text-md-left text-primary">
                                <p class  ="mb-2 mb-md-0">CopyRights &copy;2022</p>
                            </div>
                            <div class="col-md-6 text-center text-md-right text-gray-400">
                                <p class="mb-0">Design by <a href="#">YehiaFarghaly</a></p>

                            </div>
                        </div>
                    </div>
                </footer>
            </div>
            
        </div>
    </form>
       <script src="Helper/js/all.js"></script>
    <script src="Helper/js/custom.js"></script>
</body>
</html>

