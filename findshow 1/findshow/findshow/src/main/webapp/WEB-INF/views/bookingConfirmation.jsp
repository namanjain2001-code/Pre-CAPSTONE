<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Booking Confirmation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container my-5">
		<h3 class="text-center">Booking Confirmation</h3>
		<p class="text-center">Your seats have been successfully booked.</p>
		<h4 class="text-center">Total Cost: $${totalCost}</h4>
		<h5 class="text-center">Selected Seats:</h5>
		<ul class="list-group">
			<c:forEach var="seat" items="${selectedSeats}">
				<li class="list-group-item">${seat.seatNumber}-
					${seat.seatType} - $${seat.seatCost}</li>
			</c:forEach>
		</ul>
		<div class="text-center mt-3">
			<a href="/" class="btn btn-primary">Back to Home</a>
		</div>
	</div>
</body>
</html>
