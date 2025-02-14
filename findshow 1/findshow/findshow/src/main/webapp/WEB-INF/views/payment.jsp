<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <div class="form-check">
            <input class="form-check-input" type="radio" name="paymentMethod" id="upi" value="upi">
            <label class="form-check-label" for="upi">
                UPI
            </label>
        </div>
    </div>

    <!-- Payment Form -->
    <div class="mt-4">
        <h4>Enter Payment Details</h4>
        <form action="/ticket" method="GET">
            
            <!-- Card Payment Form (Credit/Debit Card) -->
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

            <!-- UPI Payment Form -->
            <div id="upiPaymentFields" style="display: none;">
                <div class="form-group">
                    <label for="upiID">UPI ID</label>
                    <input type="text" class="form-control" id="upiID" name="upiID" 
                           placeholder="Enter your UPI ID" required 
                           pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" 
                           title="UPI ID should be in the format 'example@upi'">
                </div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-custom btn-lg btn-block mt-4">Pay ₹${amount}</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- JavaScript to Toggle Payment Forms Based on Selection -->
<script>
    // Event listener for payment method selection
    document.querySelectorAll('input[name="paymentMethod"]').forEach(function(paymentMethodRadio) {
        paymentMethodRadio.addEventListener('change', function() {
            var cardFields = document.getElementById('cardPaymentFields');
            var upiFields = document.getElementById('upiPaymentFields');
            
            if (this.value === 'creditCard') {
                cardFields.style.display = 'block';  // Show card payment fields
                upiFields.style.display = 'none';   // Hide UPI payment fields
            } else if (this.value === 'upi') {
                cardFields.style.display = 'none';  // Hide card payment fields
                upiFields.style.display = 'block';  // Show UPI payment fields
            }
        });
    });

    // Trigger initial display state
    document.querySelector('input[name="paymentMethod"]:checked').dispatchEvent(new Event('change'));
</script>

</body>
</html>

