<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Receipt</title>
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
            .job_img{
                width: 140px;
                height: 140px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>
            <div class="container mb-5" >
                <div class="pb-3 text-center">
                    <img class="d-block mx-auto mb-3" src="https://media.istockphoto.com/vectors/wallet-linear-icon-modern-outline-wallet-logo-concept-on-white-from-vector-id1130930633?k=20&m=1130930633&s=170667a&w=0&h=xrzjFp9-TbXslRdB7blVEkRkvavgyYoItCAxkBfM9Sc=" alt="" width="130" height="110">
                    <h1>Payment Done. Thank you for purchasing our products</h1>
                    <br/>
                    <h2>Receipt Details:</h2>
                </div>

                <form action="execute_payment" method="post">
                    <input type="hidden" name="paymentId" value="${param.paymentId}" />
                <input type="hidden" name="PayerID" value="${param.PayerID}" />
                <table class="table table-hover col-sm-8 offset-sm-2">
                    <tr>
                        <td><b>Merchant:</b></td>
                        <td>Jobify</td>
                    </tr>
                    <tr>
                        <td><b>Payer:</b></td>
                        <td>${payer.firstName} ${payer.lastName}</td>		
                    </tr>
                    <tr>
                        <td><b>Description:</b></td>
                        <td>${transaction.description}</td>
                    </tr>	
                    <tr>
                        <td><b>Subtotal:</b></td>
                        <td>${transaction.amount.details.subtotal} USD</td>
                    </tr>
                    <tr>
                        <td><b>Shipping:</b></td>
                        <td>${transaction.amount.details.shipping} USD</td>
                    </tr>
                    <tr>
                        <td><b>Tax:</b></td>
                        <td>${transaction.amount.details.tax} USD</td>
                    </tr>
                    <tr>
                        <td><b>Total:</b></td>
                        <td>${transaction.amount.total} USD</td>
                    </tr>
                </table>
                    <a class="offset-sm-2" href="http://localhost:8080/SWPG2/view_wallet">Back to wallet</a>
            </form>
        </div>

    </body>

    <jsp:include page="Footer.jsp"></jsp:include>

</html>