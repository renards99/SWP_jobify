<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : BannerDetail
    Created on : Nov 8, 2021, 5:14:01 PM
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

        <script>
            function display() {
                var MyWindow;
                var banner = document.getElementById("bannerimage").value
                MyWindow = window.open("", "", "height=400,width=1000,status=yes,toolbar=no,menubar=no,location=abc");
                MyWindow.document.write("<img  src='" + banner + "'>");
            }
        </script>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container" style="margin-bottom: 3%">
                <div class="text-center mt-5 ">
                    <h1>Banner Detail</h1>
                </div>
                <div class="row">
                    <div class="col-lg-7 mx-auto">
                        <div class="card mt-2 mx-auto p-4 bg-light">
                            <div class="card-body bg-light">
                                <div class="container">
                                    <div class="controls">
                                        <div class="row">
                                            <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                                <p>General Information</p>
                                            </div>
                                            <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                                <button onclick="return display();"> See the banner</button>
                                                <input type="text" value="${bannerdetail.image}" hidden="" id="bannerimage">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group"><label>Jobname:</label></div>
                                            <div class="form-group" style="border-bottom: 1px solid;" ><b>${bannerdetail.getName()}</b></div>
                                            <div class="form-group"><label>Company name:</label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.getCompany()}</b></div>
                                        </div>
                                        <div class="col-md-4" style=";">
                                            <img style="height:170px; width: 170px;" class="rounded-circle" src="${bannerdetail.imagejob}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div>
                                            <div class="form-group"><label>Website: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.getWebsite()}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div>
                                            <div class="form-group"><label>Address: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.getAddress()}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">Major: </div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.major}</b></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">Job type: </div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.jobType}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div>
                                            <div class="form-group"><label>Salary: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.getSalary()}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div>
                                            <div class="form-group"><label>Description: </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.getDescription()}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div>
                                            <div class="form-group"><label>Requirement </label></div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.getRequirement()}</b></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6" style="font-weight:bolder; font-size: 20px;">
                                            <p>Communications</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">Email:</div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.getEmail()}</b></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">Phone:</div>
                                            <div class="form-group" style="border-bottom: 1px solid"><b>${bannerdetail.getPhone()}</b></div>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${acc.roleID==1}">
                                    <div class="row" style="margin-top: 2%">
                                        <div class="col-md-6" style="text-align: center">
                                            <a href="approve_banner?status=2">
                                                <button class="btn btn-success btn-send pt-2 btn-block"style="background-color: #0062cc; color: black; background-color: #f39f86;background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); border-color: #f39f86; font-weight: bold; border-radius: 3px" >
                                                    Accept banner
                                                </button>
                                            </a>
                                        </div>
                                        <!--</form>-->
                                        <div class="col-md-6" style="text-align: center">
                                            <a href="approve_banner?status=3">
                                                <button class="btn btn-success btn-send pt-2 btn-block"style="background-color: #0062cc; color: black; background-color: #f39f86;background-image: linear-gradient(315deg, #f39f86 0%, #f9d976 74%); border-color: #f39f86; font-weight: bold; border-radius: 3px" >
                                                    Decline banner
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </c:if>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/Public/Footer.jsp"></jsp:include>
    </body>
</html>
