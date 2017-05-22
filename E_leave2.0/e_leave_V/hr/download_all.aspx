<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="download_all.aspx.cs" Inherits="e_leave_V.hr.download_all" MasterPageFile="~/hr/hrMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
            TableData.init();
        });
    </script>
    <style type="text/css">
        .hidden {
            display: none;
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
                            <li class="active">Download Approved</li>
                        </ol>
                        <h4 class="page-title">Approved Leave(s)</h4>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-box">
                    <asp:GridView ID="grd_leave_dwnld" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap" DataKeyNames="lid" ClientIDMode="Static" OnPreRender="grd_leave_dwnld_PreRender">
                        <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="region_id" HeaderText="Region">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name" />
                            <asp:BoundField DataField="ltype" HeaderText="Leave Type" />
                            <asp:BoundField DataField="req_date" HeaderText="Requested Date" />
                            <asp:BoundField DataField="dates" HeaderText="Dates Applied">
                                <ItemStyle CssClass="WordWrap1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="period" HeaderText="Period" />
                            <asp:BoundField DataField="stat" HeaderText="Status" />
                            <asp:BoundField DataField="med_path" HeaderText="File Path">
                                <HeaderStyle CssClass="hidden"></HeaderStyle>
                                <ItemStyle CssClass="hidden"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Medical Certificate">
                                <ItemTemplate>
                                    <asp:LinkButton ID="med_lnk" runat="server" CssClass="fa fa-external-link" Visible='<%# Isenable((string)Eval("ltype")) %>' OnClientClick="PostToNewWindow()" OnClick="med_lnk_Click" ToolTip="Medical Certificate"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Download">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkdwnld_all" runat="server" CssClass="fa fa-external-link" ToolTip="Download" OnClick="lnkdwnld_all_Click" OnClientClick="PostToNewWindow()"></asp:LinkButton>
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
