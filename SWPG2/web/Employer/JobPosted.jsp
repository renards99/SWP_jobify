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
            .job_img{
                width: 140px;
                height: 140px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job posted</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>    
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        <c:if test="${jobposted.size() < 3}">
            <div class="container vh-100">
            </c:if>
            <c:if test="${jobposted.size() >= 3}">
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
                                <span><i class="far fa-thumbs-up font text-dark fw-bold"> JOB POSTED</i> </span>
                            </div>
                        </div>
                        <div class="row ">
                            <c:forEach var="j" items="${jobposted}">
                                <div class="card mb-1 " style="height: 9rem;">
                                    <div class="row g-0">
                                        <div class="col-md-3">
                                            <a href="job_detail?id=${j.getId()}" >
                                                <img src="${j.getImage()}" class="rounded job_img" alt="...">
                                            </a>
                                        </div>
                                        <div class="col-md-5">
                                            <div class="card-body  text-truncate">
                                                <p class="card-title">
                                                    <a href="job_detail?id=${j.id}" class="fw-bold text-dark text-decoration-none h5"> ${j.name}</a>
                                                </p>
                                                <p class="card-text">${j.company}</p>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <small class="text-muted">Salary: $${j.salary}</small>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <small class="text-muted">Location: ${j.location}</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="row">
                                                <div class="col-md-6" style="text-align: center">
                                                    <a href="#">
                                                        <button class="btn btn-success btn-send pt-2 btn-block mt-5" 
                                                                style="background-color: #0062cc; color: black; background-color: #f39f86;
                                                                background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                                                border-color: #f39f86; font-weight: bold; border-radius: 3px;" >
                                                            Upgrade
                                                        </button>
                                                    </a>
                                                </div>
                                                <div class="col-md-6" style="text-align: center">
                                                    <a href="delete_job?id=${j.id}">
                                                        <button class="btn btn-success btn-send pt-2 btn-block mt-5"  onclick="checkDelete(); return false;"
                                                                style="background-color: #0062cc; color: black; background-color: #f39f86;
                                                                background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                                                border-color: #f39f86; font-weight: bold; border-radius: 3px;" >
                                                            Delete
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                        <jsp:include page="Paging.jsp"></jsp:include>
                        </div>
                    </section> 

                </div>
                <script>
                    $(document).ready(function () {
                        $('[data-toggle="tooltip"]').tooltip();
                    });
                    function checkDelete() {
                        if (confirm('Are you sure you want to delete?'))
                        {
                            your_form_variable.submit();
                        }
                    }
                </script>
            <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>