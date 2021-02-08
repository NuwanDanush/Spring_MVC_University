<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/7/2021
  Time: 10:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
                <div class="card-body">
                    <h5 class="card-title text-center">Sign In</h5>
                    <form action="login" method="post" class="form-signin">
                        <div class="form-label-group">
                            <input type="text" id="uname" class="form-control" placeholder="User Name" name="uname" required autofocus>
                            <label for="uname">User Name</label>
                        </div><br>

                        <div class="form-label-group">
                            <input type="password" id="password" class="form-control" placeholder="Password" name="pw" required>
                            <label for="password">Password</label>
                        </div><br>
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
</body>
</html>