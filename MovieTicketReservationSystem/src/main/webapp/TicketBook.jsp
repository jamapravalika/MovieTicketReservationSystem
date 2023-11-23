<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Ticket Book</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Round|Material+Icons+Sharp|Material+Icons+Two+Tone" rel="stylesheet"/>
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
	<link rel="stylesheet" href="assets/css/Ticket.css">
</head>
<body>
    <div class="center">
      <div class="tickets">
        <div class="ticket-selector">
          <div class="seats">
            <div class="status">
              <div class="item">Available</div>
              <div class="item">Booked</div>
              <div class="item">Selected</div>
            </div>
            <div class="all-seats">
              <input type="checkbox" name="tickets" id="s1" />
              <label for="s1" class="seat booked"></label>
            </div>
          </div>
          <div class="timings">
            <div class="dates">
              <input type="radio" name="date" id="d1" checked />
              <label for="d1" class="dates-item">
                <div class="day">Sun</div>
                <div class="date">5</div>
              </label>
              <input type="radio" id="d2" name="date" />
              <label class="dates-item" for="d2">
                <div class="day">Mon</div>
                <div class="date">6</div>
              </label>
              <input type="radio" id="d3" name="date" />
              <label class="dates-item" for="d3">
                <div class="day">Tue</div>
                <div class="date">7</div>
              </label>
              <input type="radio" id="d4" name="date" />
              <label class="dates-item" for="d4">
                <div class="day">Wed</div>
                <div class="date">8</div>
              </label>
              <input type="radio" id="d5" name="date" />
              <label class="dates-item" for="d5">
                <div class="day">Thu</div>
                <div class="date">9</div>
              </label>
              <input type="radio" id="d6" name="date" />
              <label class="dates-item" for="d6">
                <div class="day">Fri</div>
                <div class="date">10</div>
              </label>
              <input type="radio" id="d7" name="date" />
              <label class="dates-item" for="d7">
                <div class="day">Sat</div>
                <div class="date">11</div>
              </label>
            </div>
            
          </div>
        </div>
        <div class="price">
          <div class="total">
            <span> <span class="count">0</span> Tickets </span>
            <div class="amount">0</div>
          </div>
          <a href="/MovieTicketReservationSystem/ticket"><button type="button">Book</button></a>
        </div>
      </div>
    </div>
<script>
      let seats = document.querySelector(".all-seats");
      for (var i = 0; i < 59; i++) {
        let randint = Math.floor(Math.random() * 2);
        let booked = randint === 1 ? "booked" : "";
        seats.insertAdjacentHTML(
          "beforeend",
          '<input type="checkbox" name="tickets" id="s' +
            (i + 2) +
            '" /><label for="s' +
            (i + 2) +
            '" class="seat ' +
            booked +
            '"></label>'
        );
      }
      let tickets = seats.querySelectorAll("input");
      tickets.forEach((ticket) => {
        ticket.addEventListener("change", () => {
          let amount = document.querySelector(".amount").innerHTML;
          let count = document.querySelector(".count").innerHTML;
          amount = Number(amount);
          count = Number(count);
          if (ticket.checked) {
            count += 1;
            amount += 200;
          } else {
            count -= 1;
            amount -= 200;
          }
          document.querySelector(".amount").innerHTML = amount;
          document.querySelector(".count").innerHTML = count;
        });
      });
    </script>

    <%@ include file="footer.html" %>
</body>
</html>