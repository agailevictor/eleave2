<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListLeaves.aspx.cs" Inherits="e_leave_V.user.ListLeaves" MasterPageFile="~/user/UserMaster.Master" %>

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
                text: 'Your request has been succesfully Updated',
                type: 'success',
                allowEscapeKey: false,
                allowOutsideClick: false
            });
        }
    </script>
    <script type="text/javascript">
        function errormail() {
            swal({
                title: 'Error!',
                text: 'Mail Not Send',
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
                title: 'Error!',
                text: 'Could Not Fetch Mail Details',
                type: 'error',
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

    <script type="text/javascript">
        function PostToNewWindow() {
            originalTarget = document.forms[0].target;
            document.forms[0].target = '_blank';
            window.setTimeout("document.forms[0].target=originalTarget;", 300);
            return true;
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
                            <li><a href="leaveapply" class="btn btn-primary btn-custom waves-effect w-md waves-light m-b-5">Request Leave</a></li>
                        </ol>
                        <h4 class="page-title">List Leaves</h4>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-box">
                    <asp:GridView ID="grd_leaves" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" DataKeyNames="lid" ClientIDMode="Static" OnPreRender="grd_leaves_PreRender">
                        <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ltype" HeaderText="Leave Type" />
                            <asp:BoundField DataField="req_date" HeaderText="Applied On" />
                            <asp:BoundField DataField="dates" HeaderText="Dates Applied">
                                <ItemStyle CssClass="WordWrap1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="period" HeaderText="Period" />
                            <asp:BoundField DataField="rej_reason" HeaderText="Reject Reason">
                                <ItemStyle CssClass="WordWrap1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="stat" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Operation">
                                <ItemTemplate>
                                    <asp:Button ID="btncancel" runat="server" CssClass="btn btn-danger" OnClick="btncancel_Click" Text="Cancel" Visible='<%# Isvisible((string)Eval("stat")) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Download">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnldownload" runat="server" CssClass="fa fa-external-link" OnClick="lnldownload_Click" ToolTip="Download" Visible='<%# Isenable((string)Eval("stat")) %>' OnClientClick="PostToNewWindow()"></asp:LinkButton>
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
