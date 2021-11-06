<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My wallet</title>
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
            <div class="container vh-100">
                <div class="text-center mt-5 ">
                    <h1>My wallet</h1>
                </div>

                <div class="row mt-5 fw-bold" style="width: 60%; margin: auto; background-color: #2f3238; color: white;">
                    <div class="col-md-6 text-center mt-4 mb-4 border-right py-3">
                        <div class="align-middle">
                            <label style="color: white;">
                                Wallet Balance:
                            </label> <br>
                            <label style="color: white;">
                            ${wallet.getBalance()}
                        </label>
                    </div>
                </div>
                <div class="col-md-6 text-center mt-4 mb-4 border-left border-white text-wrap py-3">
                    <form action="add_money" method="post">

                        <button type ="submit" style="background-color: #37474f; font-weight: bold; border-color: #37474f; width: 70%" 
                                class="btn btn-success btn-send pt-2 btn-block">
                            Add money to wallet

                        </button>
                    </form>
                </div>
            </div>

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
                    <c:if test="${empty history}">
                        <tr>
                            Empty
                        </tr>

                    </c:if>
                        <%int count=1;%>
                    <c:forEach var="o" items="${history}">
                        <tr>
                            <td> <%=count%></td> <%count++;%>
                            <td>${acc.username}</td>
                            <td>${o.getType()=="1"?"deposit":"spent"}</td>
                            <td>${o.amount}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
