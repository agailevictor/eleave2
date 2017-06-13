<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="holidays_upload.aspx.cs" Inherits="e_leave_V.hr.holidays_upload" MasterPageFile="~/hr/hrMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function bulkvali() {
            bulkval.init();
        }
    </script>
    <script type="text/javascript">
        function success() {
            swal({
                title: 'Success!',
                text: 'Succesfully Uploaded Holidays!',
                type: 'success',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function error() {
            swal({
                title: 'Error!',
                text: 'Check the Upload Format',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errornoval() {
            swal({
                title: 'Error!',
                text: 'You have some form errors!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <style type="text/css">
        .cust {
            width: 30%;
        }
    </style>
    <style type="text/css">
        .cust1 {
            width: 50%;
        }
    </style>
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
                            <li class="active">Upload Holiday's</li>
                        </ol>
                        <h4 class="page-title">Holiday's<small><a href="Chs"> Clear Hummingsoft Holidays</a> /</small><small><a href="Css"> Clear Summersoft Holidays</a></small></h4>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-box">
                    <div class="row">
                        <div class="col-md-12">
                            <h4 style="text-align: justify">Format for Uploading the data,copy all the cells in the excel including the header and paste it into the below shown box.
                            The columns must in the format Day,Date(yyyy-mm-dd). Download Template from here <asp:LinkButton ID="lnkdownloadtemp" CssClass="fa fa-download" runat="server" OnClick="lnkdownloadtemp_Click" Font-Underline="False"></asp:LinkButton></h4>
                            <img src="../assets/images/leaves.jpg" height="auto" width="100%" />
                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">
                                            Region <span class="symbol required"></span>
                                        </label>
                                        <asp:DropDownList ID="ddlreg" runat="server" CssClass="form-control cust" BorderColor="#999999" ClientIDMode="Static" DataTextField="region" DataValueField="region_id"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">
                                            Holidays <span class="symbol required"></span>
                                        </label>
                                        <asp:TextBox ID="txtholidays_hr" runat="server" TextMode="MultiLine"
                                            CssClass="form-control cust1" ClientIDMode="Static" MaxLength="1" Rows="2" BorderColor="#999999"></asp:TextBox>
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
                                    <asp:Button ID="btnreq_hr" runat="server" Text="Upload" CssClass="btn btn-success" OnClientClick="bulkvali()" OnClick="btnreq_hr_Click" />
                                </div>
                                <div class="col-md-4">
                                </div>
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
