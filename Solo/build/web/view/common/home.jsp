<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentAccount" value="${sessionScope.currentAccount}"></c:set>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Home page</title>
            <%@include file="../included/for-head.jsp" %>
            <!-- My CSS -->
            <link rel="stylesheet" href="../../assets/css/mycss.css">

        </head>
        <body>
            <!-- Start hero -->
            <section id="hero" style="margin:0; margin-bottom: 80px!important;">
                <%@include file="../included/navbar.jsp" %>
            <div class="container-fluid" style="background: linear-gradient(to left, #fff, #E9F4FF);">
                <div class="container d-flex flex-column">
                    <div class="row">
                        <div class="text-hero col-7">
                            <p style="font-size: 64px; font-weight: 600; margin-top: 16%;">Providing the best conlie <span class="text-primary">medical</span> Consulation.</p>
                            <p style="width: 30rem;">We Provide the best consultation you with the best doctor in his finld.</p>
                        </div>
                        <div class="image-hero col-5">
                            <div class="square"></div>
                            <img src="../../assets/img/bg-doctor.png" alt="" style="max-width: 100%; height: 450px;">
                        </div>
                    </div>
                    <div class="general">
                        <div class="general-text text-white d-flex justify-content-between align-items-center">
                            <p class="fs-4" style="font-weight: 600;">Book Appointment Now</p>
                            <p style="vertical-align: middle;">Location</p>
                            <p style="vertical-align: middle;">We are now discount for the first visit</p>
                        </div>
                        <div class="general-sub d-flex justify-content-between align-items-center">
                            <a href="" class="btn btn-light p-3 rounded-4">Schedule now! <i class="fa-regular fa-calendar"></i></a>
                            <div class="p-3 bg-light rounded-4" style="border: 1px solid #fff">
                                <p class="m-auto">
                                    <i class="fa-solid fa-map-location-dot"></i>
                                    FBTU - Hoa Lac 
                                </p>
                            </div>
                            <div class="p-3 bg-light rounded-4" style="border: 1px solid #fff">
                                <p class="m-auto">Discount upto 20%</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End hero -->

        <!-- Start how it work -->
        <section id="how-it-work">
            <div class="container-fluid">
                <div class="container">
                    <div class="title text-center mb-3">
                        <p class="title d-inline-block" style="max-width: 35rem; font-size: 42px; font-weight: 600;">
                            Quick <span class="text-primary">Solution</span> For Seceduling With Doctor
                        </p>
                    </div>
                    <div class="how-card d-flex justify-content-between">
                        <div class="card" style="width: 20rem;">
                            <div class="card-body p-4">
                                <img src="../../assets/img/background/card_top_1.png" alt="" style="width: 88px;height: 88px;">
                                <h5 class="card-title my-3" style="font-weight: 600;">Find Doctor</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link text-decoration-none fw-semibold">Learn more</a>
                            </div>
                        </div>
                        <div class="card" style="width: 20rem;">
                            <div class="card-body p-4">
                                <img src="../../assets/img/background/card_top_2.png" alt="" style="width: 88px;height: 88px;">
                                <h5 class="card-title my-3" style="font-weight: 600;">Find Doctor</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link text-decoration-none fw-semibold">Learn more</a>
                            </div>
                        </div>
                        <div class="card" style="width: 20rem;">
                            <div class="card-body p-4">
                                <img src="../../assets/img/background/card_top_3.png" alt="" style="width: 88px;height: 88px;">
                                <h5 class="card-title my-3" style="font-weight: 600;">Find Doctor</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link text-decoration-none fw-semibold">Learn more</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End how it work -->

        <!-- Start about us -->
        <section id="about">
            <div class="container-fluid">
                <div class="container d-flex justify-content-between">
                    <div class="about-img">
                        <div class="about-img-shape"></div>
                        <img src="../../assets/img/background/nurse_2.png" alt="" style="height: 400px;">
                        <div class="about-img-box p-3">
                            <i class="fa-solid fa-square-check d-inline-block mx-3 fs-1" style="color: #2a8bec;"></i>
                            <p class="float-end m-0 fw-semibold">Regular Checkup</p>
                        </div>
                    </div>
                    <div class="about-text text-end">
                        <div class="about-text-title">
                            <p class="fs-1 fw-semibold">
                                We Are Always Ensure Best Medical <span class="text-primary">Treatment</span> for Your Health.
                            </p>
                        </div>
                        <div class="about-text-sub">
                            <p>The are many Variation of Passagers Integer dapibus vestibulum ligula quis condimentum. Cras in ligula diam. Praesent blandit molestie turpis.</p>
                        </div>
                        <a href="#" class="btn btn-primary rounded-4 p-3 fw-semibold">See Our Doctors</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- End about us -->

        <!-- Start doctors -->
        <section id="doctors">
            <div class="container-fluid">
                <div class="container text-center">
                    <div class="title mb-5">
                        <p class="m-auto fw-semibold" style="max-width: 35rem; font-size: 42px;">
                            Meet Our <span class="text-primary">Experience</span> Specialist.
                        </p>
                        <p class="sub m-auto fw-light" style="max-width: 35rem; font-size: 14px;">
                            Integer massa augue, malesuada id hendrerit ac, eleifend id urna. Nam vulputate, sem eu interdum cursus, sapien massa tempus magna, nec commodo justo justo id lacus. el quam.
                        </p>
                    </div>
                    <div class="card-container d-flex justify-content-between">
                        <div class="card text-center rounded-3" style="width: 20rem; border-color: #2a8bec;">
                            <img src="../../assets/img/doctors/doctor_1.jpg" class="card-img-top rounded-top-3 p-4" alt="...">
                            <div class="card-body">
                                <p class="card-title fw-semibold fs-3">Dr. Shao Khahn</p>
                                <p class="card-subtitle text-secondary">Anesthesiology</p>
                            </div>
                        </div>
                        <div class="card text-center rounded-3" style="width: 20rem; border-color: #2a8bec;">
                            <img src="../../assets/img/doctors/doctor_2.jpg" class="card-img-top rounded-top-3 p-4" alt="...">
                            <div class="card-body">
                                <p class="card-title fw-semibold fs-3">Dr. Mikhail Varshavski</p>
                                <p class="card-subtitle text-secondary">Family practice</p>
                            </div>
                        </div>
                        <div class="card text-center rounded-3" style="width: 20rem; border-color: #2a8bec;">
                            <img src="../../assets/img/doctors/doctor_3.jpg" class="card-img-top rounded-top-3 p-4" alt="...">
                            <div class="card-body">
                                <p class="card-title fw-semibold fs-3">Dr. Johny Sin</p>
                                <p class="card-subtitle text-secondary">Psychology</p>
                            </div>
                        </div>
                    </div>
                    <a href="#" class="btn btn-primary rounded-4 p-3 m-5">Book ones now! <i class="fa-solid fa-square-plus"></i></a>
                </div>
            </div>
        </section>
        <!-- End doctors -->

        <!-- Start Futuers -->
        <section id="futuers">
            <div class="container-fluid">
                <div class="container d-flex justify-content-between">
                    <div class="futu-text">
                        <div class="futu-text-title">
                            <p class="fs-1 fw-semibold">
                                Make An <span class="text-primary">Appointment</span> with A Doctor To Find A Solution To Your Problem.
                            </p>
                        </div>
                        <div class="futu-text-sub">
                            <p>Now You Can make An Appoointment with Your Doctor Anywhere, quis condimentum. Cras in ligula diam. Praesent blandit molestie turpis.</p>
                        </div>
                        <a href="#" class="btn btn-primary rounded-4 p-3 fw-semibold">Make an appointment</a>
                    </div>
                    <div class="futu-img">
                        <div class="futu-img-shape"></div>
                        <img src="../../assets/img/background/nurse_1.png" alt="" style="height: 400px;">
                        <div class="futu-img-box p-3">
                            <i class="fa-solid fa-square-plus d-inline-block mx-3 fs-1" style="color: #2a8bec;"></i>
                            <p class="float-end m-0 fw-semibold"><strong class="w-100">Injection Vaccine</strong><br>By Dr. </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Futuers -->

        <!-- Start Lastest -->
        <section id="blog">
            <div class="container-fluid">
                <div class="container">
                    <div class="title text-center">
                        <p class="fs-1 fw-semibold">Our <span class="text-primary">Lastest </span>Article</p>
                    </div>
                    <div class="card-container d-flex justify-content-between">
                        <div class="card rounded-3" style="width: 20rem; border-color: #2a8bec;">
                            <img src="../../assets/img/blogs/blog_1.jpg" class="card-img-top rounded-top-3 p-4" alt="...">
                            <div class="card-body">
                                <p class="card-title fw-semibold" style="font-size: 16px;">
                                    3 Causes Of Gastric ulcers Appetite And How To Overcom.
                                </p>
                                <p class="card-subtitle text-secondary" style="font-size: 13px;">
                                    Donec condimentum, lacus vitae pellentesque feugiat,Proin magna.
                                </p>
                            </div>
                            <div class="card-footer d-flex">
                                <img src="../../assets/img/doctors/doctor_1.jpg" alt="" class="my-auto">
                                <p class="author fw-semibold ps-3 m-0">
                                    Shao Khahn<br>
                                    <span style="font-size: 12px;">30m read   26 Feb 2023</span>
                                </p>
                            </div>
                        </div>
                        <div class="card rounded-3" style="width: 20rem; border-color: #2a8bec;">
                            <img src="../../assets/img/blogs/blog_2.jpg" class="card-img-top rounded-top-3 p-4" alt="...">
                            <div class="card-body">
                                <p class="card-title fw-semibold" style="font-size: 16px;">
                                    3 Causes Of Gastric ulcers Appetite And How To Overcom.
                                </p>
                                <p class="card-subtitle text-secondary" style="font-size: 13px;">
                                    Donec condimentum, lacus vitae pellentesque feugiat,Proin magna.
                                </p>
                            </div>
                            <div class="card-footer d-flex">
                                <img src="../../assets/img/doctors/doctor_2.jpg" alt="" class="my-auto">
                                <p class="author fw-semibold ps-3 m-0">
                                    Mikhail Varshavski<br>
                                    <span style="font-size: 12px;">30m read   26 Feb 2023</span>
                                </p>
                            </div>
                        </div>
                        <div class="card rounded-3" style="width: 20rem; border-color: #2a8bec;">
                            <img src="../../assets/img/blogs/blog_3.jpg" class="card-img-top rounded-top-3 p-4" alt="...">
                            <div class="card-body">
                                <p class="card-title fw-semibold" style="font-size: 16px;">
                                    3 Causes Of Gastric ulcers Appetite And How To Overcom.
                                </p>
                                <p class="card-subtitle text-secondary" style="font-size: 13px;">
                                    Donec condimentum, lacus vitae pellentesque feugiat,Proin magna.
                                </p>
                            </div>
                            <div class="card-footer d-flex">
                                <img src="../../assets/img/doctors/doctor_3.jpg" alt="" class="my-auto">
                                <p class="author fw-semibold ps-3 m-0">
                                    Johny Sin<br>
                                    <span style="font-size: 12px;">30m read 26 Feb 2023</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <a href="#" class="btn btn-primary rounded-4 p-3 m-5">Read more</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Lastest -->

        <%@include file="../included/footer.jsp" %>
        <%@include file="../included/for-script.jsp" %>
    </body>
</html>
