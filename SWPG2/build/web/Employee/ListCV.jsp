<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : ListCV
    Created on : Nov 6, 2021, 1:50:10 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List CV</title>
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
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
        ${approve_cv_message}
        <%
            session.removeAttribute("approve_cv_message");
        %>
            <div class="container vh-100">
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
                                <span><i class="far fa-list font text-dark fw-bold"> List CV</i> </span>
                            </div>
                        </div>
                        <div class="row ">
                            <c:forEach var="j" items="${listcvuser}">
                                  <div class="card mb-1 ">
                                <div class="row g-0">
                                    <div class="col-md-3">
                                        <a href="view_cv?id=${j.getId()}">
                                            <img style="height: 150px; width: 200px"src="${j.image}" class="img-fluid rounded-start" alt="...">
                                        </a>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="card-body  text-truncate">
                                            <p class="card-title">
                                                <a href="view_cv?id=${j.getId()}" class="fw-bold text-dark text-decoration-none h5"> ${j.getFullname()}</a>
                                            </p>
                                            <p class="card-text">School: ${j.getSchool()}</p>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <small class="text-muted">${j.getPhone()}</small>
                                                </div>
                                                <div class="col-md-6">
                                                    <small class="text-muted">Status: ${j.getTime()}</small>
                                                </div>
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

            <script type="text/javascript">
                var alertList = document.querySelectorAll('.alert')
                alertList.forEach(function (alert) {
                    new bootstrap.Alert(alert)
                })

                // Get the alert element
                // var alertQs = document.querySelector('.alert')  // This line would target all alerts on the page
                var alertQs = document.querySelector('#alertID') // This line only targets the element with ID #alertID
                // Create a Bootstrap alert instance
                var bsAlert = bootstrap.Alert.getInstance(alertQs)
                // Dismiss alert after specified amount of time in milliseconds
                window.setTimeout(() => {
                    bsAlert.close();
                }, 4000);
            </script>
    </body>
    
        <jsp:include page="Footer.jsp"></jsp:include>
</html>
        