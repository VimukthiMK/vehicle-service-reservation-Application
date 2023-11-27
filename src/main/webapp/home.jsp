<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title> Vehicle Service Reservation</title>
	<link href="CSS/home.css" rel="stylesheet" type="text/css">
</head>

<body>

	<header>
		 <div>
		<nav class="navbar">
			
			<div class="nav-hd">
				<a href="home.jsp" class="navbar-head"> Vehicle Service Reservation </a>
			</div>
			
			<div class="nav-el" id="nav-el">
				<button id="btn-new_res" class="btn-new_res" >
				<span class="btn-text">New reservation</span>
				</button>
			</div>
			<div class="nav-el" id="nav-el">
				<button id="btn-logout" class="btn-logout" >
				<span class="btn-text" onClick="index.jsp">Logout</span>
				</button>
			</div>
			
		</nav>
		</div>
	</header>
	
	<div class="card">
    <div class="card-body">
        <h2 id="welcome">Welcome, <span id="fName"></span>!</h2>

        <div class="card">
            <div class="card-header">
                User Information
            </div>
            <div class="card-body">
                <dl class="row">
                    <dt class="col">Email:</dt>
                    <dd class="col" id="email"></dd>

                    <dt class="col">Phone Number:</dt>
                    <dd class="col" id="phone_no"></dd>

                    <dt class="col">Country:</dt>
                    <dd class="col" id="country"></dd>
                </dl>
            </div>
        </div>
    </div>
</div>

<div>
<h3 class="text-center">Your Vehicle Service Reservations</h3>
<hr>
<div class="container text-left">
    <a href="#" class="btn btn-success">View My Reservations</a>
</div>
<br>
<br>
<table class="info-table">
    <thead>
        <tr>
            <th>Booking ID</th>
			<th>Date</th>
			<th>Time</th>
			<th>Location</th>
			<th>Vehicle no.</th>
			<th>Mileage</th>
			<th>Message</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        
    </tbody>
</table>

</div>
	
			
</body>
</html>