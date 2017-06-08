﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="app_rej_forward.aspx.cs" Inherits="e_leave_V.hr.app_rej_forward" MasterPageFile="~/hr/hrMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
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
        function errormail() {
            swal({
                title: 'Warning!',
                text: 'Mail Not Sent!',
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
                            <li class="active">Forward Cancel</li>
                        </ol>
                        <h4 class="page-title">List  Leave(s)</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box">
                        <asp:GridView ID="approved_hr" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" DataKeyNames="lid" OnPreRender="approved_hr_PreRender">
                            <Columns>
                                <asp:TemplateField HeaderText="No">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Name" DataField="name" />
                                <asp:BoundField HeaderText="Department" DataField="depname" />
                                <asp:BoundField HeaderText="Designation" DataField="desig" />
                                <asp:BoundField HeaderText="Leave Type" DataField="ltype" />
                                <asp:BoundField HeaderText="Dates Applied" DataField="dates">
                                    <ItemStyle CssClass="WordWrap1" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Period" DataField="period" />
                                <asp:BoundField HeaderText="Reason" DataField="reason" />

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
                                        <asp:LinkButton ID="lnk_appr" runat="server" CssClass="btn btn-icon waves-effect waves-light btn-success m-b-5" OnClick="lnk_appr_Click"><i class="fa fa-thumbs-o-up"></i></asp:LinkButton>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reject">

                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_reject" runat="server" CssClass="btn btn-icon waves-effect waves-light btn-danger m-b-5" OnClick="lnk_reject_Click"><i class="fa fa-remove"></i></asp:LinkButton>
                                    </ItemTemplate>

                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <asp:GridView ID="approved_hr_empty" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" OnPreRender="approved_hr_empty_PreRender">
                            <Columns>
                                <asp:TemplateField HeaderText="No"></asp:TemplateField>
                                <asp:BoundField HeaderText="Name" DataField="name" />
                                <asp:BoundField HeaderText="Department" DataField="depname" />
                                <asp:BoundField HeaderText="Designation" DataField="desig" />
                                <asp:BoundField HeaderText="Leave Type" DataField="ltype" />
                                <asp:BoundField HeaderText="Dates Applied" DataField="dates">
                                    <ItemStyle CssClass="WordWrap1" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Period" DataField="period" />
                                <asp:BoundField HeaderText="Reason" DataField="reason" />

                                <asp:BoundField DataField="idate" HeaderText="idate">
                                    <HeaderStyle CssClass="hidden"></HeaderStyle>
                                    <ItemStyle CssClass="hidden"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="email" HeaderText="Email">
                                    <HeaderStyle CssClass="hidden"></HeaderStyle>
                                    <ItemStyle CssClass="hidden"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Approve"></asp:TemplateField>
                                <asp:TemplateField HeaderText="Reject"></asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
