<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dash.aspx.cs" Inherits="e_leave_V.md.Dash" MasterPageFile="~/md/MdMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            leaves();
            calendar();
        });
    </script>
    <script type="text/javascript">
        function leaves() {
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: "{}",
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("Dash.aspx/highcharts")%>',
                dataType: "json",
                success: function (data) {
                    var cat = [], data1 = [], data2 = [], data3 = [], data4 = [], data5 = [], data6 = [];
                    for (var i = 0; i < data.d.length; i++) {
                        cat.push(data.d[i].Name);
                        data1.push(data.d[i].aleave);
                        data2.push(data.d[i].sleave);
                        data3.push(data.d[i].mleave);
                        data4.push(data.d[i].m2leave);
                        data5.push(data.d[i].pleave);
                        data6.push(data.d[i].hleave);
                    }
                    $('#container').highcharts({
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: 'Stacked leave chart'
                        },
                        xAxis: {
                            categories: cat
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: 'Total leaves available for the current year'
                            },
                            stackLabels: {
                                enabled: false,
                                style: {
                                    fontWeight: 'bold',
                                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                                }
                            }
                        },
                        legend: {
                            align: 'right',
                            x: -30,
                            verticalAlign: 'top',
                            y: 25,
                            floating: true,
                            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
                            borderColor: '#CCC',
                            borderWidth: 1,
                            shadow: false
                        },
                        tooltip: {
                            headerFormat: '<b>{point.x}</b><br/>',
                            pointFormat: '{series.name}: {point.y}'
                        },
                        plotOptions: {
                            column: {
                                stacking: 'normal',
                                dataLabels: {
                                    enabled: false,
                                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                                    style: {
                                        textShadow: '0 0 3px black'
                                    }
                                }
                            }
                        },
                        series: [{
                            name: 'Annual Leave',
                            data: data1
                        }, {
                            name: 'Medical Leave',
                            data: data2
                        },
                        {
                            name: 'Marriage Leave',
                            data: data3
                        },
                        {
                            name: 'Maternity Leave',
                            data: data4
                        },
                        {
                            name: 'Paternity Leave',
                            data: data5
                        },
                        {
                            name: 'Hospitalization Leave',
                            data: data6
                        }]
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });

        }
        setInterval(leaves, 60000);
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
                <div class="col-lg-12">
                    <div class="card-box">
                        <h4 class="text-dark  header-title m-t-0">Leaves</h4>
                        <div class="table-responsive">
                        <div id="container"></div>
                        </div>
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

