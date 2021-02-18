<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/8/2021
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            background-image: url('http://erpa.co.in/wp-content/uploads/2017/06/erpa-login-bg.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Sign In</h5>
                    <form action="/login" modelAttribute="loginForm" method="post" class="form-signin">
                        <div class="form-label-group">
                            <input type="text" id="user_id" class="form-control" placeholder="User ID" name="user_id" required autofocus>
                            <label for="user_id">User_ID</label>
                        </div><br>

                        <div class="form-label-group">
                            <input type="password" id="password" class="form-control" placeholder="Password" name="pw" required>
                            <label for="password">Password</label>
                        </div><br>
                        <center>
                            <c:if test = "${loginError != null}">
                                <h6 style="color: red"><b>${loginError}</b></h6>
                            </c:if>
                        </center><br>
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" style="background-color: black">Sign in</button><br>
                        <div class="container" style="background-color:#f1f1f1">
                            <!--<span class="psw"><center>Don't have an account?<a style="color: green" href="register.jsp">Register</a></center></span><br>-->
                            <a style="color: blue" href="index.jsp"><center>Click to home page</center></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    //kill all back button functionality
    function noBack() { window.history.forward() }
    noBack();
    window.onload = noBack;
    window.onpageshow = function(evt) { if (evt.persisted) noBack() }
    window.onunload = function() { void (0) }
</script>
</body>
</html>
