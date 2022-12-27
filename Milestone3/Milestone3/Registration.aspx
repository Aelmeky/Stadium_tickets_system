<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Milestone3.Registration" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Helper/css/style.default.css" rel="stylesheet" />
    <link href="Helper/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .backgnd {
            /* Full height */
            height: 100%;
            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-image: url(Helper/background.jpg);
        }
    </style>
</head>
<body class="backgnd">
   <form id="form1" runat="server">
        <div class="page-holder d-flex align-items-center">
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
                            <asp:TextBox required= "true" MaxLength="20" ID="fanName" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Name" runat="server" ></asp:TextBox>

                        </div>
                          <div class ="form-group mb-4">
                            <asp:TextBox required= "true" MaxLength="20" ID="fanUsername" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="User Name" runat="server" ></asp:TextBox>

                        </div>
                      
                             <div class ="form-group mb-4">
                            <asp:TextBox required= "true" MaxLength="20" TextMode="Password" ID="passValidate" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Password" runat="server" ></asp:TextBox>
                                 
                               
                        </div>
                            <div class ="form-group mb-4">
                            <asp:TextBox required= "true" MaxLength="20" ID="nationalValidator" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="National ID" runat="server" ></asp:TextBox>
                   

                        </div>
                            <div class ="form-group mb-4">
                            <asp:TextBox required= "true" ID="fanPhone" MaxLength="20" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Phone Number" runat="server" ></asp:TextBox>

                        </div>
                            <div class ="form-group mb-4">
                            <asp:TextBox required= "true" ID="dateFan" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Birth Date" runat="server" ></asp:TextBox>
                                

                        </div>
                            <div class ="form-group mb-4">
                            <asp:TextBox required= "true" MaxLength="20" ID="addressValidator" CssClass="form-control border-0 shadow form-control-lg text-base" placeholder="Address" runat="server" ></asp:TextBox>
                                
                        </div>
            
                        <div style="color:red; font-weight:bold;">
                            <asp:Label runat="server" ID="labelResult"></asp:Label>
                        </div>

                        <asp:Button Text="Sign up" CssClass="btn btn-primary" Height="50px" Width="400px" runat="server" OnClick="Register" />
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
</body>
</html>
