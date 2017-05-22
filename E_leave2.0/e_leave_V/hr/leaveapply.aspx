<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="leaveapply.aspx.cs" Inherits="e_leave_V.hr.leaveapply" MasterPageFile="~/hr/hrMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
            var startdate, enddate, chk;
            inputlimit();
            inputlimit_add1();
            inputlimit_add2();
            hidefupload();
            $('#lblop').hide();
            $('.leav').css("display", "block");
        });
        $(document).on("keydown", function (e) {
            if (e.which === 8 && !$(e.target).is("input, textarea")) {
                e.preventDefault();
            }
        });
    </script>
    <script type="text/javascript">
        function inputlimit() {
            $('#txtreason').inputlimiter({
                limit: 100,
                remText: 'You only have %n character%s remaining...',
                remFullText: 'Stop typing! You\'re not allowed any more characters!',
                limitText: 'You\'re allowed to input %n character%s into this field.'
            });
        }
    </script>
    <script type="text/javascript">
        function inputlimit_add1() {
            $('#txtadd1').inputlimiter({
                limit: 20,
                remText: 'You only have %n character%s remaining...',
                remFullText: 'Stop typing! You\'re not allowed any more characters!',
                limitText: 'You\'re allowed to input %n character%s into this field.'
            });
        }
    </script>
    <script type="text/javascript">
        function inputlimit_add2() {
            $('#txtadd2').inputlimiter({
                limit: 20,
                remText: 'You only have %n character%s remaining...',
                remFullText: 'Stop typing! You\'re not allowed any more characters!',
                limitText: 'You\'re allowed to input %n character%s into this field.'
            });
        }
    </script>
    <script type="text/javascript">
        function hidefupload() {
            $('#fup').hide();
            $('#dateranges').hide();
        }
    </script>
    <script type="text/javascript">
        function success() {
            swal({
                title: 'Success!',
                text: 'Your request has been succesfully sent',
                type: 'success',
                allowEscapeKey: false,
                allowOutsideClick: false
            },
                function () {
                    window.location = "ListLeaves";
                });
        }
    </script>
    <script type="text/javascript">
        function error() {
            swal({
                title: 'Error!',
                text: 'Something Went Wrong',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function warning() {
            swal({
                title: 'Warning!',
                text: 'Failed to fetch the details needed',
                type: 'warning',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errorpdf() {
            swal({
                title: 'Error!',
                text: 'Invalid File Extension/ Format',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errorpdfsize() {
            swal({
                title: 'Error!',
                text: 'Max File size is 3 MB',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errornotavail() {
            swal({
                title: 'Error!',
                text: 'You Leave Count is Insufficiant ',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errornofile() {
            swal({
                title: 'Error!',
                text: 'Upload Medical Certificate',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errorrange() {
            swal({
                title: 'Error!',
                text: 'Select Start Date & End Date',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errorsrange() {
            swal({
                title: 'Error!',
                text: 'Start Date & End Date Can\'t be same',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function error1() {
            swal({
                title: 'Error!',
                text: 'You have some form errors!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errormail() {
            swal({
                title: 'Warning!',
                text: 'Failed to send Email!',
                type: 'warning',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function error_mandatory_p() {
            swal({
                title: 'Warning!',
                text: 'Select 3 days Mandatory!',
                type: 'warning',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errormandatory_m() {
            swal({
                title: 'Warning!',
                text: 'Select 3 days Mandatory!',
                type: 'warning',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function hideshowfup() {
            $('#pulsate-regulario').pulsate("destroy");
            $('#pulsate-regulario').hide();
            var sdate = "+2d";
            var yr = new Date().getFullYear() + '';
            edate = "31-12-" + yr;
            $('#dateranges').hide();
            $('#txtdate').val("");
            $('#txtsdate').val("");
            $('#txtedate').val("");
            $("#fupload").val("");
            $('#lblreq').html('N/A');
            chk = $('#ddlltype option:selected').val();
            if (chk == 1) { // annual
                $('#fup').hide();
                $('#dateranges').hide();
                $('#dates').show();
                $("#txtdate").datepicker('remove');
                $("#ddlper option[value='2']").removeAttr('disabled');
                startdate = "-7d";
                var yeara = new Date().getFullYear() + '';
                enddate = "31-12-" + yeara;
                datepick();

            }
            else if (chk == 2) { // medical
                $('#fup').show();
                $('#dateranges').hide();
                $('#dates').show();
                $("#txtdate").datepicker('remove');
                $("#ddlper option[value='2']").removeAttr('disabled');
                var yearm = new Date().getFullYear() + '';
                startdate = "01-01-" + yearm;
                enddate = "-1d";
                datepick();

            }
            else if (chk == 8) { // Hospitalization
                $('#fup').show();
                $('#dateranges').hide();
                $('#dates').show();
                $("#txtdate").datepicker('remove');
                $("#ddlper option[value='2']").removeAttr('disabled');
                var yearh = new Date().getFullYear() + '';
                startdate = "01-01-" + yearh;
                enddate = "-1d";
                datepick();

            }
            else if (chk == 7) {
                $('#fup').hide();
                $('#dateranges').hide();
                $('#dates').show();
                $("#txtdate").datepicker('remove');
                $("#ddlper option[value='2']").attr('disabled', 'disabled');
                startdate = "+2d";
                var year = new Date().getFullYear() + '';
                enddate = "31-12-" + year;
                datepick();
            }
            else if (chk == 0) { // select
                $("#txtdate").datepicker('remove');
                $("#ddlper option[value='2']").removeAttr('disabled');
                $('#fup').hide();
                $('#dateranges').hide();
                $('#dates').show();
                $("#ddlper").prop("selectedIndex", 0);
                $('#lblio').hide()
                $('#pulsate-regulario').pulsate("destroy");
                $('#pulsate-regulario').hide();
                $('#btnreq').prop("disabled", false);
            }
            else if (chk == 4) { //maternity
                $('#dates').hide();
                $('#fup').hide();
                $('#dateranges').show();
                $("#ddlper option[value='2']").attr('disabled', 'disabled');
                var disableddates = []; //dd/mm/yyyy
                var data = {};
                var userid = '<%= Session["user_id"] %>';
                data.uid = userid;
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"userid":"' + userid + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("leaveapply.aspx/disdates")%>',
                    dataType: "json",
                    success: function (data) {
                        for (var i = 0; i < data.d.length; i++) {
                            disableddates.push(data.d[i].EventDate);
                        }
                        $('#txtsdate').datepicker({
                            format: "dd-mm-yyyy",
                            keyboardNavigation: false,
                            daysOfWeekDisabled: "0,6", // to disable weekends 0 - sunday, 6 - saturday
                            startDate: sdate, // to disable previous days
                            endDate: edate, // to disable future year dates
                            todayHighlight: true, // to highlight today
                            datesDisabled: disableddates, // array of days to be disabled
                            orientation: "bottom auto"
                        });

                        $('#txtedate').datepicker({
                            format: "dd-mm-yyyy",
                            keyboardNavigation: false,
                            daysOfWeekDisabled: "0,6", // to disable weekends 0 - sunday, 6 - saturday
                            startDate: sdate, // to disable previous days
                            endDate: edate, // to disable future year dates
                            todayHighlight: true, // to highlight today
                            datesDisabled: disableddates, // array of days to be disabled
                            orientation: "bottom auto"
                        });
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            else { //others
                $('#fup').hide();
                $('#dateranges').hide();
                $('#dates').show();
                $("#txtdate").datepicker('remove');
                $("#ddlper option[value='2']").removeAttr('disabled');
                startdate = "+2d";
                var year = new Date().getFullYear() + '';
                enddate = "31-12-" + year;
                datepick();
            }
}
    </script>
    <script type="text/javascript">
        function reset_period() {
            $('#ddlper').val('');
            $('#lblio').hide();
            $('#lblreq').html('');
            $('#lblreq').html('N/A');
            $('#pulsate-regulario').pulsate("destroy");
            $('#pulsate-regulario').hide();
            $('#btnreq').prop("disabled", false);
        }
    </script>
    <script type="text/javascript">
        function in_or_out() {
            var userid, typ, per, ds, sd, ed, dv1, dv2, pert, region, reg;
            userid = '<%= Session["user_id"] %>';
            region = '<%= Session["region"] %>';
            typ = $('#ddlltype option:selected').val();
            per = $('#ddlper option:selected').val();
            $('#lblio').hide();
            $('#pulsate-regulario').pulsate("destroy");
            $('#pulsate-regulario').hide();
            var data = {};

            if (typ != "" && per != "") {
                if (typ == 1 || typ == 2 || typ == 3 || typ == 7 || typ == 8) {
                    ds = $('#txtdate').val();
                    pert = $('#ddlper option:selected').text();
                    if (ds != "") {
                        dv1 = $('#txtdate').val();
                        dv2 = (dv1.match(/,/g) || []).length + 1;
                        $('#lblreq').html(dv2 + ' ' + pert);
                    }
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        data: '{"userid":"' + userid + '","typ":"' + typ + '","per":"' + per + '","ds":"' + ds + '"}',
                        url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("leaveapply.aspx/in_out_others")%>',
                        dataType: "json",
                        success: function (data) {
                            if (data.d == 1) {
                                $('#lblio').hide();
                                $('#pulsate-regulario').pulsate("destroy");
                                $('#pulsate-regulario').hide();
                                $('#btnreq').prop("disabled", false);
                            }
                            else if (data.d == 3) {
                                $('#pulsate-regulario').show();
                                $('#lblio').html('Leave Count is insufficiant');
                                $('#lblio').show();
                                $('#btnreq').prop("disabled", true);
                                $('#pulsate-regulario').pulsate({
                                    color: '#ee6e73', // set the color of the pulse
                                    reach: 20, // how far the pulse goes in px
                                    speed: 1000, // how long one pulse takes in ms
                                    pause: 0, // how long the pause between pulses is in ms
                                    glow: true, // if the glow should be shown too
                                    repeat: true, // will repeat forever if true, if given a number will repeat for that many times
                                    onHover: false // if true only pulsate if user hovers over the element
                                });
                            }
                            else if (data.d == 4) {
                                $('#pulsate-regulario').show();
                                $('#lblio').html('3 Full days Mandatory');
                                $('#lblio').show();
                                $('#btnreq').prop("disabled", true);
                                $('#pulsate-regulario').pulsate({
                                    color: '#ee6e73', // set the color of the pulse
                                    reach: 20, // how far the pulse goes in px
                                    speed: 1000, // how long one pulse takes in ms
                                    pause: 0, // how long the pause between pulses is in ms
                                    glow: true, // if the glow should be shown too
                                    repeat: true, // will repeat forever if true, if given a number will repeat for that many times
                                    onHover: false // if true only pulsate if user hovers over the element
                                });
                            }
                            else {
                                console.log('uncaught mandatory');
                            }
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                        }
                    });

                }
                else if (typ == 4) {
                    sd = $('#txtsdate').val();
                    ed = $('#txtedate').val();
                    pert = $('#ddlper option:selected').text();
                    $('#lblio').hide();
                    $('#pulsate-regulario').pulsate("destroy");
                    $('#pulsate-regulario').hide();

                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        data: '{"userid":"' + userid + '","typ":"' + typ + '","per":"' + per + '","sd":"' + sd + '","ed":"' + ed + '","region":"' + region + '"}',
                        url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("leaveapply.aspx/in_out_maternity_days")%>',
                        dataType: "json",
                        success: function (data) {
                            $('#lblreq').html(data.d + ' ' + pert);
                            $.ajax({
                                type: "POST",
                                contentType: "application/json",
                                data: '{"userid":"' + userid + '","typ":"' + typ + '","per":"' + per + '","sd":"' + sd + '","ed":"' + ed + '","region":"' + region + '"}',
                                url: "leaveapply.aspx/in_out_maternity",
                                dataType: "json",
                                success: function (data) {
                                    if (data.d == 1) {
                                        $('#lblio').hide();
                                        $('#pulsate-regulario').pulsate("destroy");
                                        $('#pulsate-regulario').hide();
                                        $('#btnreq').prop("disabled", false);
                                    }
                                    else if (data.d == 3) {
                                        $('#pulsate-regulario').show();
                                        $('#lblio').html('Leave Count is insufficiant');
                                        $('#lblio').show();
                                        $('#btnreq').prop("disabled", true);
                                        $('#pulsate-regulario').pulsate({
                                            color: '#ee6e73', // set the color of the pulse
                                            reach: 20, // how far the pulse goes in px
                                            speed: 1000, // how long one pulse takes in ms
                                            pause: 0, // how long the pause between pulses is in ms
                                            glow: true, // if the glow should be shown too
                                            repeat: true, // will repeat forever if true, if given a number will repeat for that many times
                                            onHover: false // if true only pulsate if user hovers over the element
                                        });
                                    }
                                    else if (data.d == 5) {
                                        $('#pulsate-regulario').show();
                                        $('#lblio').html('60 Full days Mandatory');
                                        $('#lblio').show();
                                        $('#btnreq').prop("disabled", true);
                                        $('#pulsate-regulario').pulsate({
                                            color: '#ee6e73', // set the color of the pulse
                                            reach: 20, // how far the pulse goes in px
                                            speed: 1000, // how long one pulse takes in ms
                                            pause: 0, // how long the pause between pulses is in ms
                                            glow: true, // if the glow should be shown too
                                            repeat: true, // will repeat forever if true, if given a number will repeat for that many times
                                            onHover: false // if true only pulsate if user hovers over the element
                                        });
                                    }
                                    else {
                                        Console.log('Uncaught Maternity');
                                    }
                                },
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                }
                            });
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                        }
                    });


                }
                else {
                    pert = $('#ddlper option:selected').text();
                    dv1 = $('#txtdate').val();
                    dv2 = (dv1.match(/,/g) || []).length + 1;
                    $('#lblreq').html(dv2 + ' ' + pert);
                    $('#lblio').hide();
                    $('#pulsate-regulario').pulsate("destroy");
                    $('#pulsate-regulario').hide();
                    $('#btnreq').prop("disabled", false);
                }
        }
        else {
            $('#lblreq').html('N/A');
            $('#lblio').hide();
            $('#pulsate-regulario').pulsate("destroy");
            $('#pulsate-regulario').hide();
            $('#btnreq').prop("disabled", false);
        }
    }
    </script>
    <script type="text/javascript">
        function leavevali() {
            leaveval.init();
        }
    </script>
    <script type="text/javascript">
        function datepick() {
            var disableddates = []; //dd/mm/yyyy
            var data = {};
            var userid = '<%= Session["user_id"] %>';
            data.uid = userid;
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"userid":"' + userid + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("leaveapply.aspx/disdates")%>',
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        disableddates.push(data.d[i].EventDate);
                    }
                    $('#txtdate').datepicker({
                        format: "dd-mm-yyyy",
                        keyboardNavigation: false,
                        multidate: true,
                        multidateSeparator: ",",
                        daysOfWeekDisabled: "0,6", // to disable weekends 0 - sunday, 6 - saturday
                        startDate: startdate, // to disable previous days
                        endDate: enddate, // to disable future year dates
                        todayHighlight: true, // to highlight today
                        datesDisabled: disableddates, // array of days to be disabled
                        orientation: "bottom auto"
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start content -->
    <div class="content">
        <div class="container">

            <!-- Page-Title -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-title-box">
                        <h4 class="page-title">Request Leaves</h4>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card-box">
                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">
                                        Name 
                                    </label>
                                    <asp:Label ID="lblname" runat="server" CssClass="form-control"
                                        ClientIDMode="Static"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                        Position 
                                    </label>
                                    <asp:Label ID="lblpos" runat="server" CssClass="form-control"
                                        ClientIDMode="Static"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                        Department 
                                    </label>
                                    <asp:Label ID="lbldep" runat="server" CssClass="form-control"
                                        ClientIDMode="Static"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                        Leave Type <span class="symbol required"></span>
                                    </label>
                                    <asp:DropDownList ID="ddlltype" runat="server" CssClass="form-control"
                                        ClientIDMode="Static" onchange="hideshowfup()" DataTextField="leave_type"
                                        DataValueField="ltype_id">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group" id="dates">
                                    <label class="control-label">
                                        Dates <span class="symbol required"></span>
                                    </label>
                                    <asp:TextBox ID="txtdate" runat="server" CssClass="chosen-disabled form-control"
                                        ClientIDMode="Static" BackColor="White" onchange="reset_period()"></asp:TextBox>
                                </div>
                                <div class="form-group" id="dateranges" style="display: none">
                                    <label class="control-label">
                                        Dates <span class="symbol required"></span>
                                    </label>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="col-sm-6" style="padding-left: 0px !important; padding-right: 0px !important;">
                                                <asp:TextBox ID="txtsdate" runat="server" CssClass="chosen-disabled form-control" ClientIDMode="Static" BackColor="White" onchange="reset_period()"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-1">
                                                <span>to</span>
                                            </div>
                                            <div class="col-sm-5" style="padding-left: 0px !important; padding-right: 0px !important;">
                                                <asp:TextBox ID="txtedate" runat="server" CssClass="chosen-disabled form-control" ClientIDMode="Static" BackColor="White" onchange="reset_period()"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                        Period <span class="symbol required"></span>
                                    </label>
                                    <asp:DropDownList ID="ddlper" runat="server" CssClass="form-control"
                                        ClientIDMode="Static" DataTextField="period" DataValueField="period_id" onchange="in_or_out()">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                        Selected
                                    </label>
                                    <asp:Label ID="lblreq" runat="server" CssClass="form-control" Text="N/A" ClientIDMode="Static"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                        Reason <span class="symbol required"></span>
                                    </label>
                                    <asp:TextBox ID="txtreason" runat="server" TextMode="MultiLine"
                                        CssClass="form-control" ClientIDMode="Static" MaxLength="1" Rows="2"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                        My Job Will be coverd by <span class="symbol required"></span>
                                    </label>
                                    <asp:DropDownList ID="ddljobc" runat="server" CssClass="form-control"
                                        ClientIDMode="Static" DataTextField="Name" DataValueField="user_id">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                        Contact No <span class="symbol required"></span>
                                    </label>
                                    <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"
                                        ClientIDMode="Static"></asp:TextBox>
                                </div>
                                <div class="form-group" id="fup" style="display: none">
                                    <label class="control-label">
                                        Medical Certificate <span class="symbol required"></span>
                                    </label>
                                    <asp:FileUpload ID="fupload" runat="server"
                                        CssClass="fileupload fileupload-new" ClientIDMode="Static" />
                                    <p class="help-block">
                                        Allowed File Type is PDF. <span class="clip-file-pdf"></span>
                                    </p>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <div id="pulsate-regulario" style="padding: 5px; width: 202px; display: none">
                                        <asp:Label ID="lblio" runat="server" ClientIDMode="Static" ForeColor="Black"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">
                                    </label>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div>
                                    <span class="symbol required"></span>Required Fields
                                <hr>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <asp:Button ID="btnreq" runat="server" Text="Apply" CssClass="btn btn-success" OnClientClick="leavevali()" OnClick="btnreq_Click" ClientIDMode="Static" />
                                <input type="hidden" id="chk" />
                            </div>
                            <div class="col-md-4">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- end container -->

    </div>
    <!-- end content -->
</asp:Content>
