<%-- 
    Document   : BannerDetail
    Created on : Nov 8, 2021, 5:14:01 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            function display(){
                var MyWindow;
                var banner = document.getElementById("bannerimage").value
                MyWindow = window.open("", "","height=400,width=1000,status=yes,toolbar=no,menubar=no,location=abc");
                MyWindow.document.write("<img  src='"+banner+"'>");
            }
        </script>
          <jsp:include page="/Public/Header.jsp"></jsp:include>
            <div class="container" style="margin-bottom: 3%">
                <div class="text-center mt-5 ">
                    <h1>Job Detail</h1>
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
                                                   <input type="text" value="${bannerdetail.imagejob}" hidden="" id="bannerimage">
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
                                                <img class="rounded-circle" src="${bannerdetail.imagejob}">
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

                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/Public/Footer.jsp"></jsp:include>
    </body>
</html>
