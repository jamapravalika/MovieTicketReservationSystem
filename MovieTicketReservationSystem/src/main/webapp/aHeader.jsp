<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Admin</title>
  <link rel="stylesheet" href="adminHeader.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
     .buttons {
            text-align: center;
        }

        .btn-primary {
            display: inline-block;
            padding: 10px 70px;
            background-color: #ffffff;
            /* background: linear-gradient(90deg, rgba(244, 11, 11, 0.8), rgba(0, 0, 0, 0.8) 87.19%); */
            color: #a10303c9;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-primary:hover {
          background-color: #ffffff;
          color: rgb(24, 26, 20);
        }
            .dropdown-menu {
    background-color: #a43014;
  }

  .dropdown-item {
    color: #fff;
    transition: 0.3s;
    padding: 7px;
  }

  .dropdown-item:hover {
    background-color: #fff;
    color: #a43014;
    border-radius: 100px;
    padding: 9px;
  }
  a {
      text-decoration: none;
    }
    .dropdown-menu {
      background-color: #a43014;
    }

   

    .card {
      background-color: #a43014;
      color: #fff;
    }

    .card.a:hover {
      color: #a43014;
    }


  .card {
    background-color: #a43014;
    color: #fff;
  }

  .card.a:hover {
    color: #a43014;
  }
  
  </style>
</head>

<body id="body-pd">
  <header class="header" id="header">
    <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
    <div class="header_img"> <img src="https://i.imgur.com/hczKIze.jpg" alt=""> </div>
  </header>
  <div class="l-navbar" id="nav-bar">
    <nav class="nav">
      <div>
        <a href="#" class="nav_logo">
            <i class="fa-solid fa-user-tie fa-lg nav_icon" style="color: rgb(12, 12, 12);"></i>
          <span class="nav_logo-name"><h4 style="margin-top: 30%; margin-left: 30%;"><bold style="color: black;">Admin</bold></h4></span>
        </a>
        <div class="nav_list">
          <a href="adminHome.jsp" class="nav_link active"> <i class='fas fa-home nav_icon'></i> <span class="nav_name">Dashboard</span> </a>
          <a href="AddMovies.jsp" class="nav_link"> <i class='fas fa-film nav_icon'></i> <span class="nav_name">Add Movies</span> </a>
          <a href="theater.jsp" class="nav_link"> <i class='fas fa-building nav_icon'></i> <span class="nav_name">Add Theaters</span></a>
          <a href="addShowtiming.jsp" class="nav_link"> <i class='fas fa-clock nav_icon'></i> <span class="nav_name">Add ShowTimings</span></a>
          <a href="/MovieTicketReservation/UserTable" class="nav_link"> <i class='fas fa-users nav_icon'></i> <span class="nav_name">Users</span></a>
          <a href="/MovieTicketReservation/Booking" class="nav_link"> <i class='bx bx-cart nav_icon'></i> <span class="nav_name">Bookings</span></a>

          <a href="#" class="nav_link" role="button" data-bs-toggle="collapse" data-bs-target="#collapseView" aria-expanded="false" aria-controls="collapseView">
            <i class="fa-solid fa-eye"></i>
            <span class="nav_name">Manage  <i class="fa-solid fa-caret-down" style="margin-left: 65px;"></i></span>
          </a>
          <div class="collapse" id="collapseView">
            <div class="card card-body">
              <a class="dropdown-item" href="/MovieTicketReservation/viewmovies"><i class="fa-solid fa-clapperboard fa-spin" style="margin-right: 8%; margin-left: 1%;"></i> Movies</a>
              <a class="dropdown-item" href="/MovieTicketReservation/viewTheater"><i class="fa-solid fa-masks-theater fa-spin" style="margin-right: 8%; margin-left: 1%;"></i> Theaters</a>
              <a class="dropdown-item" href="/MovieTicketReservation/AddShowServlet"><i class="fa-sharp fa-regular fa-clock fa-spin" style="margin-right: 8%; margin-left: 1%;"></i> Show Timings</a>
            </div>
          </div>
          <!-- <a href="#" class="nav_link"> <i class='bx bx-bar-chart-alt-2 nav_icon'></i> <span class="nav_name">Stats</span> </a> -->
        </div>
      </div>
      <a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
    </nav>
  </div>



  </div>
  
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", function (event) {
      const showNavbar = (toggleId, navId, bodyId, headerId) => {
        const toggle = document.getElementById(toggleId),
          nav = document.getElementById(navId),
          bodypd = document.getElementById(bodyId),
          headerpd = document.getElementById(headerId);

        if (toggle && nav && bodypd && headerpd) {
          toggle.addEventListener('click', () => {
            nav.classList.toggle('show');
            toggle.classList.toggle('bx-x');
            bodypd.classList.toggle('body-pd');
            headerpd.classList.toggle('body-pd');
          });
        }
      };

      showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header');

      const linkColor = document.querySelectorAll('.nav_link');

      function colorLink() {
        linkColor.forEach(l => l.classList.remove('active'));
        this.classList.add('active');
      }

      linkColor.forEach(l => l.addEventListener('click', colorLink));
    });
  </script>
</body>

</html>
