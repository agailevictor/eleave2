<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancelappr.aspx.cs" Inherits="e_leave_V.md.cancelappr" MasterPageFile="~/md/MdMaster.Master" %>

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
                text: 'Your request has been succesfully updated !',
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
                text: 'Something Went Wrong !',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function warningemail() {
            swal({
                title: 'Warning!',
                text: 'Failed to send email !',
                type: 'warning',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <style type="text/css">
        .WordWrap1 {
            /*width: 100%;*/
            word-break: break-all;
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
                            <li><a href="#">Leaves</a></li>
                            <li class="active">Cancel Approved</li>
                        </ol>
                        <h4 class="page-title">List Leave(s)</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box">
                        <asp:GridView ID="grdcancelappr" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" DataKeyNames="lid" ClientIDMode="Static" OnPreRender="grdcancelappr_PreRender">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="name" HeaderText="Name" />
                                <asp:BoundField DataField="depname" HeaderText="Department" />
                                <asp:BoundField DataField="desig" HeaderText="Designation" />
                                <asp:BoundField DataField="ltype" HeaderText="Leave Type" />
                                <asp:BoundField DataField="dates" HeaderText="Dates Applied">
                                    <ItemStyle CssClass="WordWrap1" />
                                </asp:BoundField>
                                <asp:BoundField DataField="period" HeaderText="Period" />
                                <asp:BoundField DataField="reason" HeaderText="Reason">
                                    <ItemStyle CssClass="WordWrap1" />
                                </asp:BoundField>
                                <asp:BoundField DataField="idate" HeaderText="idate">
                                    <HeaderStyle CssClass="hidden"></HeaderStyle>

                                    <ItemStyle CssClass="hidden"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="email" HeaderText="Email">
                                    <HeaderStyle CssClass="hidden"></HeaderStyle>

                                    <ItemStyle CssClass="hidden"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Approve">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkapprove" runat="server" CssClass="btn btn-icon waves-effect waves-light btn-success m-b-5" OnClick="lnkapprove_Click"><i class="fa fa-thumbs-o-up"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reject">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkreject" runat="server" CssClass="btn btn-icon waves-effect waves-light btn-danger m-b-5" OnClick="lnkreject_Click"><i class="fa fa-remove"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
