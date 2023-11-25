<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/banner2.css">
    <title>Movie Ticket Reservation</title>
</head>
<body>
    <div class="role-selection">
        <label for="role">Select Role:</label>
        <select id="role" name="role">
            <option value="admin">Admin</option>
            <option value="user">User</option>
        </select>
    </div>
    <div class="banner">
        <div class="banner-content">
            <h1>Discover the World of Cinema</h1>
            <p>Experience the thrill of the silver screen like never before.</p>
            <a href="#" class="cta-button" id="bookButton">Book Your Seats</a>
            <br>
            <div class="creative-text">
                Get ready for a cinematic journey that will leave you spellbound!
            </div>
        </div>
    </div>
    
    <script>
        document.getElementById("bookButton").addEventListener("click", function () {
            var role = document.getElementById("role").value;
            if (role === "admin") {
                window.location.href = "adminHome.jsp"; 
            } else if (role === "user") {
                window.location.href = "login.jsp"; 
            }
        });
    </script>
</body>
</html>
