<%--
  Created by IntelliJ IDEA.
  User: nuwan_d
  Date: 1/7/2021
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <a class="navbar-brand" href="#">Welcome "username"</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><b>PROFILE</b><span
                    class="caret"></span></a>
                <ul style="background-color: darkgrey" class="dropdown-menu">
                    <li><a href="#"><b>View Profile</b></a></li>
                    <li><a href="#"><b>Edit Profile</b></a></li>
                    <li><a href="index.jsp"><b>Logout</b></a></li>
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
        <a href="#">View Student</a>
        <a href="#">Delete Student</a>
    </div>
    <button class="dropdown-btn">Lecturer
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
        <a href="/registerLec">Add Lecturer</a>
        <a href="#">View Lecturer</a>
        <a href="#">Update Lecturer</a>
    </div>
    <button class="dropdown-btn">Subject
        <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-container">
        <a href="#">Add Subject</a>
        <a href="#">View Subject</a>
        <a href="#">Edit Subject</a>
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
</html>
