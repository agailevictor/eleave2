<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListUser.aspx.cs" Inherits="e_leave_V.hr.ListUser" MasterPageFile="~/hr/hrMaster.Master" %>

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
                text: 'User Successfully Deleted !',
                type: 'success',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errornolid() {
            swal({
                title: 'Warning!',
                text: 'Something Went Wrong',
                type: 'warning',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function error() {
            swal({
                title: 'Error!',
                text: 'Operation Failed!',
                type: 'error',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <style type="text/css">
        .hidden {
            display: none;
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
                            <li><a href="AddUser" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5">Add User</a></li>
                        </ol>
                        <h4 class="page-title">List User(s)</h4>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-box">
                    <asp:GridView ID="grd_users" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" DataKeyNames="uid" ClientIDMode="Static" OnPreRender="grd_users_PreRender">
                        <Columns>
                            <asp:TemplateField HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
                                <ItemTemplate>
                                    <asp:HiddenField ID="uid" runat="server" Value='<%# Eval("uid") %>' />
                                </ItemTemplate>

                                <HeaderStyle CssClass="hidden"></HeaderStyle>

                                <ItemStyle CssClass="hidden"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="uname" HeaderText="User Name" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                            <asp:BoundField DataField="gender" HeaderText="Gender" />
                            <asp:BoundField DataField="doj" HeaderText="Date Of Join" />
                            <asp:BoundField DataField="dob" HeaderText="Date Of Birth" />
                            <asp:BoundField DataField="dep" HeaderText="Department" />
                            <asp:BoundField DataField="designation" HeaderText="Designation" />
                            <asp:BoundField DataField="grade" HeaderText="Grade" />
                            <asp:BoundField DataField="region" HeaderText="Region" />
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkedit" runat="server" CssClass="glyphicon glyphicon-edit" OnClick="lnkedit_Click" ClientIDMode="Static"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkremove" runat="server" CssClass="glyphicon glyphicon-trash" OnClick="lnkremove_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- end container -->
    </div>
    <!-- end content -->
</asp:Content>
