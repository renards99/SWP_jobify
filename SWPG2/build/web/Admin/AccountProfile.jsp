<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User info</title>
        
        <style>

            .emp-profile {
                padding: 3%;
                margin-top: 2%;
                margin-bottom: 2%;
                border-radius: 0.5rem;
                background: #fff;
            }
            .profile-edit-btn {
                border: none;
                border-radius: 1.5rem;
                width: 70%;
                padding: 2%;
                font-weight: 600;
                color: #6c757d;
                cursor: pointer;
                margin-top: 10px;
            }

            .profile-work ul {
                list-style: none;
            }

            .profile-tab label {
                font-weight: 600;
            }

            .profile-tab p {
                font-weight: 600;
                color: #0062cc;
            }
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

    <body style ="background-color:#a4bfeb;">

        <jsp:include page="Header.jsp"></jsp:include>

        ${message_password}
        <%
            session.removeAttribute("message_password");
        %>
        <div class="container emp-profile ">

            <div class="row">
                <div class="col-md-2 offset-md-1">
                    <img class="img-fluid img-thumbnail" src= ${profile.image}
                         alt="" />
                </div>

                <div class="col-md-5 offset-md-1">
                    <div class="profile-head">
                        <h5>
                            ${profile.username}
                        </h5>
                        <h6>

                            ${profile.major}
                        </h6>
                        <p class="proile-rating"><span></span></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-work">
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Full name</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profile.fullname}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profile.email}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Birth date</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profile.dob}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Gender</label>
                                </div>
                                <div class="col-md-6">
                                    <p>
                                        <c:choose>
                                            <c:when test="${profile.gender==1}">
                                            <td>Male</td>
                                        </c:when>    
                                        <c:otherwise>
                                            <td>Female</td>
                                        </c:otherwise>
                                    </c:choose>
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Address</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profile.address}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Current Location</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profile.location}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Phone</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profile.phone}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Job</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profile.major}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Role</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profile.role}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  
    </body>
    <!--footer -->

    <jsp:include page="Footer.jsp"></jsp:include>
    <!-------------->
</html>

