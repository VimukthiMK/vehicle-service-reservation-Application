
# Vehicle Service Reservation Application

A secure app for reserving vehicle services developed using JSP and integrated witt cloud-based IDP WSO2 Asgardeo.

## Overview
This web application not only streamlines the reservation process but also emphasizes security by addressing common vulnerabilities outlined in the OWASP Top 10. Furthermore, user authentication and access control are implemented using OIDC protocols in collaboration with the cloud-based Identity Provider (IDP) Asgardeo. Delve into this repository to discover techniques for fortifying your web applications against prevalent vulnerabilities and to deepen your comprehension of web application security.


## Technologies Used

- **JSP**: JavaServer Pages for developing the web application.
- **MySQL**: Database Management System for storing and retrieving data.
- **Apache Tomcat**: Version 9 is used for running the application on the server.
- **Cloud-based IDP**: WSO2 ASGARDEO with OIDC protocol for secure user authentication.
- **IDE**: Eclipse IDE for development.

## Getting Started

Follow these steps to set up and run the Vehicle Service Reservation Application:

<ol>
    <li> Clone the repository to your local machine:</li>
    <pre><code>git clone https://github.com/VimukthiMK/vehicle-service-reservation-Application.git</code></pre>
    <li>Import Project in Eclipse IDE:</li>
      <pre>Open Eclipse IDE and import the project.</pre>
    <li>Configure Database:</li>
    <pre><code>	private String jdbcURL = "jdbc:mysql://your_database_host:your_database_port/your_database_name?useSSL=false";
    private String jdbcUsername = "your_database_username";
    private String jdbcPassword = "your_database_password";
    private String jdbcDriver = "com.mysql.cj.jdbc.Driver"; </code></pre>
    <li>Integrate with Asgardeo:</li>
    <pre>Configure the application to use Asgardeo for secure user authentication.</pre>
    <li>Run on Tomcat Server:</li>
    <pre>Deploy the application on Apache Tomcat server.</pre>
    

## Features

- **Reservation Management**: Streamline the process of making and managing vehicle service reservations.
- **Security Measures**: Address common vulnerabilities listed in OWASP Top 10 to enhance the security of your application.
- **OIDC Authentication**: Implement user authentication and access control using OIDC protocols with Asgardeo.

<br>
<br>

If you would like additional information or guidance regarding settings, please <a href="https://medium.com/@vimukthikulathilaka/vehicle-service-reservations-application-a-guide-to-building-a-secure-web-application-integrated-070c0af4d3de"> Visit My Blog Article Now.....</a> 



