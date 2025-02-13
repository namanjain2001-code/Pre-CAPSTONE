<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${movie.name}-ShowTimings</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <!-- Logo -->
      <a class="navbar-brand" href="/user/">FindShow</a>

      <!-- Navbar Toggle Button for Mobile -->
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Navbar Links -->
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <!-- Search Bar on the Left -->
          <form class="d-flex me-auto" role="search">
            <input class="form-control me-2" type="search" placeholder="Search for movies..." aria-label="Search">
            <button class="btn btn-outline-light" type="submit">Search</button>
          </form>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container my-5">
    <h2 class="text-center">${movie.name}-ShowTimings</h2>
    <p class="text-center">Select your showtime</p>

    <!-- Date Picker Section -->
    <div class="mb-4">
      <label for="showDate" class="form-label">Select Date</label>
      <input type="date" id="showDate" class="form-control" min="" max="" onchange="updateShowtimes()">
    </div>

    <div class="row" id="theaterCards">
      <c:forEach var="theater" items="${theaters}">
        <div class="col-md-4">
          <div class="card mb-4">
            <div class="card-body">
              <h5 class="card-title">${theater.name}</h5>
              <p>${theater.location}</p>
              <div class="d-flex flex-wrap">
                <c:forEach var="showtime" items="${theater.showtimes}">
                  <c:set var="time" value="${showtime['time']}" />
                  <c:set var="screenType" value="${showtime['screenType']}" />
                  <a href="/user/seatSelection?theater=${theater.name}&movie=${movie.name}&showtime=${time}&screenNumber=${screenNumber}"
                    class="btn btn-secondary me-2 mb-2">
                    <div class="d-flex flex-column align-items-center">
                      <span>${time}</span> <small class="text-muted">${screenType}</small>
                      <small class="text-muted" style="font-style: italic;">Optional</small>
                    </div>
                  </a>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

  <footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025 FindShow. All rights reserved.</p>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    // Function to update the date picker limits and set the default date
    function updateDatePickerLimits() {
      const today = new Date();
      const minDate = today.toISOString().split('T')[0]; // YYYY-MM-DD format
      const maxDate = new Date();
      maxDate.setDate(today.getDate() + 2); // Set max date to 2 days from today
      const maxDateStr = maxDate.toISOString().split('T')[0]; // YYYY-MM-DD format

      // Set the min and max date for the date picker
      document.getElementById("showDate").setAttribute("min", minDate);
      document.getElementById("showDate").setAttribute("max", maxDateStr);

      // Set the current date as the default value
      document.getElementById("showDate").value = minDate;
    }

    // Function to update the showtimes when the date is changed
    function updateShowtimes() {
      const selectedDate = document.getElementById("showDate").value;
      console.log("Selected Date: " + selectedDate); // You can use this value for filtering showtimes
      // In your backend, you can use this date to filter and display the available showtimes.
    }

    // Initialize the date picker on page load
    window.onload = function () {
      updateDatePickerLimits(); // Set date limits and default value
    }
  </script>
</body>

</html>
