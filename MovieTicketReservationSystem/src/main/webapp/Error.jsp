<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Page</title>
</head>
<body>
	<h2>Error Page</h2>

    <%
        // Retrieve the exception and message from the request
        Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
        String errorMessage = (String) request.getAttribute("javax.servlet.error.message");

        // Display the error message
        out.println("<p>An error occurred: " + errorMessage + "</p>");

        // Display additional information about the exception
        if (throwable != null) {
            out.println("<p>Exception Type: " + throwable.getClass().getName() + "</p>");
            out.println("<p>Exception Message: " + throwable.getMessage() + "</p>");

            // You can add more details or handle specific exception types here
        }
    %>

    <p><a href="home.jsp">Go to Home Page</a></p>
</body>
</html>