<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="CarParkingSystem.Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>

    <header>

        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 99999;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
                padding-left: 5em;
            }

            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

                .close:hover,
                .close:focus {
                    color: black;
                    text-decoration: none;
                    cursor: pointer;
                }
        </style>
    </header>

    <br />



    <form id="maninform">

        <section class="content ">
            <div class="row">
                <div class="col-md-12">


                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">User Information</h3>
                        </div>
                        <div class="card-body usersform">
                            <input id="hidid" type="hidden" />
                            <div class="form-group row">
                                <label for="txtname" class="col-sm-3 col-form-label">Name<span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txtname" placeholder="Customer Name" contenteditable="false" required />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="txtnic" class="col-sm-3 col-form-label">NIC<span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txtnic" placeholder="NIC Number" contenteditable="false" required />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="txtusername" class="col-sm-3 col-form-label">User Name<span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" maxlength="10" class="form-control" id="txtusername" placeholder="User Name" contenteditable="false" required />
                                </div>
                            </div>

                           <%-- <div class="form-group row">
                                <label for="password" class="col-sm-3 col-form-label">Password<span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="password" placeholder="Password" contenteditable="false" required />
                                </div>
                            </div>--%>

                           <div class="form-group row">
                                <label for="password" class="col-sm-3 col-form-label">Password<span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" id="password" placeholder="Password" contenteditable="false" required />
                                  <input type="checkbox" onclick="myFunction()">Show Password
                                </div>
                            </div>


 

                            <div class="form-group row">
                                <label for="userlevel" class="col-sm-3 col-form-label">User Level<span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <select id="selectuser" class="browser-default custom-select" required>
                                        <option selected value=""> -Select One-</option>
                                        <option value="1">Admin User</option>
                                        <option value="2">Report User</option>
                                        <option value="3">Operator User</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="txtusercardno" class="col-sm-3 col-form-label">User Card No<span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="txtusercardno" placeholder="User Card No" contenteditable="false" required />
                                </div>
                            </div>

                        </div>


                        <div class="card-footer">
                            <button id="btnSave" type="submit" class="btn btn-success">Save</button>
                            <button id="btnUpdate" type="button" class="btn btn-warning">Update</button>
                            <button id="btnCancel" type="reset" class="btn btn-default float-right">Cancel</button>
                        </div>

                    </div>

                </div>

            </div>
        </section>
    </form>




    <form>

        <br />
        <section>

            <div class="card-body hiddenTable" id="mylist" style="background-color: #fff;">

                <input type="hidden" id="oldVehno" value="0" />

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">List of Users</h3>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <table id="tblinquirylist" class="table table-bordered table-hover" style="display: inline-table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>NIC</th>
                                        <th>User Name</th>
                                        <th>Password</th>
                                        <th>User Level</th>
                                        <th>User Card No</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>


                                <tbody></tbody>


                                <tfoot>
                                    <tr>
                                        <th>Name</th>
                                        <th>NIC</th>
                                        <th>User Name</th>
                                        <th>Password</th>
                                        <th>User Level</th>
                                        <th>User Card No</th>
                                        <th>Edit</th>
                                        <th>Delete</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>

                    </div>

                </div>


            </div>

        </section>
    </form>




    <div id="myModal" class="modal">

        <div class="modal-content">

            <section class="content">

                <a href="javascript:void(0)" data-dismiss="modal" aria-label="Close" class="remove modelclose" style="font-size: 20px; position: absolute; right: 35px; font-weight: bolder; top: 20px;">×</a>

                <br />
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="card card-primary">

                            <div class="card-header">
                                <h3 class="card-title">Details</h3>
                            </div>

                            <div class="card-body">
                                <div id="frmSeasons" data-parsley-validate="" class="form-horizontal form-label-left">

                                    <input type="hidden" id="txtTransId" />

                                    <div class="form-group ">
                                        <label for="txtname">
                                            Name <span class="required">:</span>
                                        </label>

                                        <label id="txtnamepopup" class="form-control"></label>

                                    </div>


                                    <div class="form-group ">
                                        <label for="txtnic">
                                            NIC <span class="required">:</span>
                                        </label>

                                        <label id="txtnicpopup" class="form-control"></label>

                                    </div>

                                    <div class="form-group ">
                                        <label for="txtusername">
                                            User Name <span class="required">:</span>
                                        </label>

                                        <label id="txtusernamepopup" class="form-control"></label>

                                    </div>

                                    <div class="form-group row">
                                        <label for="password">
                                            Password <span class="required">:</span>
                                        </label>

                                        <label id="passwordpopup" class="form-control"></label>

                                    </div>

                                    <div class="form-group ">
                                        <label for="selectuserpopup">
                                            User Level  <span class="required">:</span>
                                        </label>

                                        <label id="selectuserpopup" class="form-control"></label>
                                    </div>

                                    <div class="form-group ">
                                        <label for="txtusercardno">
                                            User Card No <span class="required">:</span>
                                        </label>

                                        <label id="txtusercardnopopup" class="form-control"></label>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndeleteyes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                   
                    <button type="reset" class="btn btn-danger modelclose">Cancel</button>
                </div>

            </section>
        </div>

    </div>

    <script>

        $(document).ready(function () {
            loadgrid();

        });

        var ID = 0;
        var delID = 0;

        function loadgrid() {

            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").removeAttr('disabled');
            $("#btnUpdate").attr('disabled', 'disabled');
            
            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/gridchange',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    $("#tblinquirylist tbody").empty();

                    var myData = JSON.parse(response.d)
                    if (myData == "") {
                        return;
                    }

                    var tr = [];
                    for (var i = 0; i < myData.length; i++) {

                        var userlevel = myData[i].UserLevel;

                        switch (userlevel) {
                            case 1:
                                userlevel = "Admin User";
                                break;
                            case 2:
                                userlevel = "Report User";
                                break;
                            case 3:
                                userlevel = "Operator User";
                                break;
                            default:
                        }

                        tr.push('<tr>')
                        tr.push("<td>" + myData[i].Name + "</td>");
                        tr.push("<td>" + myData[i].NICNo + "</td>");
                        tr.push("<td>" + myData[i].UserName + "</td>");
                        tr.push("<td>" + myData[i].Password + "</td>");
                        tr.push("<td>" + userlevel + "</td>");
                        tr.push("<td>" + myData[i].UserCardNo + "</td>");
                        //tr.push("<td><button id=\"btnEdit\" type=\"button\"  onclick=\"updateFunction('" + myData[i]["id"] + "')\">Edit</button></td>");
                        tr.push("<td><button id=\"btnEdit\" type=\"button\"  onclick=\"updateFunction('" + myData[i]["id"] + "')\">Edit</button></td>");
                        tr.push("<td><button id=\"btnClose\" type=\"button\" onclick=\"deletepopupfunc('" + myData[i]["id"] + "')\">Delete</button></td>");

                    }

                    $("#tblinquirylist tbody").empty();
                    $('#tblinquirylist').append($(tr.join('')));

                },
                error: function (error) {

                    console.log(error);
                }
            });
        }


        $(".modelclose").click(function () {
            $("#myModal").modal('toggle');
        });


        $("#maninform").on('submit', function (e) {
            e.preventDefault();

            $("#txtname").attr('contenteditable', false);
            $("#txtnic").attr('contenteditable', false);
            $("#txtusername").attr('contenteditable', false);
            $("#password").attr('contenteditable', false);
            $("#txtusercardno").attr('contenteditable', false);
            $("#selectuser").attr('contenteditable', false);

            $("#btnSave").attr('disabled', 'disabled');
            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").removeAttr('disabled');

            var txtname = $("#txtname").val();
            var txtnic = $("#txtnic").val();
            var txtusername = $("#txtusername").val();
            var password = $("#password").val();
            var selectuser = $("#selectuser").val();
            var txtusercardno = $("#txtusercardno").val();


            if (txtname.trim() !== "" || txtname !== null && txtnic.trim() !== "" || txtnic !== null && txtusername.trim() !== "" || txtusername !== null && password.trim() !== "" || password !== null && selectuser !== "-Select One-" || selectuser !== null && txtusercardno.trim() !== "" || txtusercardno !== null) {
                $.ajax({
                    type: 'POST',
                    url: 'Customer.aspx/SaveUser',
                    dataType: 'json',
                    data: '{"Name":"' + $("#txtname").val() + '","NICNo":"' + $("#txtnic").val() + '","UserName":"' + $("#txtusername").val() + '","Password":"' + $("#password").val() + '","UserLevel":"' + $("#selectuser").val() + '","UserCardNo":"' + $("#txtusercardno").val() + '" }',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)

                        console.log(myData);

                        loadgrid();

                        swal("Success", "Data Has Been Saved Successfully!", "success");

                    },
                    error: function (error) {
                        console.log(error);
                    }
                });


            } else {
                swal("Oops...", "Something went wrong!", "error");
            }
            $('#maninform')[0].reset();

        });


        function updateFunction(id) {
            ID = id;

            $("html").scrollTop(0)

            $("#btnSave").removeAttr('disabled');
            $("#btnCancel").removeAttr('disabled');
            $("#btnSave").attr('disabled', 'disabled');
            $("#btnUpdate").removeAttr('disabled');

            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/getuserdtl',
                dataType: 'json',
                data: '{"id":"' + ID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)
                    $('#txtname').val(myData[0]["Name"]);
                    $('#txtnic').val(myData[0]["NICNo"]);
                    $('#txtusername').val(myData[0]["UserName"]);
                    $('#password').val(myData[0]["Password"]);
                    $('#selectuser').val(myData[0]["UserLevel"]);
                    $('#txtusercardno').val(myData[0]["UserCardNo"]);
                },
                error: function (error) {
                    console.log(error);
                }
            });

        }

        $(function () {

            $("#btndeleteyes").click(function () {

                $.ajax({
                    type: 'POST',
                    url: 'Customer.aspx/popupdelete',
                    dataType: 'json',
                    data: '{"id":"' + delID + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)
                        loadgrid();
                        $("#myModal").modal('toggle');

                        swal("Success", "Data Has Been Deleted Successfully!", "success");


                    },
                    error: function (error) {
                        console.log(error);
                    }
                });

            });

        });


        function deletepopupfunc(id) {
            delID = id;

            $.ajax({
                type: 'POST',
                url: 'Customer.aspx/getuserdtl',
                dataType: 'json',
                data: '{"id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModal").modal('show');

                    var userlvldrpdwn = myData[0]["UserLevel"];


                    if (userlvldrpdwn == 3) {
                        userlvldrpdwn = "Operator User"
                    } else if (userlvldrpdwn == 2) {
                        userlvldrpdwn = "Report User"
                    } else {
                        userlvldrpdwn = "Admin User"
                    }



                    $('#txtnamepopup').html(myData[0]["Name"]);
                    $('#txtnicpopup').html(myData[0]["NICNo"]);
                    $('#txtusernamepopup').html(myData[0]["UserName"]);
                    $('#passwordpopup').html(myData[0]["Password"]);
                    $('#txtusercardnopopup').html(myData[0]["UserCardNo"]);
                    $('#selectuserpopup').html(userlvldrpdwn);


                },
                error: function (error) {
                    console.log(error);
                }
            });

        }




        $(function () {

            $("#btnUpdate").click(function () {


                $("#btnCancel").removeAttr('disabled');
                $("#btnUpdate").removeAttr('disabled');
                $("#btnSave").removeAttr('disabled');


                var txtname = $("#txtname").val();
                var txtnic = $("#txtnic").val();
                var txtusername = $("#txtusername").val();
                var password = $("#password").val();
                var selectuser = $("#selectuser").val();
                var txtusercardno = $("#txtusercardno").val();


                if (txtname.trim() == "" || txtname == null) {
                    swal("Name Required!");
                    return;
                } else if

                (txtnic.trim() == "" || txtnic == null) {
                    swal("NIC required!");
                    return;
                } else if (txtusername.trim() == "" || txtusername == null) {
                    swal("User Name Required!");
                    return;
                } else if (password.trim() == "" || password == null) {
                    swal("Password required!");
                    return;
                } else if (selectuser == "") {
                    swal("User Level required!");
                    return;
                } else if (txtusercardno.trim() == "" || txtusercardno == null) {
                    swal("User Card No Required!");
                    return;
                } else {


                    $.ajax({
                        type: 'POST',
                        url: 'Customer.aspx/Updateuser',
                        dataType: 'json',
                        data: '{"Name":"' + $("#txtname").val() + '","NICNo":"' + $("#txtnic").val() + '","UserName":"' + $("#txtusername").val() + '","Password":"' + $("#password").val() + '","UserLevel":"' + $("#selectuser").val() + '","UserCardNo":"' + $("#txtusercardno").val() + '","id":"' + ID + '" }',
                        contentType: 'application/json; charset=utf-8',
                        success: function (response) {

                            var myData = JSON.parse(response.d)
                            loadgrid();
                            swal("Success", "Data Has Been Updated Successfully!", "success");


                            $('#txtname').val("");
                            $('#txtnic').val("");
                            $('#txtusername').val("");
                            $('#password').val("");
                            $('#selectuser').val("");
                            $('#txtusercardno').val("");


                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });
                }
            });
        });


        $("#btnCancel").click(function () {

            $("#btnSave").removeAttr('disabled');
            $("#btnUpdate").removeAttr('disabled');

        });



        $("#btnEdit").click(function () {
            $("html, body").animate({ scrollTop: 0 }, "slow");
            return false;
        });



        $(function () {
            $('#tblinquirylist').DataTable({
                "paging": false,
                "lengthChange": true,
                "searching": false,
                "ordering": false,
                "info": false,
                "autoWidth": false,
            });
        });


        function myFunction() {
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
   




    </script>
</asp:Content>
