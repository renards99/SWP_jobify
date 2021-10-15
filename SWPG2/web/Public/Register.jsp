<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <style>

            body{
                font-size: 10px;
            }

            .wrapper {
                position: relative;
                width: fit-content;
                height: fit-content;
            }

            .play {
                position: absolute;         
                width: 100px;
                z-index: 10;
            }
            .divider:after,
            .divider:before {
                content: "";
                flex: 1;
                height: 1px;
                background: #eee;
            }
            .h-custom {
                height: calc(100% - 73px);
            }
            @media (max-width: 450px) {
                .h-custom {
                    height: 100%;
                }
            }
            .blur img:hover {
                -webkit-filter: blur(2px); /* Chrome, Safari, Opera */
                filter: blur(2px);
            }

        </style>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


    </head>
    <body>
        <div class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="wrapper col-md-9 col-lg-6 col-xl-5 blur">
                        <a href=""><img class=" play" src="https://i.ibb.co/SPrbGXk/logo.png" alt=""></a>                       
                        <!-- carousel-->
                        <div id="carouselDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active" data-bs-interval="10000">
                                    <img src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-login-form/draw2.png" class="blurme d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-sm-block ">
                                        <h4>Join now</h4>
                                        <h5>Thousand of users has found a job</h5>
                                    </div>
                                </div>
                                <div class="carousel-item" data-bs-interval="2000">
                                    <img src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-login-form/draw2.png" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-sm-block">

                                        <h5>More than 100 jobs are waiting for you.</h5>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselDark" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselDark" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form class="needs-validation" action="register" method="post" novalidate>

                            <div class="d-flex flex-row align-items-center justify-content-start my-3">
                                <p class="lead fw-bold mb-0  ">Register new account</p>

                            </div>
                            <!-- input -->

                            ${message}
                            <div class="form-outline mb-2">
                                <label>User name</label>
                                <input type="text" name="username" class="form-control" required
                                       placeholder="Enter username" />
                            </div>
                            <!--input -->                           
                            <div class="form-outline mb-2">
                                <label>Email address</label>
                                <input type="email" name="email" class="form-control" required
                                       placeholder="Enter a valid email address" />
                            </div>


                            <!-- Password input -->
                            <div class="form-outline mb-2">
                                <label >Password</label>
                                <div class="input-group ">                                   
                                    <input type="password" id="password" name="password" class="form-control" required
                                           placeholder="Enter password" />
                                    <span class="input-group-text" onclick="password_show_hide();">
                                        <i class="fas fa-eye" id="show_eye"></i>
                                        <i class="fas fa-eye-slash d-none" id="hide_eye"></i>
                                    </span> 
                                </div>

                            </div>
                            <div class="form-ountline mb-2">
                                <label >Confirm your password</label>
                                <div class="input-group ">                                   
                                    <input type="password" id="password2" name="password2" class="form-control" required
                                           placeholder="re-enter password" />
                                    <span class="input-group-text" onclick="password_show_hide2();">
                                        <i class="fas fa-eye" id="show_eye2"></i>
                                        <i class="fas fa-eye-slash d-none" id="hide_eye2"></i>
                                    </span> 
                                </div>
                            </div>
                            <%-- choose role --%>
                            <span>Select role:   </span>
                            <div class="d-inline ms-3 ">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="myRadio" id="inlineRadio1" value="employee" required >
                                    <label class="form-check-label" for="inlineRadio1">Employee</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="myRadio" id="inlineRadio2" value="employer">
                                    <label class="form-check-label" for="inlineRadio2">Employer</label>
                                </div>
                            </div>

                            <p class="my-2" id="terms-and-privacy">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">

                                I have read and agreed with the
                                <a href="#" target="_blank">Terms</a>
                                <span> and </span>
                                <a href="#" target="_blank">Privacy Policy</a>.
                            </div>
                            </p>
                            <div class="text-center text-lg-start mt-2 pt-2">
                                <button type="submit" class="btn btn-primary btn-lg btn-block"
                                        >Create account</button>
                                <p class="small fw-bold mt-2 pt-1 mb-3">already have an account? <a href="login"
                                                                                                    class="link-primary">Sign in</a></p>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <script src="js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
