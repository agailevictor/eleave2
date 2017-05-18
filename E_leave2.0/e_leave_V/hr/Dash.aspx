<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dash.aspx.cs" Inherits="e_leave_V.hr.Dash" MasterPageFile="~/hr/hrMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            setcolspan();
            leaves();
            calendar();
        });
    </script>
    <script type="text/javascript">
        function calendar() {
            var data = {};
            var rid = '<%= Session["region"] %>';
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"rid":"' + rid + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("Dash.aspx/GetEvents_calendar")%>',
                dataType: "json",
                success: function (data) {
                    var event1 = [];
                    for (var i = 0; i < data.d.length; i++) {
                        event1.push({
                            "title": data.d[i].EventName,
                            "start": data.d[i].EventDate,
                            "color": data.d[i].color
                        });
                    }
                    var today = new Date();
                    var dd = today.getDate();
                    var mm = today.getMonth() + 1; //January is 0!
                    var yyyy = today.getFullYear();

                    if (dd < 10) {
                        dd = '0' + dd
                    }

                    if (mm < 10) {
                        mm = '0' + mm
                    }
                    today = yyyy + '-' + mm + '-' + dd;

                    /* initialize the calendar
                    -----------------------------------------------------------------*/
                    $('#calendar').fullCalendar({
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,basicWeek,basicDay'
                        },
                        defaultDate: today,
                        editable: true,
                        droppable: true, // this allows things to be dropped onto the calendar
                        eventLimit: true, // allow "more" link when too many events
                        events: event1,
                        eventClick: function (event) {
                            $('#mbody').html(event.title);
                            $('#mbody').css('color', event.color);
                            $('#event-management').modal('show');
                        }
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }
    </script>
    <script type="text/javascript">
        function setcolspan() {
            var gender = '<%= Session["gender"] %>';
            if (gender == "Male") {
                $("#ann1").addClass("col-sm-3");
                $("#med1").addClass("col-sm-3");
                $("#repl1").addClass("col-sm-3");
                $("#pl1").addClass("col-sm-3");
                // class="col-sm-4"
                $("#mrg1").remove();
            }
            else {
                $("#ann1").addClass("col-sm-3");
                $("#med1").addClass("col-sm-3");
                $("#repl1").addClass("col-sm-3");
                $("#mrg1").addClass("col-sm-3");
                // class="col-sm-3"
                $("#pl1").remove();
            }
        }

    </script>
    <script type="text/javascript">
        function leaves() {
            var data = {};
            var userid = '<%= Session["user_id"] %>';
            data.uid = userid;
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"userid":"' + userid + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("Dash.aspx/fetchleave")%>',
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        if (data.d[i].LeaveType == "Annual") {
                            $('#ann').empty();
                            $('#ann').removeData();
                            $('#ann').attr("data-percent", data.d[i].LeavePerc);
                            $('#ann').attr("data-text", data.d[i].LeaveCount);
                            $('#ann').attr("data-info", data.d[i].LeaveType);
                            $('#ann').attr("data-fgcolor", "#007AFF");
                            $('#ann').circliful();
                        }
                        else if (data.d[i].LeaveType == "Medical") {
                            $('#med').empty();
                            $('#med').removeData();
                            $('#med').attr("data-percent", data.d[i].LeavePerc);
                            $('#med').attr("data-text", data.d[i].LeaveCount);
                            $('#med').attr("data-info", data.d[i].LeaveType);
                            $('#med').attr("data-fgcolor", "#FF4C4C");
                            $('#med').circliful();
                        }
                        else if (data.d[i].LeaveType == "Marriage") {
                            $('#repl').empty();
                            $('#repl').removeData();
                            $('#repl').attr("data-percent", data.d[i].LeavePerc);
                            $('#repl').attr("data-text", data.d[i].LeaveCount);
                            $('#repl').attr("data-info", data.d[i].LeaveType);
                            $('#repl').attr("data-fgcolor", "#339933");
                            $('#repl').circliful();
                        }
                        else if (data.d[i].LeaveType == "Maternity") {
                            $('#mrg').empty();
                            $('#mrg').removeData();
                            $('#mrg').attr("data-percent", data.d[i].LeavePerc);
                            $('#mrg').attr("data-text", data.d[i].LeaveCount);
                            $('#mrg').attr("data-info", data.d[i].LeaveType);
                            $('#mrg').attr("data-fgcolor", "#FF8000");
                            $('#mrg').circliful();
                        }
                        else if (data.d[i].LeaveType == "Paternity") {
                            $('#pl').empty();
                            $('#pl').removeData();
                            $('#pl').attr("data-percent", data.d[i].LeavePerc);
                            $('#pl').attr("data-text", data.d[i].LeaveCount);
                            $('#pl').attr("data-info", data.d[i].LeaveType);
                            $('#pl').attr("data-fgcolor", "#FF8000");
                            $('#pl').circliful();
                        }
                        else {
                            console.log('uncaught');
                        }
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        }
        setInterval(leaves, 10000); // 10 seconds
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
                            <li><a href="#">Main</a></li>
                            <li class="active">Dashboard</li>
                        </ol>
                        <h4 class="page-title">Dashboard</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="ann1" class="col-sm-6 col-lg-3">
                    <div class="widget-simple-chart text-right card-box">
                        <center>
                            <div id="ann"></div>
                        </center>
                    </div>
                </div>

                <div id="med1" class="col-sm-6 col-lg-3">
                    <div class="widget-simple-chart text-right card-box">
                        <center>
                            <div id="med"></div>
                        </center>
                    </div>
                </div>

                <div id="repl1" class="col-sm-6 col-lg-3">
                    <div class="widget-simple-chart text-right card-box">
                        <center>
                            <div id="repl"></div>
                        </center>
                    </div>
                </div>

                <div id="mrg1" class="col-sm-6 col-lg-3">
                    <div class="widget-simple-chart text-right card-box">
                        <center>
                            <div id="mrg"></div>
                        </center>
                    </div>
                </div>

                <div id="pl1" class="col-sm-6 col-lg-3">
                    <div class="widget-simple-chart text-right card-box">
                        <center>
                            <div id="pl"></div>
                        </center>
                    </div>
                </div>
            </div>
            <!-- end row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card-box">
                        <h4 class="text-dark  header-title m-t-0">Calendar</h4>
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end container -->
    </div>
    <!-- end content -->
    <div id="event-management" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="modal-title">Holiday Details</h4>
                </div>
                <div class="modal-body" id="modal-body">
                    <h2 id="mbody"></h2>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-light-grey">
                        Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
