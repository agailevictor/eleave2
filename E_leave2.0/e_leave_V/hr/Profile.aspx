<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="e_leave_V.hr.Profile" MasterPageFile="~/hr/hrMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
            inputlimit_add1();
            inputlimit_add2();
        });
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
        function uprofilevali() {
            uprofileval.init();
        }
    </script>
    <script type="text/javascript">
        function success() {
            swal({
                title: 'Success!',
                text: 'Your profile has been succesfully Updated',
                type: 'success',
                allowEscapeKey: false,
                allowOutsideClick: false
            },
                function () {
                    window.location = "Dash";
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
        function errorlength() {
            swal({
                title: 'Error!',
                text: 'Address 1 & Address 2 can\'t be of length grater than 20 charcaters',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
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
                            <li><a href="#">Main</a></li>
                            <li class="active">Update Profile</li>
                        </ol>
                        <h4 class="page-title">User Profile</h4>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="card-box">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">
                                    Name
                                </label>
                                <asp:Label ID="lblname" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Username
                                </label>
                                <asp:Label ID="lbluname" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Email
                                </label>
                                <asp:Label ID="lblemail" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Gender
                                </label>
                                <asp:Label ID="lblgender" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Date Of Join 
                                </label>
                                <asp:Label ID="lbldoj" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Department 
                                </label>
                                <asp:Label ID="lbldep" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">
                                    Designation 
                                </label>
                                <asp:Label ID="lbldesg" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Grade 
                                </label>
                                <asp:Label ID="lblgrade" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Address 1 <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtadd1" runat="server" CssClass="form-control" ClientIDMode="Static" BorderColor="#999999"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Address 2 <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtadd2" runat="server" CssClass="form-control" ClientIDMode="Static" BorderColor="#999999"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Contact No <span class="symbol required"></span>
                                </label>
                                <asp:TextBox ID="txtphone" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">
                                    Region
                                </label>
                                <asp:Label ID="lblregion" runat="server" CssClass="form-control"
                                    ClientIDMode="Static" BorderColor="#999999"></asp:Label>
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
                                <asp:Button ID="btnuprofile" runat="server" Text="Update" CssClass="btn btn-success" OnClientClick="uprofilevali()" OnClick="btnuprofile_Click" />
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
