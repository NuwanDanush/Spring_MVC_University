<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 2/9/2021
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        /* Fixed sidenav, full height */
        .sidenav {
            height: 100%;
            width: 200px;
            position: fixed;
            z-index: 1;
            top: 52px;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            padding-top: 30px;
        }

        /* Style the sidenav links and the dropdown button */
        .sidenav a, .dropdown-btn {
            padding: 6px 8px 6px 16px;
            text-decoration: none;
            font-size: 20px;
            color: #818181;
            display: block;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            outline: none;
        }

        /* On mouse-over */
        .sidenav a:hover, .dropdown-btn:hover {
            color: #f1f1f1;
        }

        /* Main content */
        .main {
            margin-left: 200px; /* Same as the width of the sidenav */
            font-size: 20px; /* Increased text to enable scrolling */
            padding: 0px 10px;
        }

        /* Add an active class to the active dropdown button */
        .active {
            background-color: green;
            color: white;
        }

        /* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
        .dropdown-container {
            display: none;
            background-color: #262626;
            padding-left: 8px;
        }

        /* Optional: Style the caret down icon */
        .fa-caret-down {
            float: right;
            padding-right: 8px;
        }

        /* Some media queries for responsiveness */
        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

            .sidenav a {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Welcome to Lecturer Dashboard</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>PROFILE</b><span
                    class="caret"></span></a>
                <ul style="background-color: darkgrey" class="dropdown-menu">
                    <li><a href="/viewProfile"><b>View Profile</b></a></li>
                    <li><a href="/editProfile"><b>Edit Profile</b></a></li>
                    <li><a href="/logout"><b>Logout</b></a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <h2><center>-----Add Students Marks-----</center></h2><br>

    <form action="/submitMarks" method="post" modelAttribute="marksForm">
        <table class="table table-hover">

            <tr>
                <th>Student_ID</th>
                <th>Subject_code</th>
                <th>Mark</th>
            </tr>
            <!--set arraylist values in to the table-->
            <c:forEach items="${stuList}" var="user" step="1" begin="0">
                <tr>
                    <td> <input type="text"  name="user_id" value="${user.user_id}" readOnly=”true” /></td>
                    <td> <input type="text"  name="sub_code" value="${user.sub_code}" readOnly=”true” /></td>
                    <td> <input type="text"  name="mark" value=""/></td>
                </tr>
            </c:forEach>
        </table><br>
        <button class="btn btn-primary" type="submit" style="background-color: black; border-color: black; width: 100px">Submit</button><br>
    </form>


    <a href="/dashboard" class="btn btn-primary" style="background-color: black; border-color: black; width: 100px" >Cancel</a>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</div>
</body>
</html>
