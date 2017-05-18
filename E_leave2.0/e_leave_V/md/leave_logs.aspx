<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="leave_logs.aspx.cs" Inherits="e_leave_V.md.leave_logs" MasterPageFile="~/md/MdMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .WordWrap1 {
            /*width: 100%;*/
            word-break: break-all;
        }
    </style>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
        });
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
                            <li class="active">Leave Status</li>
                        </ol>
                        <h4 class="page-title">List  Leave(s)</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box">
                        <asp:GridView ID="grd_log" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="lid" OnPreRender="grd_log_PreRender">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="ltype" HeaderText="Leave Type" />
                                <asp:BoundField DataField="req_date" HeaderText="Requested Date" />
                                <asp:BoundField DataField="dates" HeaderText="Dates Applied">
                                    <ItemStyle CssClass="WordWrap1" />
                                </asp:BoundField>
                                <asp:BoundField DataField="period" HeaderText="Period" />
                                <asp:BoundField DataField="rej_reason" HeaderText="Reject Reason">
                                    <ItemStyle CssClass="WordWrap1" />
                                </asp:BoundField>
                                <asp:BoundField DataField="stat" HeaderText="Status" />
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
