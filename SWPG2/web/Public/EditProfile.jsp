<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change user info</title>

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
                    <img class="img-fluid img-thumbnail"  src= ${sessionScope.acc.image}
                         alt="" />
                </div>

                <div class="col-md-5 offset-md-1">
                    <div class="profile-head">
                        <h5>
                            ${sessionScope.acc.username}
                        </h5>
                        <h6>

                            ${sessionScope.acc.major}
                        </h6>
                        <p class="proile-rating"><span></span></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-7 offset-md-4">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <form action="edit_profile" method="post" enctype="multipart/form-data">
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Full name</label>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control border-top-0 border-start-0 border-end-0" name="fullname" type="text"value="${sessionScope.acc.fullname}" required>                                  
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control border-top-0 border-start-0 border-end-0" name="email" type="email"value="${sessionScope.acc.email}" disabled>                                  
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Birth date</label>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control border-top-0 border-start-0 border-end-0" name="dob" type="date"value="${sessionScope.acc.dob}" required>                                  
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Gender</label>
                                </div>
                                <div class="col-md-6">
                                    <select class="form-select" name="gender" required>
                                        <option value="0" ${sessionScope.acc.gender==0?"selected":""}>Female</option>
                                        <option value="1" ${sessionScope.acc.gender==1?"selected":""}>Male</option>
                                    </select>                                 
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Address</label>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control border-top-0 border-start-0 border-end-0" name="address" type="text"value="${sessionScope.acc.address}" required>                                  
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt">
                                    <label>Location</label>
                                </div>
                                <div class="col-md-6">
                                    <select class="form-select" name="location" required>
                                        <option value="0">Location</option>
                                        <c:forEach var="o" items="${location}">
                                            <option value="${o.getId()}" ${acc.locationID==o.getId()?"selected":""} >${o.getName()} </option>
                                        </c:forEach>
                                    </select>                                 
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Phone</label>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control border-top-0 border-start-0 border-end-0" name="phone" type="text"value="${sessionScope.acc.phone}" required>                                  
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Major</label>
                                </div>
                                <div class="col-md-6">
                                    <select class="form-select" name="major" required>
                                        <option value="0">Major</option>
                                        <c:forEach var="o" items="${major}">
                                            <option value="${o.getId()}" ${acc.majorID==o.getId()?"selected":""} >${o.getName()} </option>
                                        </c:forEach>
                                    </select>                                 
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Role</label>
                                </div>
                                <div class="col-md-6">
                                    <select class="form-select" name="role" disabled>
                                        <option value="1" ${sessionScope.acc.roleID==1?"selected":""}>Administrator</option>
                                        <option value="2" ${sessionScope.acc.roleID==2?"selected":""}>Employer</option>
                                        <option value="3" ${sessionScope.acc.roleID==3?"selected":""}>Employee</option>
                                    </select>                                   
                                </div>
                            </div>
                            <div class="row my-2">
                                <div class="col-md-2 pt-2">
                                    <label>Avatar</label>
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control border-top-0 border-start-0 border-end-0" name="file" type="file">                                  
                                </div>
                            </div>
                            <input type="hidden" name="image" id="hiddenFieldId" value="${sessionScope.acc.image}" /> 
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <button class="btn btn-primary" type="submit">Save change</button>                                  
                                </div>
                            </div>
                        </form>
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

