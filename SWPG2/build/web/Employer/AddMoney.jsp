<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Check Out</title>
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
            <div class="container vh-100" >
                <div class="pb-3 text-center">
                    <img class="d-block mx-auto mb-3" src="https://media.istockphoto.com/vectors/wallet-linear-icon-modern-outline-wallet-logo-concept-on-white-from-vector-id1130930633?k=20&m=1130930633&s=170667a&w=0&h=xrzjFp9-TbXslRdB7blVEkRkvavgyYoItCAxkBfM9Sc=" alt="" width="130" height="110">
                    <h2>Checkout form</h2>
                </div>
                <form action="authorize_payment" method="post">
                    <div class="row">
                        <div class="col-sm-6 offset-sm-3">
                            <label  class="form-label">Product/Service:</label>

                            <input type="text" class="form-control" name="product" value="Add money to wallet" readonly="readonly" required />
                        </div>
                        <div class="col-sm-6 offset-sm-3 mt-2">
                            <label class="form-label">Sub Total ($):</label>
                            <input type="number" class="form-control" name="subtotal"  onchange="myChangeFunction(this)" id="myInput1" min="1" required/>
                        </div>
                        <div class="col-sm-6 offset-sm-3 mt-2">
                            <label class="form-label">Shipping:</label>
                            <input type="text" class="form-control" name="shipping" value="0" readonly="readonly" required/>
                        </div>
                        <div class="col-sm-6 offset-sm-3 mt-2">
                            <label class="form-label">Tax:</label>
                            <input type="text" class="form-control" name="tax" value="0" readonly="readonly" required/>
                        </div>
                        <div class="col-sm-6 offset-sm-3 mt-2">
                            <label class="form-label">Total Amount ($):</label>
                            <input type="text" class="form-control" name="total" value="0"  readonly="readonly" id="myInput2" />
                        </div>
                        <hr class="my-4 col-sm-6 offset-sm-3">
                        <button class="btn btn-primary btn-lg col-sm-6 offset-sm-3" type="submit">Continue to checkout</button>

                    </div>
                </form>


            </div>

        </body>

        <script type="text/javascript">
            function myChangeFunction(input1) {
                var input2 = document.getElementById('myInput2');
                input2.value = input1.value;
            }
        </script>
    <jsp:include page="Footer.jsp"></jsp:include>
</html>


