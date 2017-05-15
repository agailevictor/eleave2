<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="e_leave_V.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        function preventBack() {

            window.history.forward();
        }

        setTimeout("preventBack()", 0);

        window.onunload = function () {
            null
        };

    </script>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="Electronic Leave Applier (e - Leave) is a web application designed to run on organization’s server." />
    <meta name="author" content="Hummingsoft Sdn Bhd" />

    <link rel="shortcut icon" href="assets/images/favicon.ico" />

    <title>e-leave 2.0 | Login</title>

    <link href="assets/V2/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/V2/assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="assets/V2/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="assets/V2/assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="assets/V2/assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="assets/V2/assets/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="assets/V2/assets/css/responsive.css" rel="stylesheet" type="text/css" />

    <script src="assets/V2/assets/js/modernizr.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body>
    <div class="wrapper-page">

        <div class="card-box">
            <div class="text-center">
                <a href="#" class="logo-lg"><i class="fa fa-internet-explorer"></i><span>- Leave</span> </a>
            </div>

            <form id="form1" class="form-horizontal m-t-20" runat="server">
                <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <p>Please check your <b>username</b> or <b>password</b>!</p>
                </div>
                <div class="form-group">
                    <div class="col-xs-12">
                        <asp:TextBox ID="username" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                        <i class="md md-account-circle form-control-feedback l-h-34"></i>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-12">
                        <asp:TextBox ID="password" CssClass="form-control password" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <i class="md md-vpn-key form-control-feedback l-h-34"></i>
                    </div>
                </div>

                <div class="form-group text-right m-t-20">
                    <div class="col-xs-12">
                        <asp:Button ID="logi" CssClass="btn btn-primary btn-custom w-md waves-light" runat="server" Text="Log In" OnClientClick="LogV()" OnClick="logi_Click"/>
                    </div>
                </div>
                <div class="form-group m-t-30">
                    <div class="col-sm-7">
                    </div>
                    <div class="col-sm-5 text-right">
                    </div>
                </div>
            </form>
        </div>
    </div>


    <script>
        var resizefunc = [];
    </script>

    <!-- Main  -->
    <script src="assets/V2/assets/js/jquery.min.js"></script>
    <script src="assets/V2/assets/js/bootstrap.min.js"></script>
    <script src="assets/V2/assets/js/detect.js"></script>
    <script src="assets/V2/assets/js/fastclick.js"></script>
    <script src="assets/V2/assets/js/jquery.slimscroll.js"></script>
    <script src="assets/V2/assets/js/jquery.blockUI.js"></script>
    <script src="assets/V2/assets/js/waves.js"></script>
    <script src="assets/V2/assets/V2/assets/js/wow.min.js"></script>
    <script src="assets/V2/assets/js/jquery.nicescroll.js"></script>
    <script src="assets/V2/assets/js/jquery.scrollTo.min.js"></script>

    <!-- Custom main Js -->
    <script src="assets/V2/assets/js/jquery.core.js"></script>
    <script src="assets/V2/assets/js/jquery.app.js"></script>
    <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
    <script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="assets/js/Validations/login_valid.js"></script>
    <script type="text/javascript">
        function LogV() {
            Login.init();
        }

    </script>
    <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
</body>
</html>
