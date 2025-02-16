<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notification List</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 50px 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
        }
        .accordion-button {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%; /* Ensure the button takes full width */
        }
        .notification-time {
            font-size: 0.85rem;
            color: gray;
            margin-left: 40rem; /* Push to the right */
        }
        .accordion-body {
            font-size: 1rem;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Notifications</h2>

    <div class="accordion" id="notificationAccordion">
        <!-- Loop over notifications passed from the backend -->
        <c:forEach var="notification" items="${notifications}">
            <div class="accordion-item">
                <h2 class="accordion-header" id="heading${notification.notificationId}">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${notification.notificationId}" aria-expanded="true" aria-controls="collapse${notification.notificationId}">
                        ${notification.title} 
                        <span class="notification-time">${notification.getToday()} ${notification.getNow()}</span>
                    </button>
                </h2>
                <div id="collapse${notification.notificationId}" class="accordion-collapse collapse" aria-labelledby="heading${notification.notificationId}" data-bs-parent="#notificationAccordion">
                    <div class="accordion-body">
                        <strong>Message:</strong> ${notification.message}
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
