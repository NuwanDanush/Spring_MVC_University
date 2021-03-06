<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 2/3/2021
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h5 class="card-title text-center">Add New Assignment</h5>
                    <form action="/submitAssignment" enctype="multipart/form-data" method="post"
                          modelAttribute="addAssignment" class="form-signin">

                        <%--this is use for display success message, After display success message then auto redirect dashboard.jsp--%>
                        <c:if test="${not empty responce}">
                            <%
                                out.println("<meta http-equiv='refresh' content='2;URL=/dashboard'>");
                                out.println("<center><p style='color:green;'><b>Add Assignment Successfully!!!</b></p></center>");
                            %>
                        </c:if>

                        <div class="form-label-group">
                            <input type="text" id="sub_code" class="form-control" placeholder="Subject Code"
                                   name="sub_code"
                                   required autofocus>
                            <label>Subject Code</label>
                        </div>
                        <br>
                        <div class="form-label-group">
                            <input type="text" id="sub_name" class="form-control" placeholder="Subject Name"
                                   name="sub_name"
                                   required autofocus>
                            <label>Subject Name</label>
                        </div>
                        <br>

                        <div class="form-label-group">
                            <input type="text" id="Assignment_Id" class="form-control" placeholder="Assignment ID"
                                   name="assignment_id" required autofocus>
                            <label>Assignment ID</label>
                        </div>
                        <br>

                        <div class="form-label-group">
                            <select name="year" id="Year" required>
                                <option value="" selected disabled hidden>Choose here</option>
                                <option value="1">1st Year</option>
                                <option value="2">2nd Year</option>
                                <option value="3">3rd year</option>
                                <option value="4">4th Year</option>
                            </select>
                            <label>Select Year</label>
                        </div>
                        <br>

                        <div class="form-label-group">
                            <div class="file-upload-wrapper" data-text="Select your file!">
                                <input name="question" type="file" class="file-upload-field">
                                <label>Upload Assignment</label>
                            </div>
                        </div>
                        <br>

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
</body>
</html>
