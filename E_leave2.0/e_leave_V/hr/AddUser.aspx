<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="e_leave_V.hr.AddUser" MasterPageFile="~/hr/hrMaster.Master" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
            dob();
            doj();
            $('.mang').css("display", "block");
            //$('#chkIslead').change(function () {
            //    if (this.checked) {
            //        filllead();
            //    }
            //});
        });
    </script>
    <script type="text/javascript">
        function uservali() {
            userval.init();
        }
    </script>
    <script type="text/javascript">
        function success() {
            swal({
                title: 'Success!',
                text: 'User Added succesfully !',
                type: 'success',
                allowEscapeKey: false,
                allowOutsideClick: false
            },
                function () {
                    window.location = "ListUser";
                });
        }
    </script>
    <script type="text/javascript">
        function error_dupli() {
            swal({
                title: 'Error!',
                text: 'Username Cannot be Same!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function error_dupliemail() {
            swal({
                title: 'Error!',
                text: 'Email Cannot be Same!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function error() {
            swal({
                title: 'Error!',
                text: 'Something Went Wrong!',
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
        function errorinvalid() {
            swal({
                title: 'Error!',
                text: 'Invalid mail format!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errorlength() {
            swal({
                title: 'Error!',
                text: 'Email can\'t be of length more than 30 characters!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errorname() {
            swal({
                title: 'Error!',
                text: 'Invalid name format!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function erroruname() {
            swal({
                title: 'Error!',
                text: 'Invalid username format!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function checkusername() {
            $('#txtuname').pulsate("destroy");
            $('#btnuseradd').prop("disabled", false);
            $('#pulsate-regularun').hide();
            $('#lblun').hide();
            var uname;
            var data = {};
            uname = $('#txtuname').val();
            if (uname.length > 0) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"uname":"' + uname + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("adduser.aspx/checkusername")%>',
                    dataType: "json",
                    success: function (data) {
                        if (data.d == 1) {
                            $('#lblun').hide();
                            $('#btnuseradd').prop("disabled", false);
                            $('#txtuname').pulsate("destroy");
                            $('#pulsate-regularun').hide();
                        }
                        else {
                            $('#btnuseradd').prop("disabled", true);
                            $('#pulsate-regularun').show();
                            $('#lblun').show();
                            $('#txtuname').pulsate({
                                color: '#C43C35', // set the color of the pulse
                                reach: 20, // how far the pulse goes in px
                                speed: 1000, // how long one pulse takes in ms
                                pause: 0, // how long the pause between pulses is in ms
                                glow: true, // if the glow should be shown too
                                repeat: true, // will repeat forever if true, if given a number will repeat for that many times
                                onHover: false // if true only pulsate if user hovers over the element
                            });
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            else {

                $('#lblun').hide();
                $('#btnuseradd').prop("disabled", false);
                $('#txtuname').pulsate("destroy");
                $('#pulsate-regularun').hide();
            }
        }
    </script>
    <script type="text/javascript">
        function checkemail() {
            $('#txtemail').pulsate("destroy");
            var email;
            var data = {};
            email = $('#txtemail').val();
            if (email.length > 0) {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"email":"' + email + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("adduser.aspx/checkemail")%>',
                    dataType: "json",
                    success: function (data) {
                        if (data.d == 1) {
                            $('#lblem').hide();
                            $('#btnuseradd').prop("disabled", false);
                            $('#txtemail').pulsate("destroy");
                            $('#pulsate-regularem').hide();
                        }
                        else {
                            $('#btnuseradd').prop("disabled", true);
                            $('#pulsate-regularem').show();
                            $('#lblem').show();
                            $('#txtemail').pulsate({
                                color: '#C43C35', // set the color of the pulse
                                reach: 20, // how far the pulse goes in px
                                speed: 1000, // how long one pulse takes in ms
                                pause: 0, // how long the pause between pulses is in ms
                                glow: true, // if the glow should be shown too
                                repeat: true, // will repeat forever if true, if given a number will repeat for that many times
                                onHover: false // if true only pulsate if user hovers over the element
                            });
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
            else {

                $('#lblem').hide();
                $('#btnuseradd').prop("disabled", false);
                $('#txtemail').pulsate("destroy");
                $('#pulsate-regularem').hide();
            }
        }
    </script>
    <script type="text/javascript">
        function filldesi() {
            var dep;
            var data = {};
            dep = $('#ddldep option:selected').val();
            if (dep == 0) {
                $('#ddldesi').empty();
                $('#ddlgrade').empty();
                $('#ddlgrade').val("");
                $("#txtcategory").val("");
            }
            else {
                $('#ddldesi').empty();
                $('#ddlgrade').empty();
                $("#txtcategory").val("");
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"dep":"' + dep + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("adduser.aspx/filldesi")%>',
                    dataType: "json",
                    success: function (data) {
                        $('#ddldesi').empty();
                        $('#ddldesi').append("<option value=''>-----SELECT-----</option>");
                        $.each(data.d, function (key, value) {
                            $("#ddldesi").append($("<option></option>").val(value.dsg_id).html(value.designation));
                        });
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
        }
    </script>
    <script type="text/javascript">
        function fillgrade() {
            var grade;
            var data = {};
            grade = $('#ddldesi option:selected').val();
            if (grade == 0) {
                $('#ddlgrade').empty();
                $('#ddlgrade').val("");
                $("#txtcategory").val("");
            }
            else {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"grade":"' + grade + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("adduser.aspx/fillgrade")%>',
                    dataType: "json",
                    success: function (data) {
                        $('#ddlgrade').empty();
                        for (var i = 0; i < data.d.length; i++) {
                            $("#ddlgrade").append($("<option></option>").val(data.d[i].grade_id).html(data.d[i].grade_desc));
                            $("#txtcategory").val(data.d[i].category);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
        }
    </script>
    <script type="text/javascript">
        function doj() {
            var disableddates = []; //dd/mm/yyyy
            var year = new Date().getFullYear() + '';
            edate = "31-12-" + year;
            sdate = "01-01-2016"
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: "{}",
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("adduser.aspx/disdates")%>',
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        disableddates.push(data.d[i].EventDate);
                    }
                    $('#txtdoj').datepicker({
                        format: "dd-mm-yyyy",
                        keyboardNavigation: false,
                        autoclose: true,
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
    </script>
    <script type="text/javascript">
        function filllead() {
            alert(" asasas");
        }
    </script>
    <script type="text/javascript">
        function dob() {
            $('#txtdob').datepicker({
                format: "dd-mm-yyyy",
                keyboardNavigation: false,
                autoclose: true,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto"
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
                        <ol class="breadcrumb pull-right">
                            <li><a href="#">e - leave</a></li>
                            <li><a href="#">Manage</a></li>
                            <li class="active">Add User's</li>
                        </ol>
                        <h4 class="page-title">User Add</h4>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card-box">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">
                                    Name <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtname" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Username <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtuname" runat="server" CssClass="form-control" onchange="checkusername()" ClientIDMode="Static"></asp:TextBox>
                                <div id="pulsate-regularun" style="padding: 5px; width: 202px; display: none">
                                    <asp:Label ID="lblun" runat="server" CssClass="control-label" Text="Username Already Taken" ClientIDMode="Static" ForeColor="#e6674a"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Email <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" onchange="checkemail()" ClientIDMode="Static"></asp:TextBox>
                                <div id="pulsate-regularem" style="padding: 5px; width: 202px; display: none">
                                    <asp:Label ID="lblem" runat="server" Text="Email can't be same" ClientIDMode="Static" ForeColor="#e6674a"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Gender <span class="symbol required"></span>
                                </label>
                                <asp:DropDownList ID="ddlgender" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="gender" DataValueField="gid"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Date Join <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtdoj" runat="server" CssClass="chosen-disabled form-control" BackColor="White" ClientIDMode="Static"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Date of Birth <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtdob" runat="server" CssClass="chosen-disabled form-control" BackColor="White" ClientIDMode="Static"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">
                                    Department <span class="symbol required"></span>
                                </label>
                                <asp:DropDownList ID="ddldep" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="dep_name" DataValueField="dep_id" onchange="filldesi()"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Designation <span class="symbol required"></span>
                                </label>
                                <asp:DropDownList ID="ddldesi" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="designation" DataValueField="dsg_id" onchange="fillgrade()"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Grade <span class="symbol required"></span>
                                </label>
                                <asp:DropDownList ID="ddlgrade" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Category <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtcategory" runat="server" CssClass="form-control" ClientIDMode="Static" BackColor="White"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Region <span class="symbol required"></span>
                                </label>
                                <asp:DropDownList ID="ddlregion" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="region" DataValueField="region_id"></asp:DropDownList>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Is Lead
                                        </label>
                                        <asp:CheckBox ID="chkIslead" runat="server" CssClass="form-control" ClientIDMode="Static"/>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Reporting Officer <span class="symbol required"></span>
                                        </label>
                                        <asp:DropDownList ID="ddlreportingofficer" runat="server" CssClass="form-control" ClientIDMode="Static" DataTextField="name" DataValueField="uid"></asp:DropDownList>
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
                                <asp:Button ID="btnuseradd" runat="server" Text="Add" CssClass="btn btn-success" OnClientClick="uservali()" OnClick="btnuseradd_Click" ClientIDMode="Static" />
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

