<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="CarParkingSystem.Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


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
    <%--<br />--%>


    <form id="demo-form1">

        <!-- Main content -->
        <section class="content ">
            <div class="row">
                <div class="col-md-12">


                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Company Information</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <%-- <form class="form-horizontal">--%>
                        <div class="card-body usersform">

                            <div class="form-group row">
                                <label for="txtcompanyname" class="col-sm-3  col-form-label">Company Name <span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="compname" placeholder="Company Name" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="txtadress" class="col-sm-3 col-form-label">Address <span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="address" placeholder="Address" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="txtcontactperson" class="col-sm-3 col-form-label">Contact Person <span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="contperson" placeholder="Name" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="txtmobilenumber" class="col-sm-3 col-form-label">Mobile Number <span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="mobilenumber" placeholder="Mobile Number" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="txtlandnumber" class="col-sm-3 col-form-label">Land Number <span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="landnumber" placeholder="Land Number" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="txtemail" class="col-sm-3 col-form-label">Email <span class="required">*</span></label>
                                <div class="col-sm-9">
                                    <input type="email" class="form-control" id="email" placeholder="Email Address" required>
                                </div>
                            </div>

                        </div>


                        <div class="card-footer">
                            <button type="submit" id="btnSave" class="btn btn-success">Save</button>
                            <button type="button" id="btnUpdate" class="btn btn-warning">Update</button>
                            <button type="button" id="btnCancel" class="btn btn-default float-right">Cancel</button>
                        </div>

                    </div>

                </div>

            </div>
        </section>
    </form>


    <br />
    <br />
    <h4>List of Companies</h4>
    <form id="demo-form2" data-parsley-validate="" class="form-horizontal form-label-left">

        <table id="companygrid" class="table table-bordered table-responsive" style="display: inline-table">
        </table>


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

                                <form id="frmSeasons" data-parsley-validate="" class="form-horizontal form-label-left">
                                    <input type="hidden" id="txtTransId" />

                                    <div class="form-group">
                                        <label for="txtcompanyname">
                                            Company Name 
                                        </label>
                                        <label id="compnamepopup" class="form-control"></label>
                                    </div>

                                    <div class="form-group">
                                        <label for="txtaddress">
                                            Address
                                        </label>
                                        <label id="addresspopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="txtcontperson">
                                            Contact Person
                                        </label>
                                        <label id="contpersonpopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="txtmobilenumber">
                                            Mobile Number
                                        </label>
                                        <label id="mobilenumberpopup" class="form-control"></label>
                                    </div>


                                    <div class="form-group">
                                        <label for="txtlandnumber">
                                            Land Number
                                        </label>
                                        <label id="landnumberpopup" class="form-control"></label>
                                    </div>

                                    <div class="form-group">
                                        <label for="txtemail">
                                            Email 
                                        </label>
                                        <label id="emailpopup" class="form-control"></label>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row float-right" style="padding-right: 8px;">
                    <button id="btndeleteyes" class="btn btn-info" type="button">Yes</button>
                    &nbsp;&nbsp;
                    <button id="btncancel" type="button" class="btn btn-danger js-modal-close modelclose">Cancel</button>
                </div>

            </section>
        </div>
    </div>


    <script>

        var ID = 0;
        var delID = 0;

        $(document).ready(function () {
            loadgrid();
        });

        $(".modelclose").click(function () {
            $("#myModal").modal('toggle');
        });

        $("#btnSave").click(function () {

            var compname = $("#compname").val();
            var address = $("#address").val();
            var contperson = $("#contperson").val();
            var mobilenumber = $("#mobilenumber").val();
            var landnumber = $("#landnumber").val();
            var email = $("#email").val();

            if (compname.trim() == "" || compname == null) {              
                swal("Company Name Required!");
                return;
            } else if

            (address.trim() == "" || address == null) {              
                swal("Address required!");
                return;
            } else if (contperson.trim() == "" || contperson == null) {               
                swal("Contact Person  Required!");
                return;
            } else if (mobilenumber.trim() == "" || mobilenumber == null) {               
                swal("Mobile Number required!");
                return;
            } else if (landnumber.trim() == "" || landnumber == null) {              
                swal("Land Number required!");
                return;
            } else if (email.trim() == "" || email == null) {              
                swal("Email Required!");
                return;
            } else if (!validateEmail(email)) {

            } else {


                $("#compname").attr('contenteditable', false);
                $("#address").attr('contenteditable', false);
                $("#contperson").attr('contenteditable', false);
                $("#mobilenumber").attr('contenteditable', false);
                $("#landnumber").attr('contenteditable', false);
                $("#email").attr('contenteditable', false);


                $("#btnUpdate").removeAttr('disabled');
                $("#btnSave").attr('disabled', 'disabled');
                $("#btnCancel").removeAttr('disabled');


                $.ajax({
                    type: 'POST',
                    url: 'Company.aspx/SaveCompany',
                    dataType: 'json',
                    data: '{"CompanyName":"' + $("#compname").val() + '","Adress1":"' + $("#address").val() + '","ContactPerson":"' + $("#contperson").val() + '","Telephone1":"' + $("#mobilenumber").val() + '","Telephone2":"' + $("#landnumber").val() + '","eMail":"' + $("#email").val() + '"}',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {

                        var myData = JSON.parse(response.d)                       
                        
                        swal("Success", "Data Has Been Saved Successfully!", "success");
                        loadgrid();
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
        });


        function validateEmail(email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(String(email).toLowerCase());
        }



        function loadgrid(e) {

            $.ajax({
                type: 'POST',
                url: 'Company.aspx/gridchange',
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {
                    $("#companygrid").empty();
                    $("#companygrid").append("<tr><th>Company Name</th> <th>Address</th > <th>Contact Person</th ><th>Mobile Number</th ><th>Land Number</th ><th>Email</th > <th>Edit</th> <th>Delete</th></tr>");

                    var companyData = JSON.parse(response.d);
                    for (var i = 0; i < companyData.length; i++) {

                        $("#companygrid").append("<tr>" +
                            "<td> " + companyData[i]["CompanyName"] + " </td>" +
                            "<td> " + companyData[i]["Adress1"] + "</td>" +
                            "<td> " + companyData[i]["ContactPerson"] + "</td>" +
                            "<td> " + companyData[i]["Telephone1"] + "</td>" +
                            "<td> " + companyData[i]["Telephone2"] + "</td>" +
                            "<td> " + companyData[i]["eMail"] + "</td>" +
                            "<td><button id=\"btnEdit\" type=\"button\"  onclick=\"updateFunction('" + companyData[i]["id"] + "')\">Edit</button></td>" + "<td><button id=\"btnDelete\" type=\"button\" onclick=\"deletepopupfunc('" + companyData[i]["id"] + "')\">Delete</button></td>" + "</tr > ");
                    }

                },
                error: function (error) {
                    console.log(error);
                }
            });
        }



        function updateFunction(id) {
            ID = id;
            $.ajax({
                type: 'POST',
                url: 'Company.aspx/getcompanydtl',
                dataType: 'json',
                data: '{"id":"' + ID + '"}',

                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $('#compname').val(myData[0]["CompanyName"]);
                    $('#address').val(myData[0]["Adress1"]);
                    $('#contperson').val(myData[0]["ContactPerson"]);
                    $('#mobilenumber').val(myData[0]["Telephone1"]);
                    $('#landnumber').val(myData[0]["Telephone2"]);
                    $('#email').val(myData[0]["eMail"]);

                },
                error: function (error) {
                    console.log(error);
                }
            });
        }


        $("#btnUpdate").click(function () {

            var compname = $("#compname").val();
            var address = $("#address").val();
            var contperson = $("#contperson").val();
            var mobilenumber = $("#mobilenumber").val();
            var landnumber = $("#landnumber").val();
            var email = $("#email").val();

            if (compname.trim() == "" || compname == null) {
                swal("Company Name Required!");
                return;
            } else if (address.trim() == "" || address == null) {
                swal("Address required!");
                return;
            } else if (contperson.trim() == "" || contperson == null) {
                swal("Contact Person  Required!");
                return;
            } else if (mobilenumber.trim() == "" || mobilenumber == null) {
                swal("Mobile Number required!");
                return;
            } else if (landnumber.trim() == "" || landnumber == null) {
                swal("Land Number required!");
                return;
            } else if (email.trim() == "" || email == null) {
                swal("Email Required!");
                return;

            } else {


                $("#compname").attr('contenteditable', true);
                $("#address").attr('contenteditable', true);
                $("#contperson").attr('contenteditable', true);
                $("#mobilenumber").attr('contenteditable', true);
                $("#landnumber").attr('contenteditable', true);
                $("#email").attr('contenteditable', true);


                $("#btnAdd").attr('disabled', 'disabled');
                $("#btnSave").removeAttr('disabled');
                $("#btnCancel").removeAttr('disabled');
                $("#btnSave").attr('disabled', 'disabled');
                $("#btnUpdate").removeAttr('disabled');
                $("#btnExit").attr('disabled', 'disabled');

                $.ajax({
                    type: 'POST',
                    url: 'Company.aspx/UpdateCompany',
                    dataType: 'json',
                    data: '{"CompanyName":"' + $("#compname").val() + '","Adress1":"' + $("#address").val() + '","ContactPerson":"' + $("#contperson").val() + '","Telephone1":"' + $("#mobilenumber").val() + '","Telephone2":"' + $("#landnumber").val() + '","eMail":"' + $("#email").val() + '","id":"' + ID + '"  }',
                    contentType: 'application/json; charset=utf-8',
                    success: function (response) {


                        var myData = JSON.parse(response.d)

                        //  $("#myModal").modal('toggle');               
                        swal("Success", "Data Has Been Updated Successfully!", "success");
                        loadgrid();
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }
        });

        //$(function () {

        $("#btndeleteyes").click(function () {

            $.ajax({
                type: 'POST',
                url: 'Company.aspx/popupdelete',
                dataType: 'json',
                data: '{"id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModal").modal('toggle');

                    //-sweetalert-
                    swal("Success", "Data Has Been Deleted Successfully!", "success");

                    loadgrid();

                },
                error: function (error) {
                    console.log(error);
                }
            });

        });

        function deletepopupfunc(id) {
            delID = id;

            $.ajax({
                type: 'POST',
                url: 'Company.aspx/getcompanydtl',
                dataType: 'json',
                data: '{"id":"' + delID + '"}',
                contentType: 'application/json; charset=utf-8',
                success: function (response) {

                    var myData = JSON.parse(response.d)

                    $("#myModal").modal('show');

                    $('#compnamepopup').html(myData[0]["CompanyName"]);
                    $('#addresspopup').html(myData[0]["Adress1"]);
                    $('#contpersonpopup').html(myData[0]["ContactPerson"]);
                    $('#mobilenumberpopup').html(myData[0]["Telephone1"]);
                    $('#landnumberpopup').html(myData[0]["Telephone2"]);
                    $('#emailpopup').html(myData[0]["eMail"]);


                },
                error: function (error) {
                    console.log(error);
                }

            });
        }


    </script>


</asp:Content>
