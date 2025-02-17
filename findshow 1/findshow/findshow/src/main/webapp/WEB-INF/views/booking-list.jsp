<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Bookings</title>
<style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
 
        h2 {
            text-align: center;
            margin-top: 30px;
            font-size: 32px;
            color: #333;
        }
 
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
 
        .add-booking-btn {
            display: inline-block;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 16px;
        }
 
        .add-booking-btn:hover {
            background-color: #218838;
        }
 
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
 
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
 
        th {
            background-color: #007bff;
            color: white;
            font-size: 18px;
        }
 
        td {
            font-size: 16px;
            color: #333;
        }
 
        /* Button styles */
        .btn-view {
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #ffc107;
            color: white;
            font-size: 14px;
        }
 
        .btn-view:hover {
            background-color: #e0a800;
        }
 
        .btn-cancel {
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #dc3545;
            color: white;
            font-size: 14px;
        }
 
        .btn-cancel:hover {
            background-color: #c82333;
        }
 
        /* Confirmation button styles */
        .confirm-btn {
            color: white;
            background-color: red;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            font-size: 14px;
        }
 
        .confirm-btn:hover {
            background-color: darkred;
        }
 
        /* Responsive styling for smaller screens */
        @media screen and (max-width: 768px) {
            .container {
                width: 95%;
                padding: 10px;
            }
 
            table {
                font-size: 14px;
            }
 
            th, td {
                padding: 8px;
            }
        }
</style>
</head>
<body>
<h2>All Bookings</h2>
<table>
<thead>
<tr>
<th>Booking ID</th>
<th>Status</th>
<th>Seats</th>

</tr>
</thead>
<tbody>
<c:forEach var="booking" items="${bookings}">
<tr>
<td>${booking.bookingId}</td>
<td>${booking.status}</td>
<td>
<c:forEach var="seat" items="${booking.seats}">
                            ${seat.seatId}
</c:forEach>
</td>

</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>
