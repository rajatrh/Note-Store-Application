<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebsiteCollegeLatest.Pages.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../CSS/bootstrap.css" type="text/css" rel="Stylesheet" />
    <link href="../CSS/mystyle.css" type="text/css" rel="Stylesheet" />
    <link href="../CSS/bootstrap-theme.min.css" type="text/css" rel="Stylesheet" />
    <link href="../CSS/infocard.css" rel="stylesheet" />
    <title>LOGIN</title>
</head>
<body class="myback">
    <form id="frmlogin" runat="server">
        <div class="mywrapper">
            <div class="  mybanner mytransheader" style="margin-bottom: 0px;">
            </div>
            <div class="clearfix"></div>

            <nav class="navbar navbar-inverse" role="navigation" id="menu" style="margin-bottom: 0px;">
  
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
     
      <ul class="nav navbar-nav navbar-right">
       <li><a href="#">Home</a></li>
        <li><a id="idAboutus" href="#divAboutus">About us</a></li>
        <li><a href="#">Contact us</a></li>
             
      </ul>
    </div>
    <!-- /.navbar-collapse -->
  
</nav>

            <div class="clearfix">
            </div>
            <%--This is login div--%>
          
                <div class="pull-right" style="width: 400px; margin-right: 20px;">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-lock"></span>Login
                        </div>
                        <div class="panel-body">
                            <%--<form class="form-horizontal" role="form">--%>
                            <div id="divLoginError" class="alert alert-danger" runat="server" visible="false">
                                <p>
                                    Invalid Login.
                                </p>
                            </div>

                            <div class="col-sm-3">
                                <label for="inputEmail3" class="col-sm-2 control-label">Email</label></td>
                            </div>
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="tbuser" runat="server" placeholder="Email" /></td>
                            </div>
                            <div class="col-sm-3">
                                <label for="inputPassword3" class="col-sm-2 control-label">Password</label></td>
                            </div>
                            <div class="col-sm-9">
                                <asp:TextBox TextMode="Password" class="form-control" ID="tbpass" runat="server" placeholder="Password" /></td>
                            </div>
                            <div class="col-sm-offset-3 col-sm-5">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" />
                                        Remember me
                                    </label>
                                </div>
                            </div>

                            <div class="col-sm-offset-3 col-sm-9">
                                <asp:LinkButton ID="btnLogin" runat="server" class="btn btn-success" Width="45%"
                                    OnClick="btnlogin_Click" Text="Sign In" />
                                <%-- <asp:Button type="reset" class="btn btn-default" Width="45%" runat="server" Text="Reset" />--%>
                            </div>
                            <div class="clearfix">
                            </div>
                            <div id="wrap" class="panel-footer" style="margin-top: 2%;">
                                Not Registred? <a style="color: #104E8B" href="#" data-toggle="modal" data-target="#myModal">Register here</a>
                            </div>
                        </div>
                    </div>
                </div>


                <%--This is registration modal--%>

                <div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
                    aria-hidden="true" style="margin-top: 10%;">

                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 col-sm-offset-3">

                                <div class="panel">
                                    <%--panel-default--%>
                                    <div class="panel-heading">
                                        <span class="glyphicon glyphicon-lock"></span>Registration form
                                    <a class="pull-right">&times;</a>
                                    </div>
                                    <div class="panel-body" style="background-color: rgba(182, 67, 41, 0.57); opacity: 1;">

                                        <div class="col-sm-offset-1 col-sm-10" id="div4" style="color: green; padding-top: 15px; padding-bottom: 15px;">

                                            <label>
                                                Please provide correct details to obtain best results. The information will not be disclosed anywhere.
                                            </label>

                                        </div>
                                        <div class="form-group mymargin">
                                            <label for="txtUname" class="col-sm-3 control-label">
                                                Username</label>
                                            <div class="col-sm-8">
                                                <asp:TextBox class="form-control" ID="txtUname" runat="server" placeholder="Username" />
                                            </div>
                                        </div>
                                        <div class="form-group mymargin ">
                                            <label for="txtPwd" class="col-sm-3 control-label">
                                                Password</label>
                                            <div class="col-sm-8 ">
                                                <asp:TextBox TextMode="Password" class="form-control" ID="txtPwd" runat="server"
                                                    placeholder="Password" />
                                            </div>
                                        </div>
                                        <div class="form-group mymargin">
                                            <label for="txtUSN" class="col-sm-3 control-label">
                                                USN</label>
                                            <div class="col-sm-8 ">
                                                <asp:TextBox class="form-control" ID="txtUSN" runat="server"
                                                    placeholder="Valid USN number" />
                                            </div>
                                        </div>
                                        <div class="form-group mymargin">
                                            <label for="txtPhone" class="col-sm-3 control-label">
                                                Phone
                                            </label>
                                            <div class="col-sm-8 ">
                                                <asp:TextBox class="form-control" TextMode="Number" ID="txtPhone" runat="server"
                                                    placeholder="Phone Number" />
                                            </div>
                                        </div>
                                        <div class="form-group mymargin">
                                            <label for="txtEmail" class="col-sm-3 control-label">
                                                Email
                                            </label>
                                            <div class="col-sm-8 ">
                                                <asp:TextBox class="form-control" TextMode="Email" ID="txtEmail" runat="server"
                                                    placeholder="Unregistered Email" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <div class="checkbox">

                                                    <asp:CheckBox ID="cbTerms" runat="server" />
                                                    <label id="cblabel">
                                                        I agree to all the &nbsp
                                                                <asp:LinkButton ID="lnkbtnTerms" class="btn" runat="server" Style="padding: 0px; color: Blue; border: none; background: none;">terms and conditions. </asp:LinkButton>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-sm-offset-1 col-sm-10" id="divterms" style="display: none; padding-top: 5px; padding-bottom: 5px;">

                                                <label>
                                                    The terms and conditions specified are not to be disclosed here.
                                                </label>

                                            </div>
                                        </div>
                                        <div class="form-group last mymargin">
                                            <div class="col-sm-offset-3 col-sm-4">
                                                <asp:LinkButton ID="btnRegister" runat="server" class="btn btn-success btn-group-justified"
                                                    Style="margin-bottom: 5px;" OnClick="btnregister_click" Text="Sign Up" />

                                            </div>
                                            <div class="col-sm-4">
                                                <button type="reset" class="btn btn-default btn-group-justified">
                                                    Reset Fields</button>
                                            </div>
                                        </div>

                                    </div>
                                    <div id="Div5" class="panel-footer">
                                        Already Registred? <a style="color: #104E8B" href="Login.aspx">Sign In Here</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
        

            <div class="clearfix">
            </div>

            <%-- This is description div--%>
            <div class="mytrans" style="height: 400px; margin-bottom: 1%;">
            </div>

            <div class="clearfix">
            </div>

            <%--  This is about us div--%>

            <div id="divAboutus" style="height:600px; margin-bottom: 1%;" >
                <div id="divAboutusheader" class="well" style="font-size:40px;">Development Panel</div>

                <div class="col-sm-3" style="position: relative; left: 0%;">
                    <div class="info-card">
                        <img class="thumbnail" style="width: 100%" height="250px" src="../images/rajat.jpg" />
                        <div class="info-card-details animate">
                            <div class="info-card-header">
                                <h1>Rajat Hande </h1>

                            </div>
                            <div class="[ info-card-detail ]">
                                <p>Lead Developer</p>
                                <div class="social">
                                    <a href="https://www.facebook.com/rajat.hande.1" class="[ social-icon facebook ] animate"><span class="fa fa-facebook"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style="position: relative; left: 0%; top: 20%;">
                    <div class="info-card">
                        <img class="thumbnail" style="width: 100%" height="250px" src="../images/ss.bmp" />
                        <div class="info-card-details animate">
                            <div class="info-card-header">
                                <h1>Sharath K S</h1>
                            </div>
                            <div class="[ info-card-detail ]">
                                <p>Lead Developer</p>
                                <div class="social">
                                    <a href="https://www.facebook.com/shary.sharath" class="[ social-icon facebook ] animate"><span class="fa fa-facebook"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style="position: relative; left: 0%; top: 0%;">
                    <div class="info-card">
                        <img class="thumbnail" style="width: 100%" height="250px" src="../images/frz.jpg"/>
                        <div class="info-card-details animate">
                            <div class="info-card-header">
                                <h1>Md Faraaz</h1>
                            </div>
                            <div class="[ info-card-detail ]">
                                <p>Lead Designer</p>
                                <div class="social">
                                    <a href="https://www.facebook.com/mohammed.faraaz.1232" class="[ social-icon facebook ] animate"><span class="fa fa-facebook"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                   <div class="col-sm-3" style="position: relative; left: 0%; top: 13%;">
                    <div class="info-card">
                        <img class="thumbnail" style="width: 100%" height="250px" src="../images/raj.jpg" />
                        <div class="info-card-details animate">
                            <div class="info-card-header">
                                <h1>Rajath John</h1>
                            </div>
                            <div class="[ info-card-detail ]">
                                <p>Designer</p>
                                <div class="social">
                                    <a href="https://www.facebook.com/rajath.john.5" class="[ social-icon facebook ] animate"><span class="fa fa-facebook"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                   <div class="col-sm-3" style="position: relative; left: 4%; top: 0%;">
                    <div class="info-card">
                        <img class="thumbnail" style="width: 100%" height="250px" src="../images/ani.jpg" />
                        <div class="info-card-details animate">
                            <div class="info-card-header">
                                <h1>Aniruddha S</h1>
                            </div>
                            <div class="[ info-card-detail ]">
                                <p>Android Developer</p>
                                <div class="social">
                                    <a href="https://www.facebook.com/aniruddha.shyamasundar" class="[ social-icon facebook ] animate"><span class="fa fa-facebook"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                  <div class="col-sm-3" style="position: relative; left: 20%; top: 0%;">
                    <div class="info-card">
                        <img class="thumbnail" style="width: 100%" height="250px" src="../images/abi.jpg"/>
                        <div class="info-card-details animate">
                            <div class="info-card-header">
                                <h1>Abhishek Pandit</h1>
                            </div>
                            <div class="[ info-card-detail ]">
                                <p>Developer</p>
                                <div class="social">
                                    <a href="https://www.facebook.com/abhi.sunrise" class="[ social-icon facebook ] animate"><span class="fa fa-facebook"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            
            </div>

            <div class="clearfix">
            </div>
            <%--This is the footer--%>
              <div id="divContactus" style="height:600px; margin-bottom: 1%;" >
             <div class="well" style="font-size:40px;">Contact Us</div>
                  </div>
            <div class="  mybanner mytransfooter " style="margin-bottom: 0px;">
            </div>

        </div>
    </form>

    <script src="../JS/jquery-2.1.1.min.js" type="text/javascript"> </script>
    <script src="../JS/bootstrap.js" type="text/javascript"> </script>
    <script src="../JS/myJScript.js" type="text/javascript"> </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tbuser").focus();
        });

        $("#lnkbtnTerms").click(function () {
            $("#divterms").css({ "display": "inline" });
            $("#myModal").css({ "margin-top": "6%" });
            return false;
        });

        $("#btnRegister").click(function () {
            var varhol = 0;
            var name = $("#txtUname").val();
            var pwd = $("#txtPwd").val();
            var usn = $("#txtUSN").val();
            var email = $("#txtEmail").val();
            var pn = $("#txtPhone").val();
            var tb = $("#cbTerms").valueOf();
            var reemail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var reph = /^\d{10}$/;
            var reusn = "(1|2|3|4)[A-Z a-z]{2}\\d{2}(cs|is|me|ec|bt|ip|CS|EC|ME|IS|BT|IP)\\d{3}";
            var cb = document.getElementById("cbTerms");

            if (jQuery.trim(name) == "") {
                $("#txtUname").addClass("myinputerror");
                varhol = 1;
            }

            if (jQuery.trim(pwd) == "") {
                $("#txtPwd").addClass("myinputerror");
                varhol = 1;
            }

            if (jQuery.trim(usn) == "") {
                $("#txtUSN").addClass("myinputerror");
                varhol = 1;
            }

            if (jQuery.trim(email) == "") {
                $("#txtEmail").addClass("myinputerror");
                varhol = 1;
            }

            if (jQuery.trim(pn) == "") {
                $("#txtPhone").addClass("myinputerror");
                varhol = 1;
            }
            if (!(jQuery.trim(pn).match(reph))) {
                $("#txtPhone").addClass("myinputerror");
                varhol = 1;
            }

            if (!(jQuery.trim(email).match(reemail))) {
                $("#txtEmail").addClass("myinputerror");
                varhol = 1;
            }

            if (!(jQuery.trim(usn).match(reusn))) {
                $("#txtUSN").addClass("myinputerror");
                varhol = 1;
            }

            if (!cb.checked) {
                $("#cblabel").addClass("mylabelinputerror");
                varhol = 1;
            }

            if (varhol == 0)
                return true;
            else
                return false;
        });

        $("input").focus(function () {

            $("input").removeClass("myinputerror");
            $("#cblabel").removeClass("mylabelinputerror");
        })



        $("#btnLogin").click(function () {

            var varhol = 0;
            var logName = $("#tbuser").val();
            var logPwd = $("#tbpass").val();
            if (logName == "") {
                $("#tbuser").addClass("myinputerror");
                varhol = 1;
            }

            if (logPwd == "") {
                $("#tbpass").addClass("myinputerror");
                varhol = 1;
            }

            if (varhol == 1)
                return false;
            else
                return true;

        });
    </script>
</body>
</html>
