<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
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
        .payment-methods label {
            font-weight: bold;
        }
    </style>
</head>
<body>
 
<div class="container mt-5">
    <h2 class="text-center mb-4">Payment Details</h2>
 
    <!-- Payment Method Selection -->
    <div class="payment-methods">
        <h4>Choose Payment Method</h4>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="creditCard" checked>
            <label class="form-check-label" for="creditCard">
                Credit/Debit Card
            </label>
        </div>
    </div>
 
    <!-- Payment Form -->
    <div class="mt-4">
        <h4>Enter Payment Details</h4>
        <form:form action="/user/ticket?amount=${amount}" method="POST">
 
            <!-- Hidden inputs to pass bookingId and amount -->
            <input type="hidden" name="bookingId" value="${bookingId}">
            <input type="hidden" name="amount" value="${amount}">
 
            <!-- Payment Method (Credit/Debit Card) -->
            <input type="hidden" name="paymentMethod" value="creditCard">
 
            <!-- Card Payment Form -->
            <div id="cardPaymentFields">
                <div class="form-group">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" class="form-control" id="cardNumber" name="cardNumber"
                           placeholder="Enter your card number" required
                           pattern="^\d{16}$"
                           title="Card number should be 16 digits">
                </div>
                <div class="form-group">
                    <label for="cardExpiry">Card Expiry Date</label>
                    <input type="text" class="form-control" id="cardExpiry" name="cardExpiry"
                           placeholder="MM/YY" required
                           pattern="^(0[1-9]|1[0-2])\/\d{2}$"
                           title="Expiry date should be in MM/YY format">
                </div>
                <div class="form-group">
                    <label for="cardCVV">CVV</label>
                    <input type="text" class="form-control" id="cardCVV" name="cardCVV"
                           placeholder="Enter CVV" required
                           pattern="^\d{3}$"
                           title="CVV should be 3 digits">
                </div>
            </div>
 
            <!-- Submit Button -->
            <button type="submit" class="btn btn-custom btn-lg btn-block mt-4">Pay ₹${amount}</button>
        </form:form>
    </div>
</div>
 
<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 
</body>
</html>