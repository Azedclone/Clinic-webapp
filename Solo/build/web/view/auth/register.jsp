<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentAccount" value="${sessionScope.currentAccount}"></c:set>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register page</title>
        <link rel="stylesheet" href="../../assets/css/mycss.css"/>
        <%@include file="../included/for-head.jsp" %>
    </head>
    <body>
        <%@include file="../included/navbar.jsp" %>

        <!-- Start Form login -->
        <div class="contaier-fluid" style="border-top: 1px solid #ccc;">
            <div class="container w-50 p-5 my-5 bg-light rounded-4" style="border: 1px solid #aaa;">
                <h1 class="text-uppercase text-center">Register</h1>
                <form id="register">
                    <div class="mb-3 px-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" aria-describedby="usernameDes" name="username" placeholder="Username..." required>
                        <div id="usernameDes" class="form-text text-danger">
                        </div>
                    </div>
                    <div class="mb-3 px-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" aria-describedby="passwordDes" name="password" placeholder="Password..." required>
                        <div id="passwordDes" class="form-text text-danger">
                        </div>
                    </div>
                    <div class="mb-3 px-3">
                        <label for="password" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="passwordConfirm" aria-describedby="passwordConfirmDes" name="passwordConfirm" placeholder="Re-enter password..." required>
                        <div id="passwordConfirmDes" class="form-text text-danger">
                        </div>
                    </div>
                    <div class="redirect d-flex justify-content-between mt-3">
                        <a href="login.jsp" class="text-primary text-decoration-none">
                            <p class="fw-light fw-semibold px-5 d-none d-sm-block">Already have an account?</p>
                        </a>
                        <a href="forgot-pass.jsp" class="text-primary text-decoration-none">
                            <p class="fw-light fw-semibold px-5 d-none d-sm-block">Forgot password?</p>
                        </a>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary my-3 px-3">Register</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Form login -->

        <%@include file="../included/footer.jsp" %>
        <%@include file="../included/for-script.jsp" %>

        <script>
            $(document).ready(function () {
                var pass;
                $('#username').blur(function () {
                    var value = $(this).val();
                    if (/^(?=[a-zA-Z]+)\w{2,20}$/.test(value)) {
                        $('#usernameDes').html("");
                    }
                    else {
                         $('#usernameDes').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Username must have 2-20 characters<br>Only accept alphanumeric and underscore (must start by at least 1 letter)');
                    }
                });
                $('#password').blur(function () {
                    var value = $(this).val();
                    // Validate input
                    if (/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,50}$/.test(value)) {
                        $('#passwordDes').html("");
                    }
                    else {
                        $('#passwordDes').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Password must have 8-50 characters and contains at least 1 letter and 1 number');
                    }

                    pass = $(this).val();
                });
                $('#passwordConfirm').blur(function () {
                    var value = $(this).val();
                    if (value === pass) {
                        $('#passwordConfirmDes').html("");
                    } else {
                        $('#passwordConfirmDes').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Password does not match!');
                    }
                });
        
            })
        </script>
    </body>
</html>