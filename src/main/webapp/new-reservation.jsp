<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
// Retrieve email-session attribute
String userEmail = (String) session.getAttribute("userEmail");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add reservation</title>
<link href="CSS/form.css" rel="stylesheet" type="text/css">
</head>
<body>
	
		<header>
		 <div>
		<nav class="navbar">
			
			<div class="nav-hd">
				<a href="home.jsp" class="navbar-head"> Vehicle Service Reservation </a>
			</div>
			
			<div class="nav-el" id="nav-el">
				<ul class="navbar-nav">
				<li><a href="home.jsp" class="nav-link">Back</a></li>
			</ul>
			</div>
			
		</nav>
		</div>
	</header>
	<br>
	<div class="container">
    <div class="card">
        <div class="card-body">
            <c:if test="${vehicleService == null}">
		
           </c:if>
           <form action="insert" method="post">

            <h2>
                <c:if test="${vehicleService == null}">
                    Create New Reservation
                </c:if>
            </h2>

            <fieldset class="form-group">
                <label>Username (Authenticated User)</label>
                <input type="text" class="form-control" name="username" value="<%=userEmail%>" required="required" readonly>
            </fieldset>

            <fieldset class="form-group">
                <label>Date of Service Reservation</label>
                <input type="date" class="form-control" name="date" required="required" min="<%=java.time.LocalDate.now()%>" onblur="validateDate(this)" oninput="validateSunday(this)">
            </fieldset>

            <script>
                function validateSunday(input) {
                    // Get the selected date from the input field
                    var selectedDate = new Date(input.value);

                    // Check if the selected date is a Sunday (day 0 in JavaScript Date object)
                    if (selectedDate.getDay() === 0) {
                        alert("Sundays are not allowed. Please select a different date.");
                        input.value = ""; // Clear the input field
                    }
                }
            </script>

            <fieldset class="form-group">
                <label>Preferred Time</label>
                <select class="form-control" name="time" required="required">
                    <option value="15:30:00">10 AM</option>
                    <option value="16:30:00">11 AM</option>
                    <option value="17:30:00">12 PM</option>
                </select>
            </fieldset>

            <fieldset class="form-group">
                <label>Preferred Location</label>
                <select class="form-control" name="location" required="required">
                    <!-- Options for locations here -->
                </select>
            </fieldset>

            <fieldset class="form-group">
                <label>Vehicle Registration Number</label>
                <input type="text" class="form-control" name="vehicle_no" required="required">
            </fieldset>

            <fieldset class="form-group">
                <label>Current Mileage</label>
                <input type="number" class="form-control" name="mileage" required="required">
            </fieldset>

            <fieldset class="form-group">
                <label>Message</label>
                <textarea class="form-control" name="message" required="required"></textarea>
            </fieldset>

            <button type="submit" class="button-submit">Save</button>
   		</form>
        </div>
    </div>
</div>
	
	

</body>
</html>