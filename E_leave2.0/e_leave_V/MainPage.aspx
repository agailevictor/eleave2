<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="e_leave_V.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="Electronic Leave Applier (e - Leave) is a web application designed to run on organization’s server." />
    <meta name="author" content="Hummingsoft Sdn Bhd" />

    <link rel="shortcut icon" href="assets/images/favicon.ico" />
    <title>e-leave 2.0</title>
    <script type="text/javascript">
        //Disables the browser back button
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
