<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="assets/css/userdisplay.css">
</head>
<body>

    <div class="container">
    
        <h2>User Profile</h2>
        
<% List<users> userList = (List<users>) request.getAttribute("user");
                if (userList != null) {
                    for (users user : userList) { %>
       

        <div class="user-info">
        	<p><strong>ID:</strong> 225335<%= user.getUser_Id() %> </p>
            <p><strong>Name:</strong> <%= user.getUser_Name() %> </p>
            <p><strong>Email:</strong> <%= user.getUser_Email() %></p>
            
            <div style="display:flex;">
            <p><strong>Password:</strong> XXXXX-XXXXX</p>
            <br>
            
            <a href="newPassword.jsp" class="change-password-btn">Change Password</a>
            </div>
            
            <p><strong>Mobile:</strong> <%= user.getUser_Mobile() %></p>
            <p><strong>CreatedAt:</strong> <%= user.getCreatedAt() %></p>
        </div>
<% } 
                } %>
        <div class="logout-btn">
            <a href="registration.jsp"><button>Add Another Account</button></a>
            <a href="/MovieTicketReservation/edituser"><button>Edit Profile</button></a>
        </div>
    </div>
</body>
</html>
 