<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.sql.*, java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
        
        String access_token = (String) request.getSession().getAttribute("access_token");
        String id_token = (String) request.getSession().getAttribute("id_token");
        
     // retriving session state from session attributes
        String sessionState = (String) session.getAttribute("sessionState"); 
        
        String jsonDataString = ""; // Initialize jsonDataString 


        // Check if the tokens exist in the session
         if (access_token != null && id_token != null) {
        	    String apiUrl = "https://api.asgardeo.io/t/vmks/oauth2/userinfo";

        try {
            // Create a URL object
            URL url = new URL(apiUrl);

            // Open a connection to the URL
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Set the request method to GET
            connection.setRequestMethod("GET");

            // Set the "Authorization" header with the Bearer token
            connection.setRequestProperty("Authorization", "Bearer " + access_token);

            // Get the response code
            int responseCode = connection.getResponseCode();

            // Check if the response code indicates success (HTTP 200 OK)
            if (responseCode == HttpURLConnection.HTTP_OK) {
                // Create a BufferedReader to read the response
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder responseStringBuilder = new StringBuilder();

                // Read the response line by line
                while ((inputLine = in.readLine()) != null) {
                    responseStringBuilder.append(inputLine);
                }
                in.close();

                // Parse the JSON response
                JSONObject jsonResponse = new JSONObject(responseStringBuilder.toString());
					//out.println(jsonResponse);
                // Retrieve user information
                String given_name = jsonResponse.getString("given_name");
                //String family_name = jsonResponse.getString("family_name");
                String country = jsonResponse.getString("country");
                String phone_number = jsonResponse.getString("phone_number");
                String email = jsonResponse.getString("email");

             // Store the email in a session attribute
                session.setAttribute("userEmail", email);
             
             
             
             // Implement logout
                String introUrl = "https://api.asgardeo.io/t/vmks/oauth2/introspect";
        		String post_logout_redirect_uri = "http://localhost:8084/vehicle-service-res-application/index.jsp"; // changed
        		String client_id = "GjPSNuCiJ0YkoPHq3LE0YixheXEa";
             
             	
              
               %>
			 <script>
			 document.addEventListener("DOMContentLoaded", function() {
				    
				  	
				  	var first_name = '<%=given_name%>';
				  	var coun_try = '<%=country %>';
				    var phone_num = '<%=phone_number%>';
				    var e_mail = '<%=email%>';
		
				  
				    // Use JavaScript variables to update HTML elements
				    document.getElementById("fName").textContent =  first_name;
				    document.getElementById("country").textContent =  coun_try;
				    document.getElementById("phone_no").textContent =  phone_num;
				    document.getElementById("email").textContent =  e_mail;
				});
			</script>
          <%       
            } else {
                // Handle error response
                out.println("HTTP Error: " + responseCode);
            }

            // Closing the connection
            connection.disconnect();
        } catch (IOException e) {
            
            e.printStackTrace();
        }
    } else {
        // Handle the case when either accessToken or idToken is null
        %>
    	<script>
			alert("Access token is missing");
		</script>
		<% 
    }
    %>

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