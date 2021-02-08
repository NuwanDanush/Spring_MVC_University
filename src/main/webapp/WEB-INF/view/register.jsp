<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/8/2021
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            background-image: url('https://www.ygfconcierge.com/wp-content/uploads/2016/02/home-page-background-2.jpg');
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
                    <c:if test = "${regToken.equals('Lec')}">  <!--if token == Lec load lecturer register form-->
                        <h5 class="card-title text-center">Lecturer Register Form</h5>
                        <form action="/submit" method="post" modelAttribute="registerForm" class="form-signin" onsubmit="return fn()" name="f1">

                            <%--this is use for display success message, After display success message then auto redirect dashboard.jsp--%>
                            <c:if test="${not empty response}">
                                <%
                                    out.println("<meta http-equiv='refresh' content='2;URL=/dashboard'>");
                                    out.println("<center><p style='color:green;'><b>Register Successfully!!!</b></p></center>");
                                %>
                            </c:if>

                            <div class="form-label-group">
                                <input type="text" id="LfName" class="form-control" placeholder="First Name" name="fname"
                                       required autofocus>
                                <label for="fName">First Name</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="text" id="LlName" class="form-control" placeholder="Last Name" name="lname"
                                       required autofocus>
                                <label for="lName">Last Name</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="hidden" id="Lyear" class="form-control" name="year" value="-" required
                                       autofocus>
                            </div>

                            <div class="form-label-group">
                                <input type="text" id="id" class="form-control" placeholder="Lecturer ID" name="id" required
                                       autofocus>
                                <label>Lecturer ID</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="email" id="LinputEmail" class="form-control" placeholder="Email address"
                                       name="email" required autofocus>
                                <label for="inputEmail">Email Address</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="text" id="Lphone" class="form-control" placeholder="Phone Number" name="phone"
                                       required autofocus>
                                <label for="phone">Phone Number</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="hidden" id="Lroll" class="form-control" name="roll" value="2" required
                                       autofocus>
                            </div>

                            <div class="form-label-group">
                                <input type="password" id="LinputPassword" class="form-control" placeholder="Password"
                                       name="pw" required>
                                <label for="inputPassword">Password</label>
                            </div>

                            <div class="form-label-group">
                                <input type="hidden" id="Lphoto" class="form-control" name="photo" value="abc" required
                                       autofocus>
                            </div>

                            <center><span id="error"></span></center><br>
                            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"
                                    style="background-color: black">Submit
                            </button>
                            <br>
                        </form>
                        <a href="/dashboard" style="background-color: black"
                           class="btn btn-lg btn-primary btn-block text-uppercase">Cancel</a>
                    </c:if>
                    <c:if test = "${regToken.equals('Stu')}"> <!-- if token == Stu load student register form-->
                        <h5 class="card-title text-center">Student Register Form</h5>
                        <form action="/submit" method="post" modelAttribute="registerForm" class="form-signin" onsubmit="return fn()" name="f1">

                                <%--this is use for display success message, After display success message then auto redirect dashboard.jsp--%>
                            <c:if test="${not empty response}">
                                <%
                                    out.println("<meta http-equiv='refresh' content='2;URL=/dashboard'>");
                                    out.println("<center><p style='color:green;'><b>Register Successfully!!!</b></p></center>");
                                %>
                            </c:if>

                            <div class="form-label-group">
                                <input type="text" id="fName" class="form-control" placeholder="First Name" name="fname" required autofocus>
                                <label for="fName" >First Name</label>
                            </div><br>

                            <div class="form-label-group">
                                <input type="text" id="lName" class="form-control" placeholder="Last Name" name="lname" required autofocus>
                                <label for="lName" >Last Name</label>
                            </div><br>

                            <div class="form-label-group">
                                <input type="text" id="id" class="form-control" placeholder="Student ID" name="id" required autofocus>
                                <label>Student ID</label>
                            </div><br>

                            <div class="form-label-group">
                                <input type="text" id="year" class="form-control" placeholder="Year" name="year" required autofocus>
                                <label for="year" >Year</label>
                            </div><br>

                            <div class="form-label-group">
                                <input type="email" id="inputEmail" class="form-control" placeholder="Email address"
                                       name="email" required autofocus>
                                <label for="inputEmail">Email Address</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="text" id="phone" class="form-control" placeholder="Phone Number" name="phone" required autofocus>
                                <label for="phone" >Phone Number</label>
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
                            </div>

                            <center><span id="error"></span></center><br>
                            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" style="background-color: black">Submit</button><br>
                        </form>
                        <a href="/dashboard" style="background-color: black"
                           class="btn btn-lg btn-primary btn-block text-uppercase">Cancel</a>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

    //ajax function for check user id is already exist??
    $('#id').change(function () {
        var name = $(this).val();
        var data = "id=" + name;
        $.ajax({
            url: '/CheckUserId',
            data: data,
            type: 'post',
            success: function (response) {
                if (response == 1) {
//                                        error.textContent = "username already exist!!";
//                                        error.style.color = "red";
                    alert("UserID already exist!!");
                    $('#id').val('');
                    $('#id').focus();
                }
            }
        });
    });

    function fn() {
        var phone = f1.phone.value;
        var email = f1.email.value;
          if (!(ValidateEmail(email))) {
            error.textContent = "Invalid email";
            error.style.color = "red";
            return false;
        }else if (!(Validation(phone))) {
            error.textContent = "Invalid phone number";
            error.style.color = "red";
            return false;
        }

        <!-- Email validation function-->
        function ValidateEmail(uemail) {
            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (uemail.match(mailformat)) {
                return true;
            } else {
                return false;
            }
        }

        <!-- phone number validation function-->
        function Validation(phone) {
            var phoneno = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
            if (phone.match(phoneno)) {
                return true;
            } else {
                return false;
            }
        }
    }
</script>
</body>
</html>
