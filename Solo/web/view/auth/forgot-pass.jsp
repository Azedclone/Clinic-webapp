<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentAccount" value="${sessionScope.currentAccount}"></c:set>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot password page</title>
        <link rel="stylesheet" href="../../assets/css/mycss.css"/>
        <%@include file="../included/for-head.jsp" %>
    </head>
    <body>
        <%@include file="../included/navbar.jsp" %>

        <!-- Start Form forgot pass -->
        <div class="contaier-fluid" style="border-top: 1px solid #ccc;">
            <div class="container w-50 p-5 my-5 bg-light rounded-4" style="border: 1px solid #aaa;">
                <h1 class="text-uppercase text-center">Forgot password</h1>
                <form id="forgot">
                    <div class="mb-3 px-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" aria-describedby="usernameDes" name="username" placeholder="Your username...">
                        <div id="usernameDes" class="form-text">Enter your username you want to recover password</div>
                    </div>
                    <div class="mb-3 px-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="text" class="form-control" id="email" aria-describedby="emailDes" name="email" placeholder="example@abc.mail">
                        <div id="emailDes" class="form-text">
                            Enter your email linked to account to receive new password
                        </div>
                    </div>
                    <div class="redirect d-flex justify-content-between mt-3">
                        <a href="register.jsp" class="text-primary text-decoration-none">
                            <p class="fw-light fw-semibold px-5 d-none d-sm-block">Don't have an account?</p>
                        </a>
                        <a href="login.jsp" class="text-primary text-decoration-none">
                            <p class="fw-light fw-semibold px-5 d-none d-sm-block">Already have an account?</p>
                        </a>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary my-3 px-3">Submit</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Form forgot pass -->

        <%@include file="../included/footer.jsp" %>
        <%@include file="../included/for-script.jsp" %>
        <script>
            $(document).ready(function () {
                $('#email').blur(function () {
                    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($(this).val())) {
                        $('#emailDes').removeClass('text-danger');
                        $('#emailDes').html('Enter your email linked to account to receive new password');
                    } else {
                        $('#emailDes').addClass('text-danger');
                        $('#emailDes').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Email is not valid');
                    }
                })
            })
        </script>
    </body>
</html>