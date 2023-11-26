<%@ page import="java.util.List" %>
<%@ page import="com.Model.users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="assets/css/userdisplay.css">
</head>
<body>

    <div class="container">
        <h2>Edit Profile</h2>

        <div class="form-container">
            <form action="edituser" method="post">
             	<% 
                    users user = (users)request.getAttribute("user");
                    if (user != null) {
                %>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= user.getUser_Name() %>" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= user.getUser_Email() %>" required>

                <label for="mobile">Mobile:</label>
                <input type="tel" id="mobile" name="mobile" value="<%= user.getUser_Mobile() %>" required>

                <% } %>
				<div class="logout-btn">
                	<button type="submit">Update Profile</button>
                	<a href="profile.jsp"><button>Back to Profile</button></a>
                </div>
            </form>
        </div>
        
    </div>

</body>
</html>
