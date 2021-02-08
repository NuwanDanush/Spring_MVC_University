<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/21/2021
  Time: 5:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<html>
<head>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body{
                margin-top:20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;
            }
            .main-body {
                padding: 15px;
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }

            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }

            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }

            .gutters-sm>.col, .gutters-sm>[class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }
            .mb-3, .my-3 {
                margin-bottom: 1rem!important;
            }

            .bg-gray-300 {
                background-color: #e2e8f0;
            }
            .h-100 {
                height: 100%!important;
            }
            .shadow-none {
                box-shadow: none!important;
            }
        </style>
    </head>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="container">
    <div class="main-body">
        <div class="row gutters-sm">
            <div class="col-md-6 col-md-offset-3 " >
                <div class="card mb-3">
                    <div class="card-body">
                        <form action="/updateOtherUser" method="post" modelAttribute="updateForm" class="form-signin"
                              onsubmit="return fn()" name="f1">
                            <div class="form-label-group">
                                <input type="text" id="LfName" class="form-control"
                                       value="${userData.get(0).getFname()}" name="fname"
                                       required autofocus>
                                <label>First Name</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="text" id="LlName" class="form-control"
                                       value="${userData.get(0).getLname()}" name="lname"
                                       required autofocus>
                                <label>Last Name</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="email" id="LinputEmail" class="form-control"
                                       value="${userData.get(0).getEmail()}"
                                       name="email" required autofocus>
                                <label>Email Address</label>
                            </div>
                            <br>

                            <div class="form-label-group">
                                <input type="text" id="Lphone" class="form-control"
                                       value="${userData.get(0).getPhone()}" name="phone"
                                       required autofocus>
                                <label>Phone Number</label>
                            </div>

                            <div class="form-label-group">
                                <input type="hidden" id="Lphoto" class="form-control" name="encode_photo" value="${userData.get(0).getEncode_photo()}" required
                                       autofocus>
                            </div>

                            <div class="form-label-group">
                                <input type="hidden" id="user_id" class="form-control" name="user_id"
                                       value="${userData.get(0).getUser_id()}" required
                                       autofocus>
                            </div>

                            <c:if test="${not empty response}">
                                <%
                                    out.println("<meta http-equiv='refresh' content='2;URL=/dashboard'>");
                                    out.println("<center><p style='color:green;'><b>Update Successfully!!!</b></p></center>");
                                %>
                            </c:if>

                            <center><span id="error"></span></center>
                            <br>
                            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"
                                    style="background-color: black">Submit
                            </button>
                            <br>
                        </form>
                        <a href="/dashboard" style="background-color: black"
                           class="btn btn-lg btn-primary btn-block text-uppercase">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function fn() {
        var phone = f1.phone.value;
        var email = f1.email.value;
        if (!(ValidateEmail(email))) {
            error.textContent = "Invalid email";
            error.style.color = "red";
            return false;
        } else if (!(Validation(phone))) {
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
