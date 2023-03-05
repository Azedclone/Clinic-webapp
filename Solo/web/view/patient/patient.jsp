<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentAccount" value="${sessionScope.currentAccount}"></c:set>
<c:set var="role" value="${currentAccount.role}"></c:set>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <!-- <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
            <title>Patient page</title>
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
                    <a href="#appointment">
                        <i class="fa-regular fa-calendar-check"></i>
                        <span class="link-name">Manage Appointment</span>
                    </a>
                    <span class="tool-tip">Manage Appointment</span>
                </li>
                <li>
                    <a href="#examination">
                        <i class="fa-solid fa-flask-vial"></i>
                        <span class="link-name">Manage Examination</span>
                    </a>
                    <span class="tool-tip">Manage Examination</span>
                </li>
                <li>
                    <a href="#prescription">
                        <i class="fa-solid fa-prescription"></i>
                        <span class="link-name">Manage Prescription</span>
                    </a>
                    <span class="tool-tip">Manage Prescription</span>
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
                        <img src="../../assets/img/avatars/${currentAccount.avatar}" alt="profile image" class="me-2">
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

        <!-- Start Appointment section -->
        <%@include file="manage-appointment.jsp" %>
        <!-- End Appointment section -->
        
        <!-- Start Appointment section -->
        <%@include file="manage-examination.jsp" %>
        <!-- End Appointment section -->

        <!-- Start Prescription section -->
        <%@include file="manage-prescription.jsp" %>
        <!-- End Prescription section -->

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
        <!-- JQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <!-- Sweet Alert 2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Patient JS -->
        <script src="../../assets/js/patient.js"></script>
        <script>
            $(document).ready(function(){
                loadData('appointments');
                loadData('doctors');
                loadData("examinations");
                loadData("prescription");
                fillForm();
                manageAppointment();
            })
        </script>
    </body>
</html>