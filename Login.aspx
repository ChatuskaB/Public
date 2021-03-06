<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CarParkingSystem.Login" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Car Parking | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
   <!-- Sweetalert -->
    <script src="Scripts/sweetalert.min.js"></script>
</head>

<body class="login-page" style="min-height: 512.391px;">
    <div class="login-box" style="margin: 12% auto;">
        <div class="login-logo">
            <a href="../../index2.html"><b>Gas</b> Land</a>
          <br />
          <p style="font-size: 25px"><b>Car</b> Park</p>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <form id="loginform" method="post">
                    <div class="input-group mb-3">
                        <input id="uName" type="text" class="form-control" placeholder="User Name">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input id="uPass" type="password" class="form-control" placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="remember">
                                <label for="remember">
                                    Remember Me
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.min.js"></script>

  <script>


      $(function () {

          sessionStorage.setItem('username', '0');
          sessionStorage.setItem('password', '0');

      });

      $("#loginform").on('submit', function (e) {

          e.preventDefault();
          var user_name = $("#uName").val();
          var pass_word = $("#uPass").val();
       
          if ((user_name != "" && pass_word != "") && (user_name.trim != "" && pass_word.trim != "")) {

              loginfunction(user_name, pass_word);

          } else {         
              swal("Please Fill All the Fields", "" , "error")
          }

      });


      function loginfunction(username, password) {

          console.log(username);
          console.log(password);

          $.ajax({
              type: 'POST',
              url: 'Login.aspx/LoginMethord',
              dataType: 'json',
              data: '{ "username":"' + username + '","password":"' + password + '" }',
              contentType: 'application/json; charset=utf-8',
              success: function (response) {

                  var myData = JSON.parse(response.d)

                  console.log(myData);
               
                  if (myData == "") {
                      swal("Error", "Incorrect Username Or Password", "error")
                      return;
                  }

                  sessionStorage.setItem('username', myData.UserName);
                  sessionStorage.setItem('password', myData.Password);
                  
                  location.href = "./Customer";

              },
              error: function (error) {

                  console.log(error);

              }
          });

      }

  </script>

</body>


</html>
