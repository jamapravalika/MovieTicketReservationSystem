<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<%@ page import="java.util.List" %>
<%@ page import="com.Model.Seats" %>
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
            <%
        List<Seats> seats = (List<Seats>) request.getAttribute("seatss");
            if (seats != null) {
            for (Seats seat : seats) {
    %>
            
            <div class="all-seats">
              <input type="checkbox" name="tickets" id="<%= seat.getSeat_Id() %>" />
                <label for="<%= seat.getSeat_Id() %>" class="<%= seat.isBooked() %>"></label>
            </div>
          <%
            }
        }
    %>      
            
          </div>
          <div class="timings">
           <div class="theatres">
              <input type="radio" name="theatre" id="th1" checked />
              <label for="th1" class="theatre">Theatre 1</label>
              <input type="radio" id="th2" name="theatre" />
              <label for="th2" class="theatre"> Theatre 2 </label>
              <input type="radio" name="theatre" id="th3" />
              <label for="th3" class="theatre"> Theatre 3 </label>
              <input type="radio" id="th4" name="theatre" />
              <label for="th4" class="theatre"> Theatre 4 </label>
            </div>
            <div class="dates">

</div>
            <div class="times">
              <input type="radio" name="time" id="t1" checked />
              <label for="t1" class="time">11:00am</label>
              <input type="radio" id="t2" name="time" />
              <label for="t2" class="time"> 2:30pm </label>
              <input type="radio" id="t3" name="time" />
              <label for="t3" class="time"> 6:00pm </label>
              <input type="radio" id="t4" name="time" />
              <label for="t4" class="time"> 9:30pm </label>
            </div>
          </div>
        </div>
        <div class="price">
          <div class="total">
            <span> <span class="count">0</span> Tickets </span>
            <div class="amount">0</div>
          </div>
          <button type="button">Book</button>
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