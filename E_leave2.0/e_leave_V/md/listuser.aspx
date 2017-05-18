<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listuser.aspx.cs" Inherits="e_leave_V.md.listuser" MasterPageFile="~/md/MdMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                            <li class="active">User's</li>
                        </ol>
                        <h4 class="page-title">List  User(s)</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box">
                        <asp:GridView ID="grd_users" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" DataKeyNames="uid" ClientIDMode="Static" OnPreRender="grd_users_PreRender">
                            <Columns>
                                <asp:TemplateField HeaderText="No.">
                                    <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="name" HeaderText="Name" />
                                <asp:BoundField DataField="uname" HeaderText="User Name" />
                                <asp:BoundField DataField="gender" HeaderText="Gender" />
                                <asp:BoundField DataField="doj" HeaderText="Date Of Join" />
                                <asp:BoundField DataField="dep" HeaderText="Department" />
                                <asp:BoundField DataField="designation" HeaderText="Designation" />
                                <asp:BoundField DataField="grade" HeaderText="Grade" />
                                <asp:BoundField DataField="region" HeaderText="Region" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
