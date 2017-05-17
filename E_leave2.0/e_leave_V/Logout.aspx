<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="e_leave_V.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function preventBack() {

            window.history.forward();
        }

        setTimeout("preventBack()", 0);

        window.onunload = function () {
            null
        };

    </script>
    <link href="assets/css/core_custom.css" rel="stylesheet" />
    <script src="assets/js/jquery.min.js"></script>
</head>
<body>
    <%--Overlay : START--%>
    <div id="myNav" class="overlay">
        <div class="validators"></div>
    </div>
    <%--Overlay : END--%>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <script type="text/javascript">
        jQuery(function ($) {
            $('#myNav').fadeOut('slow');
        });
    </script>
</body>
</html>
