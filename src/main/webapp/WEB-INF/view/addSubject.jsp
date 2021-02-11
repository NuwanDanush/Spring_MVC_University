<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/29/2021
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <h5 class="card-title text-center">Add Subject Form</h5>
                    <form action="/addSubject" method="post" modelAttribute="addSubject" class="form-signin">

                        <%--this is use for display success message, After display success message then auto redirect dashboard.jsp--%>
                        <c:if test="${not empty added}">
                            <%
                                out.println("<meta http-equiv='refresh' content='2;URL=/dashboard'>");
                                out.println("<center><p style='color:green;'><b>Successfully!!!</b></p></center>");
                            %>
                        </c:if>

                        <div class="form-label-group">
                            <input type="text" id="sub_Name" class="form-control" placeholder="Subject Name"
                                   name="sub_name"
                                   required autofocus>
                            <label>Subject Name</label>
                        </div>
                        <br>

                        <div class="form-label-group">
                            <input type="text" id="sub_code" class="form-control" placeholder="Subject Code"
                                   name="sub_code"
                                   required autofocus>
                            <label>Subject Code</label>
                        </div>
                        <br>

                        <div class="form-label-group">
                            <select name="year" id="cars">
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
                            <input type="text" id="Lec_Id" class="form-control" placeholder="Lecturer ID"
                                   name="lecturer_id" required autofocus>
                            <label>Lecturer ID</label>
                        </div>
                        <br>

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
<script src="jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
    //ajax function for check subject code is already exist??
    $('#sub_code').change(function () {
        var name = $(this).val();
        var data = "sub_code=" + name;
        $.ajax({
            url: '/CheckSubjectCode',
            data: data,
            type: 'post',
            success: function (response) {
                if (response == 1) {
                    alert("Subject ID already exist!!");
                    $('#sub_code').val('');
                    $('#sub_code').focus();
                }
            }
        });
    });
    //ajax function for check the lecturer already assign subject??
    $('#Lec_Id').change(function () {
        var name = $(this).val();
        var data = "Lec_Id=" + name;
        $.ajax({
            url: '/CheckLecturerId',
            data: data,
            type: 'post',
            success: function (response) {
                if (response == 1) {
                    alert("Lecturer already assign to the subject!!");
                    $('#Lec_Id').val('');
                    $('#Lec_Id').focus();
                }
            }
        });
    });
</script>
</body>
</html>
