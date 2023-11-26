<%@ page import="java.util.List" %>
<%@ page import="com.Model.users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-container {
            margin-top: 20px;
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-container input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        .form-container button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .logout-btn {
            text-align: center;
            margin-top: 20px;
        }

        .logout-btn button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #e74c3c;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .logout-btn button:hover {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #fff;
            color: #e74c3c;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        } 
    </style>
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
