<%@page import="model.Job"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : RemoteJob
    Created on : Oct 12, 2021, 11:43:52 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .navbar .logo {
                height: 50px;
                margin: 0px;
            }
            .profile-img {
                border-radius: 50%;
                height: 2rem;
            }
            .banner-text{
                color: blue;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <%
            ArrayList<Job> jobList = (ArrayList<Job>) session.getAttribute("nearbyjob");
            int size = jobList.size();
        %>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <c:if test="<%=size < 2%>">
            <div class="container vh-100">
            </c:if>
            <c:if test="<%=size >= 2%>">
                <div class="container">
                </c:if>
                <section id="promote_banner">
                    <div class="container col-lg-8 offset-lg-2 my-3">
                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="https://static.topcv.vn/img/image%20(5).png" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="https://static.topcv.vn/img/bAKCu8a%20(2).png" class="d-block w-100" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="https://static.topcv.vn/img/21.09.08%20Banner%20SO-01.png" class="d-block w-100" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="container col-lg-10 offset-lg-1 py-2">
                        <div class="row bg-primary bg-opacity-75 rounded-3" style="background-color: #f39f86; background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%)">
                            <div class="my-2 d-flex justify-content-between text-light">
                                <span><i class="far fa-list font text-dark fw-bold"> NEARBY JOB</i> </span>
                            </div>
                        </div>
                        <div class="row ">
                        <c:forEach var="j" items="${nearbyjob}">
                            <div class="card mb-1 ">
                                    <div class="row g-0">
                                        <div class="col-md-3">
                                            <a href="job_detail?id=${j.getId()}">
                                                <img src="https://static.topcv.vn/company_logos/cong-ty-co-phan-chung-khoan-dai-nam-60d543347cdd8.jpg" class="img-fluid rounded-start" alt="...">
                                            </a>
                                        </div>
                                        <div class="col-md-9">
                                            <div class="card-body  text-truncate">
                                                <p class="card-title">
                                                    <a href="job_detail?id=${j.getId()}" class="fw-bold text-dark text-decoration-none h5"> ${j.getName()}</a>
                                                </p>
                                                <p class="card-text">${j.getCompany()}</p>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <small class="text-muted">${j.getSalary()}</small>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <small class="text-muted">${j.getLocation()}</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </c:forEach>
                          
                        </div>

                        <nav aria-label="Page navigation example">
                            <ul class="pagination pagination-sm">
                                <li class="page-item">
                                    <a class="page-link text-dark" href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
                                <li class="page-item"><a class="page-link text-dark" href="#">2</a></li>
                                <li class="page-item"><a class="page-link text-dark" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link text-dark" href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </section> 

            </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>