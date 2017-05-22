<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cf.aspx.cs" Inherits="e_leave_V.hr.cf" MasterPageFile="~/hr/hrMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
        });
    </script>
    <script type="text/javascript">
        function success() {
            swal({
                title: 'Success!',
                text: 'Leaves Carryforwarded Successfully ',
                type: 'success',
                allowEscapeKey: false,
                allowOutsideClick: false
            },
                function () {
                    window.location = "cf";
                });
        }
    </script>
    <script type="text/javascript">
        function error() {
            swal({
                title: 'Error!',
                text: 'Carry Forward Already Done!',
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
                            <li>
                                <asp:LinkButton ID="lnkcf" CssClass="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5" runat="server" OnClick="lnkcf_Click">Carry Forward</asp:LinkButton></li>
                        </ol>
                        <h4 class="page-title">Carry Forwarded Leave(s)</h4>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-box">
                    <asp:GridView ID="grd_cflist" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" ClientIDMode="Static" OnPreRender="grd_cflist_PreRender">
                        <Columns>
                            <asp:BoundField DataField="No." HeaderText="No." />
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField DataField="Date Of Join" HeaderText="Date Of Join" />
                            <asp:BoundField DataField="Department" HeaderText="Department" />
                            <asp:BoundField DataField="Designation" HeaderText="Designation" />
                            <asp:BoundField DataField="Grade" HeaderText="Grade" />
                            <asp:BoundField DataField="Leaves Forwarded" HeaderText="Leaves Forwarded" />
                            <asp:BoundField DataField="Forwarded Date" HeaderText="Forwarded Date" />
                            <asp:BoundField DataField="Region" HeaderText="Region" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- end container -->
    </div>
    <!-- end content -->
</asp:Content>

