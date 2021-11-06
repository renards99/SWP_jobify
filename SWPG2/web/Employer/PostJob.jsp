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
        <title>Post new job</title>
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
            input {
                background: transparent;
                border: none;
                width: 100%;
            }
            input:focus {
                border: none;
            }
        </style>
    </head>
    <body>
        
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container" style="margin-bottom: 3%">
                <div class="text-center mt-5 ">
                    <h1>Post new job</h1>
                </div>
                <div class="row">
                    <div class="col-lg-7 mx-auto">
                        <div class="card mt-2 mx-auto p-4 bg-light">
                            <div class="card-body bg-light">
                                <form action="post_job" method="post" enctype="multipart/form-data">
                                <div class="container">
                                    <div class="controls">
                                        
                                        <div class="row">
                                            <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                                <p>General Information</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-center" style=";">
                                                <div class="form-group">
                                                    <img class="rounded-circle" src="https://static.topcv.vn/company_logos/cong-ty-co-phan-chung-khoan-dai-nam-60d543347cdd8.jpg">
                                                </div>
                                                <div class="form-group">
                                                  
                                                    <input type="file" title=" " name="file" id="img" accept="image/*"
                                                           class="form-control" >
                                                    <!--<label for="img">Choose file</label>-->
                                                </div>
                                            </div>
                                        </div>
                                       
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group"><label>Job name: </label></div>
                                                    <div class="form-group" style="border-bottom: 1px solid;" >
                                                        <input type="text" name="name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group"><label>Company name: </label></div>
                                                    <div class="form-group" style="border-bottom: 1px solid">
                                                        <input type="text" name="company">
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group"><label>Website: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid">
                                                <input type="text" name="website">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group"><label>Address: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid">
                                                <input type="text" name="address">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group"><label>Salary: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid">
                                                <input type="text" name="salary">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group"> 
                                                <label>
                                                    Job type:    
                                                </label>
                                                <select name="jobtype" class="form-control" required="required">
                                                    <option value="0">--Choose job type--</option>
                                                <c:forEach var="o" items="${jobtype}">
                                                    <option value="${o.id}">${o.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group"> 
                                            <label>
                                                Location:  
                                            </label>
                                            <select name="location" class="form-control" required="required">
                                                <option value="0">--Choose location--</option>
                                                <c:forEach var="o" items="${location}">
                                                    <option value="${o.id}">${o.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group"> 
                                            <label>
                                                Major:   
                                            </label>
                                            <select name="major" class="form-control" required="required">
                                                <option value="0">--Choose major--</option>
                                                <c:forEach var="o" items="${major}">
                                                    <option value="${o.id}">${o.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div>
                                        <div class="form-group"><label>Description: </label></div>
                                        <div class="form-group">
                                            <textarea class="form-control" name="description" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div>
                                        <div class="form-group"><label>Requirement: </label></div>
                                        <div class="form-group">
                                            <textarea class="form-control" name="requirement" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group"><label>Email: </label></div>
                                        <div class="form-group" style="border-bottom: 1px solid">
                                            <input type="text" name="email">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group"><label>Phone: </label></div>
                                        <div class="form-group" style="border-bottom: 1px solid">
                                            <input type="text" name="phone">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12"> 
                                    <input style="background-color: #0062cc; color: black; background-color: #f39f86;
                                           background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); border-color: #f39f86; font-weight: bold;" 
                                           type="submit" class="btn btn-success btn-send pt-2 btn-block" value="POST JOB">
                                </div>
                            </div>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>