<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/18/2021
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>



<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
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
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Welcome to profile</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>PROFILE</b><span
                    class="caret"></span></a>
                <ul style="background-color: darkgrey" class="dropdown-menu">
                    <li><a href="/viewProfile"><b>View Profile</b></a></li>
                    <li><a href="#"><b>Edit Profile</b></a></li>
                    <li><a href="/logout"><b>Logout</b></a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="main-body">

        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/dashboard">Home</a></li>
                <li class="breadcrumb-item"><a href="#">User</a></li>
            </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="${userData.get(0).getEncode_photo()}" alt="profile picture" class="rounded-circle" height="150"/>
                            <div class="mt-3">
                                <h4>${userData.get(0).getFname()} ${userData.get(0).getLname()}</h4>
                                <%--<p class="text-secondary mb-1">Full Stack Developer</p>--%>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-3">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github mr-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Github</h6>
                            <span class="text-secondary">bootdey</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram mr-2 icon-inline text-danger"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
                            <span class="text-secondary">bootdey</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                            <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook mr-2 icon-inline text-primary"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
                            <span class="text-secondary">bootdey</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                            <form action="/updateData" method="post" modelAttribute="updateForm" class="form-signin" enctype="multipart/form-data" onsubmit="return fn()" name="f1">

                                <div class="form-label-group">
                                    <div class="file-upload-wrapper" data-text="Select your file!">
                                        <input name="photo" type="file" class="file-upload-field">
                                        <label>Upload Photo</label>
                                    </div>
                                </div>
                                <br>

                                <div class="form-label-group">
                                    <input type="text" id="LfName" class="form-control" value="${userData.get(0).getFname()}" name="fname"
                                           required autofocus>
                                    <label>First Name</label>
                                </div>
                                <br>

                                <div class="form-label-group">
                                    <input type="text" id="LlName" class="form-control" value="${userData.get(0).getLname()}" name="lname"
                                           required autofocus>
                                    <label>Last Name</label>
                                </div>
                                <br>

                                <div class="form-label-group">
                                    <input type="email" id="LinputEmail" class="form-control" value="${userData.get(0).getEmail()}"
                                           name="email" required autofocus>
                                    <label>Email Address</label>
                                </div>
                                <br>

                                <div class="form-label-group">
                                    <input type="text" id="Lphone" class="form-control" value="${userData.get(0).getPhone()}" name="phone"
                                           required autofocus>
                                    <label>Phone Number</label>
                                </div>

                                <%--<div class="form-label-group">--%>
                                    <%--<input type="hidden" id="Lphoto" class="form-control" name="photo" value="abc" required--%>
                                           <%--autofocus>--%>
                                <%--</div>--%>

                                <c:if test="${not empty response}">
                                    <%
                                        out.println("<meta http-equiv='refresh' content='2;URL=/viewProfile'>");
                                        out.println("<center><p style='color:green;'><b>Update Successfully!!!</b></p></center>");
                                    %>
                                </c:if>

                                <center><span id="error"></span></center><br>
                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit"
                                        style="background-color: black">Submit
                                </button>
                                <br>
                            </form>
                        <a href="/viewProfile" style="background-color: black"
                           class="btn btn-lg btn-primary btn-block text-uppercase">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

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
