<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : JobProfile
    Created on : Oct 12, 2021, 12:01:34 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>View CV</title>
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
        <style>
            body {
                font-family: 'Lato', sans-serif;
            }

            h1 {
                color: black;
            }

            label {
                color: #333
            }

            .btn-send {
                font-weight: 300;
                text-transform: uppercase;
                letter-spacing: 0.2em;
                width: 80%;
                margin-left: 3px
            }

            .help-block.with-errors {
                color: #ff5050;
                margin-top: 5px
            }

            .card {
                margin-left: 10px;
                margin-right: 10px
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

    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container" style="margin-bottom: 3%">
                <div class="text-center mt-5 ">
                ${edit_cv_message}
                <%
                    session.removeAttribute("edit_cv_message");
                %>
                <h1>View CV</h1>
            </div>
            <div class="row mb-5">
                <div class="col-lg-7 mx-auto">
                    <div class="card mt-2 mx-auto p-4 bg-light">
                        <div class="card-body bg-light">
                            <div class="container">
                                <div class="controls">
                                    <div class="row">
                                        <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                            <p>General Information</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4" style=";">
                                            <img class="rounded-circle img-fluid" src=${acc.image}>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group"><label>Fullname:</label></div>
                                            <div class="form-group" style="border-bottom: 1px solid;" ><b>${viewCV.getFullname()}</b></div>
                                            <div class="form-group"><label>Birthdate:</label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${viewCV.getDob()}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group"><label>Gender: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid">
                                                <c:choose>
                                                    <c:when test="${viewCV.gender==1}">
                                                        <b>Male</b>
                                                    </c:when>    
                                                    <c:otherwise>
                                                        <b>Female</b>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group"><label>Location: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${viewCV.getLocation()}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group"><label>Phone: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${viewCV.getPhone()}</b></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group"><label>Contact: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${viewCV.getContact()}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group"><label>Education: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${viewCV.getEducation()}</b></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group"><label>School: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${viewCV.getSchool()}</b></div>
                                        </div>
                                        <div class="row">
                                            <div>
                                                <div class="form-group"><label>Experience: </label></div>
                                                <div class="form-group" style="border-bottom: 1px solid"><b>${viewCV.getExperience()}</b></div>
                                            </div>
                                        </div>
                                    </div>
                                    <c:choose>
                                        <c:when test="${acc.getRoleID()==3}">
                                            <div class="row" style="margin-top: 2%">
                                                <div class="col-md-6" style="text-align: center">
                                                    <a href="edit_cv">
                                                        <button  class="btn btn-success btn-send pt-2 btn-block" 
                                                                 style="background-color: #0062cc; color: black; 
                                                                 background-color: #f39f86;background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                                                 border-color: #f39f86; font-weight: bold; border-radius: 3px;" >
                                                            Edit CV
                                                        </button>
                                                    </a>
                                                </div>
                                                <div class="col-md-6" style="text-align: center">
                                                    <a href="home">
                                                        <button  class="btn btn-success btn-send pt-2 btn-block" 
                                                                 style="background-color: #0062cc; color: black; 
                                                                 background-color: #f39f86;background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                                                 border-color: #f39f86; font-weight: bold; border-radius: 3px;" >
                                                            Cancel
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${acc.getRoleID()==2}">
                                            <div class="row" style="margin-top: 2%">
                                                <div class="col-md-6" style="text-align: center">
                                                    <a href="approve_cv?status=2">
                                                        <button  class="btn btn-success btn-send pt-2 btn-block" 
                                                                 style="background-color: #0062cc; color: black; 
                                                                 background-color: #f39f86;background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                                                 border-color: #f39f86; font-weight: bold; border-radius: 3px;" >
                                                            Accept CV
                                                        </button>
                                                    </a>
                                                </div>
                                                <div class="col-md-6" style="text-align: center">
                                                    <a href="approve_cv?status=3">
                                                        <button  class="btn btn-success btn-send pt-2 btn-block" 
                                                                 style="background-color: #0062cc; color: black; 
                                                                 background-color: #f39f86;background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                                                 border-color: #f39f86; font-weight: bold; border-radius: 3px;" >
                                                            Decline CV
                                                        </button>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
            <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
