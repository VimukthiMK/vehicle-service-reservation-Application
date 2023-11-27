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
<title>Insert title here</title>
</head>
<body>
		
	
		<header>
		 <div>
		<nav class="navbar">
			
			<div class="nav-hd">
				<a href="home.jsp" class="navbar-head"> Vehicle Service Reservation </a>
			</div>
			
			<div class="nav-el" id="nav-el">
				<a href="<%=request.getContextPath()%>/new"
					class="nav-link">New Reservation</a>
			</div>
			<div class="nav-el" id="nav-el">
				<form id="logout-form" action="https://api.asgardeo.io/t/vmks/oidc/logout" method="POST">
				    <input type="hidden" id="client-id" name="client_id" value="<%= client_id %>">
				    <input type="hidden" id="post-logout-redirect-uri" name="post_logout_redirect_uri" value="<%= post_logout_redirect_uri %>">
				    <input type="hidden" id="state" name="state" value="<%= sessionState %>">
				    <button id="logout-btn" type="submit">Logout</button>
				</form>
			</div>
			
		</nav>
		</div>
	</header>

</body>
</html>