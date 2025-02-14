<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Confirmation</title>
    <!-- Bootstrap 4.3.1 CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .card-body {
            font-size: 1.2em;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        .container {
            max-width: 800px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Ticket Confirmation</h2>

    <!-- Ticket Card -->
    <div class="card shadow-sm">
        <div class="card-header text-center">
            <h4 class="card-title">Movie: ${movieName}</h4>
        </div>
        <div class="card-body">
            <p><strong>Theatre Name:</strong> ${theatreName}</p>
            <p><strong>Seat Numbers:</strong> ${seatNumbers}</p>
            <p><strong>Date:</strong> ${date}</p>
            <p><strong>Time:</strong> ${time}</p>
            <p><strong>Amount Paid:</strong> ₹${amount}</p>
            <p><strong>Customer Name:</strong> ${customerName}</p> <!-- Added Customer Name -->
        </div>
    </div>

    <!-- Print Ticket Button -->
    <div class="text-center mt-4">
        <a href="#" class="btn btn-custom btn-lg">Print Ticket</a>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
