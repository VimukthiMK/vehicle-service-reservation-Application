<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title> Login</title>
	<link href="CSS/index.css" rel="stylesheet" type="text/css">
</head>

<body>
		
	<div class="header_container">
	 <h1>Vehicle Service Reservation</h1> 
	</div>

	<div class="body_container"> 
		<p>Please Log in to proceed...</p>
		
		<div class="button_container">
	 			<button id="btn-login" class="btn-login"
    onclick="window.location.href='https://api.asgardeo.io/t/vmks/oauth2/authorize'
        + '?response_type=code'
        + '&client_id=rMOuvvbCCKtvi5HLHqMQuC67tPUa'
        + '&scope=openid%20email%20phone%20profile'
        + '&redirect_uri=http%3A%2F%2Flocalhost%3A8084%2Fvehicle-service-res-application%2Fauthorization.jsp'">
    <span class="btn-text">Login</span>
    <div class="fill-container"></div>
</button>
		</div>	
		<%-- Display error message if present --%>
        <% String errorMessage = request.getParameter("error");
           if (errorMessage != null && !errorMessage.isEmpty()) { %>
            <div class="error-message">
                <%= errorMessage %>
            </div>
        <% } %>	
</div>
</body>
</html>