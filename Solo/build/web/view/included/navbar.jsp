<!-- Start navbar -->
<nav class="navbar navbar-expand-lg mb-3">
    <div class="container-fluid">
        <div class="container d-flex">
            <a href="../common/home.jsp" class="navbar-brand text-uppercase text-dark text-decoration-none fs-1">
                <span class="text-primary"><i class="fa-solid fa-house-medical"></i>G4</span>-clinic
            </a>
            <div class="collapse navbar-collapse justify-content-end" id="nav-links">
                <div class="navbar-nav">
                    <a class="nav-link" aria-current="page" href="../common/home.jsp">Home</a>
                    <a class="nav-link" href="#">Pricing</a>
                    <a class="nav-link" href="#blogs">Blogs</a>
                    <c:if test="${currentAccount == null}">
                        <a href="../auth/login.jsp" class="btn btn-primary rounded-4 mx-1">Login <i class="fa-solid fa-right-to-bracket"></i></a>
                        <a href="../auth/register.jsp" class="btn btn-primary rounded-4 mx-1">Register <i class="fa-solid fa-user-plus"></i></a>
                    </c:if>
                    <c:if test="${currentAccount != null}">
                        <a href="../../logout" class="btn btn-primary rounded-4 mx-1" id="logout">Logout <i class="fa-solid fa-right-from-bracket"></i></a>
                        <a href="../../dashboard" class="btn btn-primary rounded-4 mx-1" id="dashboard">Dashboard <i class="fa-solid fa-user"></i></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- End navbar -->