<%-- 
    Document   : Banner
    Created on : Nov 8, 2021, 12:27:28 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>notification</title>
    </head>
    <script>
    </script>
    <body onload="waitFiveSec()">
        <h3 style="color: red">${message}</h3>


    </body><script>
        setTimeout(function () {
            window.close()
        }, 10000);
    </script>
</html>
