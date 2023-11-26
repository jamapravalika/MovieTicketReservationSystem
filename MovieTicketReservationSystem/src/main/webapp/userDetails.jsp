<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Model.users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Head content -->
</head>
<body>

    <div class="container">
        <h2>User Details</h2>
        <table class="table">
        <% List<users> userList = (List<users>) request.getAttribute("user");
                if (userList != null) {
                    for (users user : userList) { %>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Role</th>
                <th>Created At</th>
            </tr>
            <tr>
                <td><%= user.getUser_Id() %></td>
                <td><%= user.getUser_Name() %></td>
                <td><%= user.getUser_Email() %></td>
                <td><%= user.getUser_Mobile() %></td>
                <td><%= user.getRole() %></td>
                <td><%= user.getCreatedAt() %></td>
            </tr>
            <% } 
                } %>
        </table>
    </div>

</body>
</html>
 --%>
 <%@ page import="java.util.List" %>
<%@ page import="com.Model.users" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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

        .profile-img-container {
            text-align: center;
            position: relative;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto;
        }

        .profile-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border: 3px solid #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .upload-btn-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
            margin-top: 10px;
        }

        .btn {
            border: 2px solid gray;
            color: gray;
            background-color: white;
            padding: 8px 20px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
        }

        .upload-btn-wrapper input[type=file] {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
        }

        .user-info {
            margin-top: 20px;
            text-align: left;
        }

        .user-info p {
            margin: 10px 0;
            color: #555;
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
        <h2>User Profile</h2>
<% List<users> userList = (List<users>) request.getAttribute("user");
                if (userList != null) {
                    for (users user : userList) { %>
        <div class="profile-img-container" id="profileImgContainer">
            <img src="path/to/user-profile-image.jpg" alt="User Profile Image" id="profileImage">
        </div>

        <div class="upload-btn-wrapper" style="margin-left:40%;">
            <button class="btn">Upload a Photo</button>
            <input type="file" name="profile-photo" id="profile-photo" accept="image/*" onchange="displayImage(this)">
        </div>

        <div class="user-info">
            <p><strong>Name:</strong> <%= user.getUser_Name() %> </p>
            <p><strong>Email:</strong> <%= user.getUser_Email() %></p>
            
            <div style="display:flex;">
            <p><strong>Password:</strong> XXXXX-XXXXX</p>
            <a href="newPassword.jsp"><button style="margin-left:10%;">Change Password</button></a>
            </div>
            
            <p><strong>Mobile:</strong> <%= user.getUser_Mobile() %></p>
            <p><strong>CreatedAt:</strong> <%= user.getCreatedAt() %></p>
        </div>
<% } 
                } %>
        <div class="logout-btn">
            <a href="registration.jsp"><button>Add Another Account</button></a>
            <a href="/MovieTicketReservationSystem/edituser"><button>Edit Profile</button></a>
        </div>
    </div>

    <script>
        function logout() {
            // Add your logout functionality here
            alert("Logout button clicked. Implement your logout logic.");
        }

        function displayImage(input) {
            const preview = document.getElementById('profileImage');
            const container = document.getElementById('profileImgContainer');
            const file = input.files[0];
            const reader = new FileReader();

            reader.onload = function (e) {
                preview.src = e.target.result;
            };

            if (file) {
                reader.readAsDataURL(file);
            }
        }
    </script>

</body>
</html>
 