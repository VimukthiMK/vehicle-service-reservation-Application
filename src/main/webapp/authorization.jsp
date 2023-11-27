<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.json.JSONObject" %>

<%
    String code = request.getParameter("code");
    String sessionState = request.getParameter("session_state");
    
    // Set it as a session attribute
    session.setAttribute("sessionState", sessionState); 
    
 // Define URL
    String url = "https://api.asgardeo.io/t/vmks/oauth2/token";
    String client_Id = "rMOuvvbCCKtvi5HLHqMQuC67tPUa";
    String client_secret = "F7e4wEN_Zdz4v8vWRuDVm_rtDD8T9z936QSfIY5f1xEa";
    String redirect_uri = "http://localhost:8084/vehicle-service-res-application/authorization.jsp";
    

    // Define the request body parameters
    String postData = "code=" + URLEncoder.encode(code, "UTF-8");
   
    postData += "&grant_type=authorization_code";
    postData += "&client_id=" + URLEncoder.encode(client_Id, "UTF-8");
    postData += "&client_secret=" + URLEncoder.encode(client_secret, "UTF-8");
    postData += "&redirect_uri=" + URLEncoder.encode(redirect_uri, "UTF-8");
    
    // Create a URL object and open a connection
    URL obj = new URL(url);
    HttpURLConnection con = (HttpURLConnection) obj.openConnection();

    // Set the HTTP request method to POST
    con.setRequestMethod("POST");

    // Set the request headers
    con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

    // Enable input/output streams
    con.setDoOutput(true);

    // Write the POST data to the output stream
    try (OutputStream os = con.getOutputStream()) {
        byte[] input = postData.getBytes("UTF-8");
        os.write(input, 0, input.length);
    }

    // Get the response code
    int responseCode = con.getResponseCode();

    // Read the response data
    if (responseCode == HttpURLConnection.HTTP_OK) {
        try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
            String inputLine;
            StringBuilder responseData = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                responseData.append(inputLine);
            }

            // Handle the response data here
            String responseDataStr = responseData.toString();
            
            // Parse the response data as JSON
            JSONObject jsonResponse = new JSONObject(responseDataStr);

            // Extract access_token and id_token
            String access_token = jsonResponse.getString("access_token");
            String id_token = jsonResponse.getString("id_token");

            // Store tokens in session attributes
            request.getSession().setAttribute("access_token", access_token);
            request.getSession().setAttribute("id_token", id_token);

            // Redirect to the home.jsp page
            response.sendRedirect("home.jsp");
        }
    } else {
    	// Handle errors here
        String errorMessage = "Login failed! Please check your credentials and try again.";
        // Log the error
        System.err.println("Token Exchange Error: " + responseCode);

        // Redirect to the index.jsp page with an error message parameter
        response.sendRedirect("index.jsp?error=" + URLEncoder.encode(errorMessage, "UTF-8"));
    }
%>
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>
  
</body>
</html>
    


 