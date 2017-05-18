<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="leavetaken.aspx.cs" Inherits="e_leave_V.md.leavetaken" MasterPageFile="~/md/MdMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
        });
    </script>
    <style type="text/css">
        .arrange {
            text-align: right;
            padding: 20px;
            padding-top: 0;
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
                            <li><a href="#">Reports</a></li>
                            <li class="active">Leaves Taken</li>
                        </ol>
                        <h4 class="page-title">List  Leave(s)</h4>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box">
                        <asp:GridView ID="grd_ltaken" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" ClientIDMode="Static" OnPreRender="grd_ltaken_PreRender">
                            <Columns>
                                <asp:BoundField DataField="No." HeaderText="No." />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                                <asp:BoundField DataField="Annual" HeaderText="Annual" />
                                <asp:BoundField DataField="Medical" HeaderText="Medical" />
                                <asp:BoundField DataField="Marriage" HeaderText="Marriage" />
                                <asp:BoundField DataField="Maternity" HeaderText="Maternity" />
                                <asp:BoundField DataField="Paternity" HeaderText="Paternity" />
                                <asp:BoundField DataField="Hospitalization" HeaderText="Hospitalization" />
                                <asp:BoundField DataField="Compassionate" HeaderText="Compassionate" />
                                <asp:BoundField DataField="Unpaid" HeaderText="Unpaid" />
                                <asp:BoundField DataField="Replacement" HeaderText="Replacement" />
                            </Columns>
                        </asp:GridView>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-8">
                                </div>
                                <div class="col-md-4">
                                    <div class="arrange">
                                        <asp:Button ID="btnpdf" runat="server" CssClass="btn btn-success" Text="Export to PDF" ClientIDMode="Static" OnClick="btnpdf_Click" />
                                        <asp:Button ID="btnexl" runat="server" CssClass="btn btn-success" Text="Export to Excel" ClientIDMode="Static" OnClick="btnexl_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
