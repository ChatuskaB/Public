<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DailyReports.aspx.cs" Inherits="CarParkingSystem.DailyReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="frmDailyReports">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Daily Transaction Report</h1>
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
                            <h3 class="card-title">Daily Transaction Report</h3>
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
                        <h3 class="card-title">Daily Transaction Report</h3>
                    </div>

                    <div class="card" >
                        <div class="card-body" >
                            <table id="GvMisingVehNo" class="table table-bordered table-hover table-responsive example2" style="display: inline-table" border="1" cellspacing="0" cellpadding="5">
                                <thead>
                                    <tr>
                                        <th>Vehicle No. </th>
                                        <th>Vehicle Type </th>
                                        <th>Card No</th>
                                        <th>In Time/Date</th>
                                        <th>Out Time/Date</th>
                                        <th>Duration</th>
                                        <th>Revenue</th>
                                    </tr>
                                </thead>


                                <tbody id="tablebody"></tbody>


                                <tfoot>
                                    <tr>
                                        <th>Vehicle No. </th>
                                        <th>Vehicle Type </th>
                                        <th>Card No</th>
                                        <th>In Time/Date</th>
                                        <th>Out Time/Date</th>
                                        <th>Duration</th>
                                        <th>Revenue</th>
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
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        $(document).on('click', '#btnPrint', function () {

            var d1 = $("#txtdate1").val();
            var d2 = $("#txtdate2").val();

            console.log(d1);

           

            var divToPrint = document.getElementById('GvMisingVehNo');

            newWin = window.open("");   

            newWin.document.write('<div style="text-align: center">', );
            newWin.document.write('<p style="font-size:16px;"> <b> Gas Land </b> </p>', );
            newWin.document.write('</div>');

            newWin.document.write('<div style="text-align: center">', );
            newWin.document.write('<p style="font-size:15px"> Car Park Management System </p>', );
            newWin.document.write('</div>');

            newWin.document.write('<div style="text-align: center">', );
            newWin.document.write('<p style="font-size:14px"> Daily Transaction Report </p>', );
            newWin.document.write('</div>');


              newWin.document.write('<div class="row" >', );
              newWin.document.write('<label>Date</label>', );

              newWin.document.write('&nbsp;', );
              newWin.document.write('&nbsp;', );

              newWin.document.write('<label id="labeldate1prnt1">' +d1+ '</label>', );

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
                 timer: 500,
            });
                     
            $.ajax({
                type: 'POST',
                url: 'DailyReports.aspx/Loaddailyreports',
                dataType: 'json',
                data: '{ "date1":"' + date1 + '","date2":"' + date2 + '" }',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                  
                    var myData = JSON.parse(response.d)                 
                    if (myData == "") {                     
                        $("#tablebody").remove();                    
                        return;
                    }
                    
                    var tr = [];

                    for (var i = 0; i < myData.length; i++) {                       

                        var intime = myData[i].InTime;                        
                        var newintime = intime.replace('T', ' ');

                        var outtime = myData[i].OutTime;
                        var newouttime = outtime.replace('T', ' ');
                      
                        tr.push('<tr>')
                        tr.push("<td>" + ( i + 1 ) + "</td>");
                        tr.push("<td>" + myData[i].VehCategory + "</td>");
                        tr.push("<td>" + myData[i].CardNo + "</td>");
                        tr.push("<td>" + newintime + "</td>");
                        tr.push("<td>" + newouttime + "</td>");
                        tr.push("<td>" + myData[i].TotalTime + "</td>");
                        tr.push("<td>" + myData[i].TotalAmount + "</td>");
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

            $("#frmDailyReports").trigger('reset');
            $('.hiddenTable').hide();

        });


    </script>



</asp:Content>
