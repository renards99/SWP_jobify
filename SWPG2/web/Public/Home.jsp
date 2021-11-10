<%@page import="model.History"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Home
    Created on : Oct 12, 2021, 11:34:12 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <!------HEADER----------------------------------------------------------------------------------------------------------------------------------------------------------->
        <jsp:include page="Header.jsp"></jsp:include>
        ${post_job_message}
        <%
            session.removeAttribute("post_job_message");
        %>
        ${create_cv_message}
        <%
            session.removeAttribute("create_cv_message");
        %>
        ${add_wishlist_message}
        <%
            session.removeAttribute("add_wishlist_message");
        %>
        ${submit_cv_message}
        <%
            session.removeAttribute("submit_cv_message");
        %>
            <!------BODY----------------------------------------------------------------------------------------------------------------------------------------------------------->
        <c:if test="${acc.roleID == 3 || acc.roleID == 2}">
            <%--box search--%>
            <section id="box-search-job" class="banner">
                <div class="container col-lg-8 offset-lg-2 border-bottom border-dark">
                    <div class="row">
                        <div class="col-md-8 col align-self-center banner-text">
                            <h2>JOBIFY - The home of your dream job</h2>
                            <h4>Come for the job - stay for the challenge</h4>
                            <p style="color:black">
                                100+ job opportunities successfully connected via Jobify every day
                            </p>
                            <!--                        <a href="#" class="btn btn-primary rounded-pill" style="font-weight: bold;">TẠO CV ONLINE</a>
                                                    <a href="#" class="btn btn-success rounded-pill" style="font-weight: bold;">TẢI CV LÊN</a>-->
                        </div>

                        <div class="col-md-4 " style="padding-top: 10px;">
                            <img src="https://i.ibb.co/wpBXMLr/home-banner.webp" class="img-responsive" style="max-width: 80%">
                        </div>
                    </div>
                    <form action="search_job" method="post">
                        <p style="color: blue;">Instantly discover 100+ best jobs on Jobify</p>
                        <div class="row">
                            <div class="col-md-10 mb-3">
                                <div class="row">
                                    <div class="form-group col-md-4 col-xs-12">
                                        <span class="input-icon"><i class="icons8-zoom"></i></span>
                                        <input class="form-control" value="" placeholder="Job name, company name" name="search">
                                    </div>
                                    <div class="form-group col-md-2 ">
                                        <span class="input-icon-select2"><i class="icons8-map-pin"></i></span>
                                        <select class="form-control input-select2 select2-hidden-accessible" name="location" style="width: 100%" tabindex="-1" aria-hidden="true">
                                            <option value="all">Location</option>
                                            <c:forEach var="o" items="${location}">
                                                <option value="${o.getId()}">${o.getName()} </option>
                                            </c:forEach>   
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2 ">
                                        <span class="input-icon-select2"><i class="icons8-tool-symbol"></i></span>
                                        <select class="form-control input-select2 select2-hidden-accessible" name="specialized" style="width: 100%" tabindex="-1" aria-hidden="true">
                                            <option value="all">Major</option>
                                            <c:forEach var="o" items="${major}">
                                                <option value="${o.getId()}">${o.getName()} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2 ">
                                        <span class="input-icon-select2"><i class="icons8-tool-symbol"></i></span>
                                        <select class="form-control input-select2 select2-hidden-accessible" name="type" style="width: 100%" tabindex="-1" aria-hidden="true">
                                            <option value="all">Job type</option>
                                            <c:forEach var="o" items="${jobtype}">
                                                <option value="${o.getId()}">${o.getName()} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-2 ">
                                        <span class="input-icon-select2"><i class="icons8-tool-symbol"></i></span>
                                        <select class="form-control input-select2 select2-hidden-accessible" name="salary" style="width: 100%" tabindex="-1" aria-hidden="true">
                                            <option value="all">Salary</option>
                                            <c:forEach var="o" items="${salary}">
                                                <option value="${o.getId()}">${o.getName()} </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 form-group col-button">
                                <button class="btn btn-primary text-dark"  style="background-color: #f39f86;
                                        background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                        border-color: #f39f86;"><i class="fa fa-search"></i> Search</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <%--promote banner--%>
            <section id="promote_banner">
                <div class="container col-lg-8 offset-lg-2 my-3">
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <c:forEach var="j" items="${banner}">
                             <div class="carousel-inner">
                            <div class="carousel-item active">
                                <a href="job_detail?id=${j.jobid}"><img src="${j.image}" class="d-block w-100" alt="..."></a>
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
                        </c:forEach>
                       
                    </div>
                </div>
            </section>

            <%--Nearby job --%>

            <section>
                <div class="container col-lg-8 offset-lg-2 py-2">
                    <div class="row bg-primary bg-opacity-75 rounded-3"  style="background-color: #f39f86;
                         background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%);">
                        <div class="my-2 d-flex justify-content-between text-light">
                            <span><i class="fas fa-location-arrow font text-dark"> ALL JOB</i> </span>
                            <span><a href="#" class="link-dark"> <i class="fas fa-angle-double-right"> View more</i></a></span>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="j" items="${alljob}">
                            <div class="card col-lg-4 mb-1">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-12 py-4">
                                        <a href="job_detail?id=${j.getId()}">
                                            <img src="${j.getImage()}" class="img-fluid rounded-start " alt="...">
                                        </a>
                                    </div>
                                    <div class="col-xl-8 col-lg-12">
                                        <div class="card-body  text-truncate">
                                            <p class="card-title">
                                                <a href="job_detail?id=${j.getId()}" class="link-dark fw-bold text-decoration-none">${j.getName()}</a>
                                            </p>
                                            <p class="card-text">${j.getCompany()}</p>
                                            <div class="row d-flex justify-content-between">
                                                <div class="col-md-6">
                                                    <p class="text-muted">$${j.getSalary()}</p>
                                                </div>
                                                <div class="col-md-6">
                                                    <p class="text-muted">${j.getLocation()}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                     <jsp:include page="PagingNearbyJob.jsp"></jsp:include>

                </div>
            </section> 
            <%--promote banner--%>
            <section id="promote_banner">
                <div class="container col-lg-6 offset-lg-3 my-3">
                    <div>
                        <img src="https://static.topcv.vn/img/21.09.08%20Banner%20SO-01.png" class="d-block w-100" alt="...">
                    </div>
                </div>
            </section>
            <%--Suitable job--%>
            <section>
                <div class="container col-lg-8 offset-lg-2">
                    <div class="row py-2">
                        <div class=" col-lg-8">
                            <div class="row bg-primary bg-opacity-75 rounded-3"  style="background-color: #f39f86;
                                 background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%);">
                                <div class="my-2 d-flex justify-content-between text-light">
                                    <span><i class="fas fa-wifi text-dark"> JOB AT ${acc.location} </i> </span>
                                    <span><a href="nearby_job" class="link-dark"> <i class="fas fa-angle-double-right"> View more</i></a></span>
                                </div>
                            </div>
                            <div class="row">
                                <c:forEach var="j" items="${nearbyjob}">
                                    <div class="card col-lg-6 mb-1">
                                        <div class="row">
                                            <div class="col-xl-4 col-lg-12 py-4">
                                                <a href="job_detail?id=${j.getId()}">
                                                    <img src="${j.getImage()}" class="img-fluid rounded-start " alt="...">
                                                </a>
                                            </div>
                                            <div class="col-xl-8 col-lg-12">
                                                <div class="card-body  text-truncate">
                                                    <p class="card-title">
                                                        <a href="job_detail?id=${j.getId()}" class="link-dark">${j.getName()}</a>
                                                    </p>
                                                    <p class="card-text">${j.getCompany()}</p>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <small class="text-muted">$${j.getSalary()}</small>
                                                        </div>
                                                        <div class="col-md-3 ms-3">
                                                            <small class="text-muted">${j.getLocation()}</small>
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
                        <div class=" col-lg-4 ">
                            <div>
                                <img src="https://static.topcv.vn/img/z2766133453394_70eebe8ff115b6a024c0b705a4323f7d.jpg" class ="img-fluid w-100 h-100" alt="..." ">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--Remote job-->
    
        </c:if>
        
        <c:if test="${acc.roleID == 1}">
        <%
            ArrayList<History> list = (ArrayList<History>) session.getAttribute("transaction_history");
            int size = list.size();
        %>
            <c:if test="<%=size <= 15%>">
                <div class="container vh-100">
                </c:if>
                <c:if test="<%=size > 15%>">
                    <div class="container mb-5">
                    </c:if>
                    <div class="text-center mt-5 ">
                        <h1>Transaction history</h1>
                    </div>

                    <table class="table table-hover" style="width: 60%; margin: auto">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Username</th>
                                <th scope="col">Type</th>
                                <th scope="col">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty transaction_history}">
                                <tr>
                                    <th class="text-center" colspan="5">Empty</th>
                                </tr>

                            </c:if>
                            <c:forEach var="o" items="${transaction_history}">
                                <tr>
                                    <th scope="row">${o.id}</th>
                                    <td>${o.username}</td>
                                    <td>${o.getType()=="1"?"deposit":"spent"}</td>
                                    <td>${o.amount}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
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
    <!------FOOTER----------------------------------------------------------------------------------------------------------------------------------------------------------->
    <jsp:include page="Footer.jsp"></jsp:include>
</html>
