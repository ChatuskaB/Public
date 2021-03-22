<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginDetailReport.aspx.cs" Inherits="CarParkingSystem.LoginDetailReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <form id="frmDailyReports">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Login Detail Report</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Report</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>



        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-12">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Login Detail Report</h3>
                        </div>

                        <br />

                        <div class="form-group row" style="padding-left: 30px;">
                            <label class="col-sm-3 col-form-label">Date</label>
                            <div class="col-sm-3">
                                <input required id="txtdate1" type="date" class="form-control" />
                            </div>


                            <label class="col-sm-2 col-form-label">To</label>
                            <div class="col-sm-3">
                                <input required id="txtdate2" type="date" class="form-control" />
                            </div>

                        </div>
                    </div>
                    <!-- /.card -->

                </div>

            </div>

            <br />


            <div class="row">
                <div class="col-12">
                    <a id="btncancel" class="btn btn-secondary">Cancel</a>
                    <input type="submit" value="Search" id="searchReport" class="btn btn-success">
                    <input id="btnPrint" type="button" value="Print Records" class="btn btn-warning float-right" />
                </div>
            </div>


        </section>
        <!-- /.content -->

        <br />
        <br />

        <section>




            <div class="card-body hiddenTable" id="mylist" style="background-color: #fff; display: none;">

                <input type="hidden" id="oldVehno" value="0" />

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Login Detail Report</h3>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <table id="GvMisingVehNo" class="table table-bordered table-hover table-responsive example2" style="display: inline-table" border="1" cellspacing="0" cellpadding="5">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>In Time </th>
                                        <th>Out Time</th>
                                    </tr>
                                </thead>


                                <tbody id="tablebody"></tbody>


                                <tfoot>
                                    <tr>
                                        <th></th>
                                        <th>In Time </th>
                                        <th>Out Time</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>

                </div>
            </div>


        </section>

    </form>



    <script>

        $(function () {
            $('.example2').DataTable({
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        $(document).on('click', '#btnPrint', function () {

            var d1 = $("#txtdate1").val();
            var d2 = $("#txtdate2").val();

            $('#labeldate1prnt1').html(d1);
            $('#labeldate1prnt2').html(d2);

            var divToPrint = document.getElementById('GvMisingVehNo');

            newWin = window.open("");

            newWin.document.write('<div style="text-align: center">', );
            newWin.document.write('<p style="font-size:16px;"> <b> Gas Land </b> </p>', );
            newWin.document.write('<p style="font-size:15px"> Car Park Management System </p>', );                    
            newWin.document.write('<p style="font-size:14px"> Login Detail Report </p>', );
            newWin.document.write('</div>');


            newWin.document.write('<div class="row" >', );
            newWin.document.write('<label>Date</label>', );

            newWin.document.write('&nbsp;', );
            newWin.document.write('&nbsp;', );

            newWin.document.write('<label id="labeldate1prnt1">' + d1 + '</label>', );

            newWin.document.write('&nbsp;', );
            newWin.document.write('&nbsp;', );

            newWin.document.write('<label >To</label>', );

            newWin.document.write('&nbsp;', );
            newWin.document.write('&nbsp;', );

            newWin.document.write('<label id="labeldate1prnt2"> ' + d2 + ' </label>', );
            newWin.document.write('<br />', );
            newWin.document.write('<br />', );
            newWin.document.write('</div>');

            newWin.document.write(divToPrint.outerHTML);
            newWin.print();
            newWin.close();
            $("#GvMisingVehNo span.divTitle").text("");
        })


        $("#frmDailyReports").on('submit', function (e) {
            e.preventDefault();
            $('.hiddenTable').show();

            var date_1 = $("#txtdate1").val();
            var date_2 = $("#txtdate2").val();

            loadreports(date_1, date_2);

        });


        function loadreports(date1, date2) {

            swal("Please wait...", "", {
                button: false,
                closeOnClickOutside: false,
                timer: 1000,
            });

            $.ajax({
                type: 'POST',
                url: 'LoginDetailReport.aspx/LoginReport',
                dataType: 'json',
                data: '{ "date1":"' + date1 + '","date2":"' + date2 + '" }',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    var myData = JSON.parse(response.d)

                    console.log(myData);
                  
                    if (myData == "") {
                        $("#tablebody").remove();
                        return;
                    }

                    var tr = [];

                    var intime1st = new Date(myData[0].InTime);
                    newintime1st = (intime1st.getFullYear() + '/' + (intime1st.getMonth() + 1) + '/' + intime1st.getDate());

                    tr.push('<tr>')
                    tr.push("<td> <b> " + newintime1st + " </b> </td>");
                    tr.push("<td></td>");
                    tr.push("<td></td>");                   
                    tr.push('</tr>');

                    for (var i = 0; i < myData.length; i++) {

                        var intime = new Date(myData[i].InTime);
                        newintime = (intime.getFullYear() + '/' + (intime.getMonth() + 1) + '/' + intime.getDate());

                        var outtime = myData[i].OutTime;
                        var newouttime = outtime.replace('T', ' ');

                        var intimetable = myData[i].InTime;
                        var newintimetable = intimetable.replace('T', ' ');

                        var j = i - 1;

                        if (j != -1) {

                            var injtime = new Date(myData[j].InTime);
                            newjintime = (injtime.getFullYear() + '/' + (injtime.getMonth() + 1) + '/' + injtime.getDate());
                        }

                        if (j != -1 && newintime != newjintime) {
                            tr.push('<tr>')
                            tr.push("<td> <b> " + newintime + " </b> </td>");
                            tr.push("<td></td>");
                            tr.push("<td></td>");                          
                            tr.push('</tr>');
                        } else { }

                        tr.push('<tr>')
                        tr.push("<td>" + myData[i].tablename + "</td>");
                        tr.push("<td>" + newintimetable + "</td>");
                        tr.push("<td>" + newouttime + "</td>");
                        tr.push('</tr>');
                    }

                    $("#tablebody").html('');
                    $("#tablebody").append($(tr.join('')));

                },
                error: function (error) {

                    console.log(error);

                }
            });
        }

        $("#btncancel").on('click', function () {

            $("#btncancel").trigger('reset');
            $('.hiddenTable').hide();

        });


//session = out
//session 1 = in

    </script>



</asp:Content>

