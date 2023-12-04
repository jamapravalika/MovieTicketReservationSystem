<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('movie_background.jpg');
            background-size: cover;
            background-position: center;
            color: #fff;
            font-family: 'Arial', sans-serif;
            overflow: hidden;
        }

        .error-container {
            text-align: center;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            width: 300px;
            max-width: 80%;
        }

        h1 {
            font-size: 4em;
            margin: 0;
        }

        p {
            font-size: 1.2em;
        }

        #movie-reel {
            width: 100px;
            height: 100px;
            margin-top: 20px;
            animation: rotate 2s linear infinite;
        }

        @keyframes rotate {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Oops!</h1>
        <p>Something went wrong. Don't worry, our team is working on it.</p>
        <img src="assets/images/film1.png" alt="Movie Reel" id="movie-reel">
        <p>Meanwhile, enjoy some popcorn and try again later.</p>
        <a href="Home.jsp"><p>GoBack To Home Page</p></a>
    </div>
</body>
</html>
