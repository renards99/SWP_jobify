<%@page import="model.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : createcv
    Created on : Sep 16, 2021, 8:44:18 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Create CV</title>
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
                margin-bottom: 40px;
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
        <%
            User acc = (User) session.getAttribute("acc");
        %>
    </head>

    <body>
        <script>
            function display() {
                if (document.getElementById("education").value === '0') {
                    document.getElementById("highschool").style.display = 'none';
                    document.getElementById("highschool2").style.display = 'none';
                } else {
                    document.getElementById("highschool").style.display = 'block';
                    document.getElementById("highschool2").style.display = 'block';
                }
            }
        </script>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container">
                <div class="text-center mt-5 ">
                    <h1>Create CV</h1>
                </div>
                <div class="row ">
                    <div class="col-lg-7 mx-auto">
                        <div class="card mt-2 mb-5 mx-auto p-4 bg-light">
                            <div class="card-body bg-light">
                                <div class="container">
                                    <form id="contact-form" role="form" action="create_cv" method="POST">
                                        <div class="controls">
                                            <div class="row">
                                                <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                                    <p>
                                                        General Information
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group"> <label>Full name:</label>
                                                        <input type="text" name="fullname" class="form-control"
                                                               value = "${acc.fullname}"
                                                        required="required">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group"> <label>Image:</label>
                                                    <input style="" type="file" name="image" accept="image/*"
                                                           class="form-control" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group"> <label for="form_need">Gender:</label>
                                                    <select name="gender" class="form-control" required="required">
                                                        <option value="false">Male</option>
                                                        <option value="true">Female</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group"> <label for="form_need">Birthdate:</label>
                                                    <input type="dob" name="dob" class="form-control" value="${acc.dob}" required="required">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group"> <label>Current location:</label>
                                                    <select name="location" class="form-control" required="required">
                                                        <option value="0">--Choose location--</option>
                                                        <c:forEach var="o" items="${location}">
                                                            <option value="${o.id}">${o.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group"> <label>Phone number:</label>
                                                    <input type="text" name="phone" class="form-control" required="required" value="${acc.phone}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group"> <label>Contact:</label>
                                                    <input type="text" name="contact" value="" class="form-control"
                                                           required="required">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                                <p>
                                                    Education
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group"> <label for="form_need">Graduated from:</label>
                                                    <select name="education" class="form-control" required="required">
                                                        <option value="0">--Choose one below--</option>
                                                        <c:forEach var="o" items="${education}">
                                                            <option value="${o.id}">${o.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group" style="display: none" id="highschool"> 
                                                    <label>School name:</label>
                                                    <input type="text" name="school" id="highschool2" style="display: none;" class="form-control" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                                <p>
                                                    Experience
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group"> <label for="form_message">Experience details:</label>
                                                    <textarea name="experience" class="form-control"
                                                              placeholder="Enter details here..." rows="4" required="required"
                                                              data-error="Please enter here"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                                <input type="text" name="status" value="1" hidden>
                                    </div>
                                    <div class="col-md-12"> 
                                        <input style="background-color: #0062cc; color: black; background-color: #f39f86;
                                               background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); border-color: #f39f86; font-weight: bold;" 
                                               type="submit" class="btn btn-success btn-send pt-2 btn-block" value="Create CV">
                                    </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>

</html>
