<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentAccount" value="${sessionScope.currentAccount}"></c:set>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login page</title>
        <link rel="stylesheet" href="../../assets/css/mycss.css"/>
        <%@include file="../included/for-head.jsp" %>
    </head>
    <body>
        <%@include file="../included/navbar.jsp" %>

        <!-- Start Form login -->
        <div class="contaier-fluid" style="border-top: 1px solid #ccc;">
            <div class="container w-50 p-5 my-5 bg-light rounded-4" style="border: 1px solid #aaa;">
                <h1 class="text-uppercase text-center">Login</h1>
                <form id="login">
                    <div class="mb-3 px-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username..." required>
                    </div>
                    <div class="mb-3 px-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password..." required>
                    </div>
                    <div class="redirect d-flex justify-content-between mt-3">
                        <a href="register.jsp" class="text-primary text-decoration-none">
                            <p class="fw-light fw-semibold px-5 d-none d-sm-block">Don't have an account?</p>
                        </a>
                        <a href="forgot-pass.jsp" class="text-primary text-decoration-none">
                            <p class="fw-light fw-semibold px-5 d-none d-sm-block">Forgot password?</p>
                        </a>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary my-3 px-3">Login</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Form login -->

        <%@include file="../included/footer.jsp" %>
        <%@include file="../included/for-script.jsp" %>
    </body>
</html>