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
                    
                    <h1>Edit CV</h1>
                </div>
                <div class="row">
                    <div class="col-lg-7 mx-auto">
                        <div class="card mt-2 mx-auto p-4 bg-light">
                            <div class="card-body bg-light">
                                <div class="container">
                                    <div class="controls">
                                            <form action="edit_cv" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                                <p>General Information</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4" style=";">
                                                <div class="form-group">
                                                    <img class="rounded-circle" src="${viewCV.image}">
                                                </div>
                                                <div class="form-group">
                                                    <input type="file" title=" " name="file" id="img" accept="image/*"
                                                           class="form-control" >
                                                    <!--<label style="margin-left: 40px;" for="img">Choose file</label>-->
                                                </div>
                                            </div>
                                        
                                                <input type="text" name="id" value="${viewCV.getId()}" hidden="">
                                                <div class="col-md-8">
                                                    <div class="form-group"><label>Fullname:</label></div>
                                                    <div class="form-group" style="border-bottom: 1px solid;" >
                                                        <input type="text" name="fullname" value="${viewCV.fullname}">
                                                </div>
                                                <div class="form-group"><label>Birthdate:</label></div>
                                                <div class="form-group" style="border-bottom: 1px solid">
                                                    <input type="text" name="dob" value="${viewCV.getDob()}">
                                                </div>
                                            </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group"> <label for="form_need">Gender:</label>
                                                <select name="gender" class="form-control" required="required">
                                                    <option value="0" ${acc.gender==0?"selected":""}>Female</option>
                                                    <option value="1" ${acc.gender==1?"selected":""}>Male</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group"> <label>Current location:</label>
                                                <select name="location" style="background: transparent" class="form-control" required="required">
                                                    <option value="0">Location</option>
                                                    <c:forEach var="o" items="${location}">
                                                        <option value="${o.getId()}" ${acc.locationID==o.getId()?"selected":""} >${o.getName()} </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group"><label>Phone: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><input type="text" name="phone" value="${viewCV.getPhone()}"></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group"><label>Contact: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><input type="text" name="contact" value="${viewCV.getContact()}"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group"> <label for="form_need">Graduated from:</label>
                                                <select name="education" style="background: transparent" class="form-control" required="required">
                                                    <c:forEach var="o" items="${education}">
                                                        <option value="${o.getId()}" ${viewCV.getEducationID()==o.getId()?"selected":""}>${o.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group"><label>School: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid">
                                                <input type="text" name="school" value="${viewCV.school}">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div>
                                                <div class="form-group"><label>Experience: </label></div>
                                                <div class="form-group" style="border-bottom: 1px solid">
                                                    <input type="text" name="experience" value="${viewCV.getExperience()}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 2%">
                                        <div class="col-md-6" style="text-align: center">
                                            <button  class="btn btn-success btn-send pt-2 btn-block" 
                                                     style="background-color: #0062cc; color: black; 
                                                     background-color: #f39f86;background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                                     border-color: #f39f86; font-weight: bold; border-radius: 3px;" >
                                                Save changes
                                            </button>
                                        </div>
                                        <div class="col-md-6" style="text-align: center">
                                            <a href="view_cv">
                                                <button  class="btn btn-success btn-send pt-2 btn-block" 
                                                         style="background-color: #0062cc; color: black; 
                                                         background-color: #f39f86;background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); 
                                                         border-color: #f39f86; font-weight: bold; border-radius: 3px;" >
                                                    Cancel
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>