<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${movie.name} - Seat Selection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        /* Style for seat layout */
        .seat {
            width: 40px;
            height: 40px;
            margin: 5px;
            display: inline-block;
            text-align: center;
            line-height: 40px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: transform 0.3s ease;
        }

        .seat:hover {
            transform: scale(1.1);
            background-color: #f7f7f7;
        }

        .seat.selected {
            background-color: #4CAF50;
            color: white;
        }

        .seat .price-info {
            display: none;
        }

        .seat:hover .price-info {
            display: block;
            position: absolute;
            background-color: #333;
            color: white;
            padding: 5px;
            font-size: 12px;
            border-radius: 5px;
        }

        .screen {
            width: 100%;
            height: 100px;
            background-color: #000;
            color: white;
            text-align: center;
            line-height: 100px;
            font-size: 24px;
            margin-bottom: 30px;
        }

        .seats-row {
            display: flex;
            justify-content: center;
            margin-bottom: 10px;
        }

        .seats-container {
            margin-bottom: 50px;
        }

        .container {
            margin-top: 20px;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="/user/">FindShow</a>
        </div>
    </nav>

    <div class="container my-5">
        <h2 class="text-center">${movie.name} - Select Your Seats</h2>
        <p class="text-center">Showtime: ${showtime} | Screen: ${screenType}</p>

        <div class="screen">SCREEN</div>

        <!-- Seat Selection Layout -->
        <div class="seats-container">
            <c:forEach var="row" items="${seatLayout}">
                <div class="seats-row">
                    <c:forEach var="seat" items="${row}">
                        <div class="seat" 
                             data-seat="${seat.seatNumber}" 
                             onclick="selectSeat(this)">
                            ${seat.seatNumber}
                            <span class="price-info">₹ </span>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>

        <!-- Proceed Button -->
        <div class="text-center">
            <button class="btn btn-primary" id="proceedButton" disabled onclick="proceedToPayment()">Proceed to Payment</button>
        </div>

    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2025 FindShow. All rights reserved.</p>
    </footer>

    <script>
        let selectedSeats = [];

        function selectSeat(seat) {
            const seatNumber = seat.getAttribute('data-seat');
            const seatPrice = seat.getAttribute('data-price');
            const seatType = seat.getAttribute('data-type');

            if (seat.classList.contains('selected')) {
                seat.classList.remove('selected');
                selectedSeats = selectedSeats.filter(item => item.seatNumber !== seatNumber);
            } else {
                seat.classList.add('selected');
                selectedSeats.push({ seatNumber, seatPrice, seatType });
            }

            document.getElementById("proceedButton").disabled = selectedSeats.length === 0;
        }

        function proceedToPayment() {
            // Collect selected seats information and send to the server for payment
            console.log("Proceeding with seats:", selectedSeats);
            // Here you can make an AJAX call to submit the selected seats
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
