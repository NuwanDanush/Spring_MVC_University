<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/8/2021
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%
    String uRoll = (String) session.getAttribute("uRoll");
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            font-family: "Lato", sans-serif;

            background-image: url('https://www.kustomkartel.com/wp-content/uploads/2014/10/home-page-background-temp.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
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
<% if (uRoll.equals("1")){%>
    <body >
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Welcome to Admin Dashboard</a>
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

    <div class="sidenav">
        <button class="dropdown-btn">Student
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="/registerStu">Add Student</a>
            <a href="/viewStudent">View Student</a>
        </div>
        <button class="dropdown-btn">Lecturer
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="/registerLec">Add Lecturer</a>
            <a href="/viewLecturer">View Lecturer</a>
        </div>
        <button class="dropdown-btn">Subject
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="/addSubjectForm">Add Subject</a>
            <a href="/viewSubject">View Subject</a>
        </div>
    </div>
    <div class="main">
        <h2>Hello User!!</h2>
        <p>Click on the dropdown button to open the dropdown menu inside the side navigation.</p>
        <p>Some random text..</p>
    </div>
    <script>
        /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
        var dropdown = document.getElementsByClassName("dropdown-btn");
        var i;

        for (i = 0; i < dropdown.length; i++) {
            dropdown[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                    dropdownContent.style.display = "none";
                } else {
                    dropdownContent.style.display = "block";
                }
            });
        }
    </script>
    </body>
<%} else if (uRoll.equals("2")){%>
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

    <div class="sidenav">
        <button class="dropdown-btn">Student
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="/lecViewStuList">View Student</a>
        </div>
        <button class="dropdown-btn">Subject
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">Time Table</a>
        </div>
        <button class="dropdown-btn">Marks
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">Add Marks</a>
            <a href="#">View Marks</a>
            <a href="#">Edit Marks</a>
        </div>
        <button class="dropdown-btn">Assignment
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="/addAssignmentForm">Add Assignment</a>
            <a href="/lecViewAssList">View Assignment</a>
        </div>
        <button class="dropdown-btn">Report
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">Download</a>
        </div>
    </div>
    <div class="main">
        <h2>Hello User!!</h2>
        <p>Click on the dropdown button to open the dropdown menu inside the side navigation.</p>
        <p>Some random text..</p>
    </div>
    <script>
        /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
        var dropdown = document.getElementsByClassName("dropdown-btn");
        var i;

        for (i = 0; i < dropdown.length; i++) {
            dropdown[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                    dropdownContent.style.display = "none";
                } else {
                    dropdownContent.style.display = "block";
                }
            });
        }
    </script>
    </body>
<%} else if (uRoll.equals("3")){%>
    <body >
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Welcome to Student Dashboard</a>
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

    <div class="sidenav">
        <button class="dropdown-btn">Subject
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="/stuViewSubjects">View Subject</a>
        </div>
        <button class="dropdown-btn">Assignment
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">View Assignment</a>
        </div>
        <button class="dropdown-btn">Marks
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">View Marks</a>
        </div>
        <button class="dropdown-btn">Report
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">
            <a href="#">Download</a>
        </div>
    </div>
    <div class="main">
        <h2>Hello User!!</h2>
        <p>Click on the dropdown button to open the dropdown menu inside the side navigation.</p>
        <p>Some random text..</p>
    </div>
    <script>
        /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
        var dropdown = document.getElementsByClassName("dropdown-btn");
        var i;

        for (i = 0; i < dropdown.length; i++) {
            dropdown[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                    dropdownContent.style.display = "none";
                } else {
                    dropdownContent.style.display = "block";
                }
            });
        }
    </script>
    </body>
<%}%>
</html>
