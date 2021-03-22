<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DurationOfStay.aspx.cs" Inherits="CarParkingSystem.DurationOfStay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <form id="formdurationofstay">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Duration Of Stay Report</h1>
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
                            <h3 class="card-title">Duration Of Stay Report</h3>
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
                        <h3 class="card-title">Duration Of Stay Report</h3>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <table id="GvMisingVehNo" class="table table-bordered table-hover table-responsive durationofstay" style="display: inline-table" border="1" cellspacing="0" cellpadding="5">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Less than 8 min. </th>
                                        <th>Less then 30 min.</th>
                                        <th>Less then 1 Hr. </th>
                                        <th>Less then 2 Hr. </th>
                                        <th>More then 2 Hr. </th>
                                    </tr>
                                </thead>


                                <tbody id="tblstaybody"></tbody>


                                <tfoot>
                                    <tr>
                                        <th></th>
                                        <th>Less than 8 min. </th>
                                        <th>Less then 30 min.</th>
                                        <th>Less then 1 Hr. </th>
                                        <th>Less then 2 Hr. </th>
                                        <th>More then 2 Hr. </th>
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
            $('.durationofstay').DataTable({
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

            $('#labeldate1prnt1').html(d1);
            $('#labeldate1prnt2').html(d2);

            var divToPrint = document.getElementById('GvMisingVehNo');

            newWin = window.open("");

            newWin.document.write('<div style="text-align: center">', );
            newWin.document.write('<p style="font-size:16px;"> <b> Gas Land </b> </p>', );
            newWin.document.write('<p style="font-size:15px"> Car Park Management System </p>', );
            newWin.document.write('<p style="font-size:14px"> Duration of Stay Report </p>', );
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


        $("#formdurationofstay").on('submit', function (e) {
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
                url: 'DurationOfStay.aspx/DurationOfStayReport',
                dataType: 'json',
                data: '{ "date1":"' + date1 + '","date2":"' + date2 + '" }',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    console.log(myData);

                    if (myData == "") {
                        $("#tblstaybody").remove();
                        return;
                    }

                    var tr = [];

                    var intime1st = new Date(myData[0].DateIn);
                    newintime1st = (intime1st.getFullYear() + '/' + (intime1st.getMonth() + 1) + '/' + intime1st.getDate());

                    tr.push('<tr>')
                    tr.push("<td> <b> " + newintime1st + " </b> </td>");
                    tr.push("<td></td>");
                    tr.push("<td></td>");
                    tr.push("<td></td>");
                    tr.push("<td></td>");
                    tr.push("<td></td>");
                    tr.push('</tr>');

                    for (var i = 0; i < myData.length; i++) {
                        
                        var intime = new Date(myData[i].DateIn);
                        newintime = (intime.getFullYear() + '/' + (intime.getMonth() + 1) + '/' + intime.getDate());

                        var j = i - 1;

                        if (j != -1) {

                            var injtime = new Date(myData[j].DateIn);
                            newjintime = (injtime.getFullYear() + '/' + (injtime.getMonth() + 1) + '/' + injtime.getDate());
                        }

                        if (j != -1 && newintime != newjintime) {
                            tr.push('<tr>')
                            tr.push("<td> <b> " + newintime + " </b> </td>");
                            tr.push("<td></td>");
                            tr.push("<td></td>");
                            tr.push("<td></td>");
                            tr.push("<td></td>");
                            tr.push("<td></td>");
                            tr.push('</tr>');
                        } else { }
                     
                        tr.push('<tr>')
                        tr.push("<td>" + myData[i].VehicleCategory + "</td>");
                        tr.push("<td>" + myData[i].Column1 + "</td>");
                        tr.push("<td>" + myData[i].Column2 + "</td>");
                        tr.push("<td>" + myData[i].Column3 + "</td>");
                        tr.push("<td>" + myData[i].Column4 + "</td>");
                        tr.push("<td>" + myData[i].Column5 + "</td>");
                        tr.push('</tr>');
                    }

                    $("#tblstaybody").html('');
                    $("#tblstaybody").append($(tr.join('')));

                },
                error: function (error) {

                    console.log(error);

                }
            });
        }

        $("#btncancel").on('click', function () {

            $("#formdurationofstay").trigger('reset');
            $('.hiddenTable').hide();

        });


    </script>


</asp:Content>
