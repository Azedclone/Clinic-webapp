<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentAccount" value="${sessionScope.currentAccount}"></c:set>
<c:set var="role" value="${currentAccount.role}"></c:set>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <!-- <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
            <title>Admin page</title>
        <%@include file="../included/for-head.jsp" %>
        <link rel="stylesheet" href="../../assets/css/role.css">
    </head>
    <body>
        <!-- Start Sidebar -->
        <section id="sidebar">
            <div class="logo-details">
                <div class="icon">
                    <i class="fa-solid fa-house-medical"></i>
                </div>
                <div class="logo-name bg-white rounded-2 px-2">
                    <a href="../common/home.jsp" class="text-primary m-0 text-decoration-none">G4<span class="text-dark">-CLINIC</span></a>
                </div>
                <i class="fa-solid fa-bars btn-menu"></i>
            </div>

            <ul class="nav-lists">
                <li>
                    <a href="#dashboard">
                        <i class="fa-solid fa-grip"></i>
                        <span class="link-name">Dashboard</span>
                    </a>
                    <span class="tool-tip">Dashboard</span>
                </li>
                <li>
                    <a href="#doctor">
                        <i class="fa-solid fa-stethoscope"></i>
                        <span class="link-name">Manage Doctors</span>
                    </a>
                    <span class="tool-tip">Manage Doctors</span>
                </li>
                <li>
                    <a href="#patient">
                        <i class="fa-solid fa-hospital-user"></i>
                        <span class="link-name">Manage Patients</span>
                    </a>
                    <span class="tool-tip">Manage Patients</span>
                </li>
                <li>
                    <a href="#blog">
                        <i class="fa-solid fa-newspaper"></i>
                        <span class="link-name">Manage Blogs</span>
                    </a>
                    <span class="tool-tip">Manage Blogs</span>
                </li>
                <li>
                    <a href="#profile">
                        <i class="fa-solid fa-gear"></i>
                        <span class="link-name">Profile</span>
                    </a>
                    <span class="tool-tip">Profile</span>
                </li>
                <li class="profile">
                    <div class="profile-details">
                        <img src="#" alt="profile image" class="me-2">
                        <div class="profile-content">
                            <div class="name">
                                ${currentAccount.name}
                            </div>
                            <div class="designation">
                                <c:choose>
                                    <c:when test="${role == 0}">
                                        Admin
                                    </c:when>
                                    <c:when test="${role == 1}">
                                        Doctor
                                    </c:when>
                                    <c:when test="${role == 2}">
                                        Patient
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    
                        <i class="fa-solid fa-right-from-bracket btn-logout" onclick="logout(event)"></i>
                </li>
            </ul>

        </section>
        <!-- End Sidebar -->

        <!-- Start Dashboard Section -->
        <%@include file="dashboard.jsp" %>
        <!-- End Dashboard Section -->

        <!-- Start Manage doctor Section -->
        <%@include file="manage-doctor.jsp" %>
        <!-- End Manage doctor Section -->

        <!-- Start Manage patient Section -->
        <%@include file="manage-patient.jsp" %>
        <!-- End Manage patient Section -->

        <!-- Start Manage blog Section -->
        <%@include file="mange-blog.jsp" %>
        <!-- End Manage blog Section -->


        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <!-- JQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Sweet Alert 2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Admin JS -->
        <script src="../../assets/js/admin.js"></script>
        <script>
            $(document).ready(function(){
                loadData("accounts");
                loadData("doctors");
                loadData("patients");
                loadData("blogs");
                loadData("categories");
                manageDoctor();
                managePatient();
                manageBlog();
            })
        </script>
    </body>
</html>