<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Home
    Created on : Oct 12, 2021, 11:34:12 AM
    Author     : PC
--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cv = (String) session.getAttribute("cv");
%>
<header>
    <c:if test="${acc.roleID == 3}">
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #f39f86;
             background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%);">
            <div class="container col-lg-10 offset-lg-1">
                <a href="home"><img class="logo" src="https://i.ibb.co/SPrbGXk/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse f-flex justify-content-end" id="navbarSupportedContent">  
                    <ul class="navbar-nav ml-auto ">
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link" href="home">Find job</a>
                        </li>
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link" href="remote_job">Remote job</a>
                        </li>
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link" href="fulltime_job">Full-time job</a>
                        </li>
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link" href="parttime_job">Part-time job</a>
                        </li>
                        <li class="nav-item dropdown ms-3">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img width="35px" height="35px" style="border-radius: 100%"  src="${acc.image}">
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="view_profile">View profile</a></li>
                                <li><a class="dropdown-item" href="notification">Notification</a></li>
                                    <c:if test="<%=cv.equals("false")%>">
                                    <li><a class="dropdown-item" href="create_cv">Create CV</a></li>
                                    </c:if>
                                    <c:if test="<%=cv.equals("true")%>">
                                    <li><a class="dropdown-item" href="cv_user">View CV</a></li>
                                     <li><a class="dropdown-item" href="create_cv">Create CV</a></li>
                                    </c:if>
                                <li><a class="dropdown-item" href="list_wishlist">Wishlist</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="log_out">Log out</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </c:if>
    <c:if test="${acc.roleID == 2}">
        <nav class="navbar navbar-expand-lg navbar-light bg-light " style="background-color: #f39f86;
             background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%);">
            <div class="container col-lg-10 offset-lg-1">
                <a href="home"><img class="logo" src="https://i.ibb.co/SPrbGXk/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse f-flex justify-content-end" id="navbarSupportedContent">  
                    <ul class="navbar-nav ml-auto ">
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link active" href="home">Find job</a>
                        </li>
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link" href="post_job">Post job</a>
                        </li>
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link" href="job_posted">Job posted</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img width="35px" height="35px" style="border-radius: 100%" src="${acc.image}">
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="view_wallet">Wallet</a></li>
                                <li><a class="dropdown-item" href="view_profile">View profile</a></li>
                                <li><a class="dropdown-item" href="notification">Notification</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="log_out">Log out</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
    </c:if>
    <c:if test="${acc.roleID == 1}">
        <nav class="navbar navbar-expand-lg navbar-light bg-light " style="background-color: #f39f86;
             background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%);">
            <div class="container col-lg-10 offset-lg-1">
                <a href="home"><img class="logo" src="https://i.ibb.co/SPrbGXk/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse f-flex justify-content-end" id="navbarSupportedContent">  
                    <ul class="navbar-nav ml-auto ">
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link active" href="home">Finance management</a>
                        </li>
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link" href="account_management">Account management</a>
                        </li>
                        <li class="nav-item px-2 border-end border-dark ">
                            <a class="nav-link" href="list_banner">Banner management</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img  width="35px" height="35px" style="border-radius: 100%"  src="${acc.image}">
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="view_profile">View profile</a></li>
                                <li><a class="dropdown-item" href="notification">Notification</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="log_out">Log out</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
    </c:if>
</header>