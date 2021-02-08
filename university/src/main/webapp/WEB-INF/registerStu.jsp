<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/7/2021
  Time: 10:06 AM
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
                    <h5 class="card-title text-center">Student Register Form</h5>
                    <form class="form-signin">
                        <div class="form-label-group">
                            <input type="text" id="fName" class="form-control" placeholder="First Name" name="fname" required autofocus>
                            <label for="inputFname" >First Name</label>
                        </div><br>

                        <div class="form-label-group">
                            <input type="text" id="fName" class="form-control" placeholder="Last Name" name="lname" required autofocus>
                            <label for="inputLname" >last Name</label>
                        </div><br>

                        <div class="form-label-group">
                            <input type="text" id="id" class="form-control" placeholder="Student ID" name="id" required autofocus>
                            <label for="inputId" >Student ID</label>
                        </div><br>

                        <div class="form-label-group">
                            <input type="text" id="year" class="form-control" placeholder="Year" name="year" required autofocus>
                            <label for="inputYear" >Year</label>
                        </div><br>

                        <div class="form-label-group">
                            <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="email" required autofocus>
                            <label for="inputEmail" >Email Address</label>
                        </div><br>

                        <div class="form-label-group">
                            <input type="text" id="phone" class="form-control" placeholder="Phone Number" name="phone" required autofocus>
                            <label for="inputPhone" >Phone Number</label>
                        </div><br>

                        <div class="form-label-group">
                            <input type="hidden" id="photo" class="form-control" name="photo" value="abc" required autofocus>
                        </div>

                        <div class="form-label-group">
                            <input type="hidden" id="roll" class="form-control" name="roll" value="3" required autofocus>
                        </div>

                        <div class="form-label-group">
                            <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="pw" required>
                            <label for="inputPassword" >Password</label>
                        </div><br>

                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" style="background-color: black">Submit</button><br>
                    </form>
                    <form action="dashboard.jsp" method="post">
                        <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" style="background-color: black">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
