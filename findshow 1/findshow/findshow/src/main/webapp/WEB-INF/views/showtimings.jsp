<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${movie.movieName}-ShowTimings</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <script>
  	// Function to update the showtimes when the date is changed
  	function updateShowtimes() {
  	  const selectedDate = document.getElementById("showDate").value;  // Get the selected date from the date picker

  	  if (!selectedDate) {
  	    console.error("Please select a valid date");
  	    return; // If no date is selected, don't proceed with fetching
  	  }

  	  // If date is selected, proceed to fetch showtimes
  	  fetchShows(selectedDate);  // Pass the selected date to fetchShows function
  	}


  	function fetchShows(date) {

  	  // Function to extract movieId from the current URL
  	  function getMovieIdFromUrl() {
  	    const pathname = window.location.pathname;
  	    const regex = /\/user\/showtimings\/(\d+)/;  // Match "/user/showtimings/" followed by digits (movieId)
  	    const match = pathname.match(regex);
  	    
  	    if (match && match[1]) {
  	      return match[1];  // movieId
  	    } else {
  	      console.error("movieId not found in the current URL");
  	      return null;
  	    }
  	  }

  	  const movieId = getMovieIdFromUrl();
  		let temp=new Date(date);
  		let showDate=temp.toISOString().split('T')[0];
  	
  	  if (movieId) {
		let apiUrl=`user/api/theatres?movieId=${movieId}&date=`+showDate;

  		fetch(apiUrl)
  	      .then(response => response.json())
  	      .then(data => {
			console.log(data);
  	        // Dynamically create the HTML for the theater, screens, and showtimes
  	        const theaterCards = document.getElementById("theaterCards");
  	        theaterCards.innerHTML = ''; // Clear current list

  	        // Loop through theaters and screens to create cards dynamically
  	        for (const [theater, screens] of Object.entries(data)) {
  	          const card = document.createElement("div");
  	          card.classList.add("col-md-4");
  	          card.classList.add("mb-4");

  	          // Display theater name and location
  	          card.innerHTML = `
  	              <div class="card">
  	                  <div class="card-body">
  	                      <h5 class="card-title">${theater.theatreName}</h5>
  	                      <p>Location: ${screens}</p>
  	                      <div class="d-flex flex-wrap">
  	          `;

  	          // Loop through screens for this theater
  	          for (const [screen, showtimes] of Object.entries(screens)) {
  	            card.innerHTML += `
  	                <h6>${screen}</h6>
  	                <div class="d-flex flex-wrap">
  	            `;

  	            // Loop through the showtimes for this screen
  	            showtimes.forEach(show => {
  	              card.innerHTML += `
  	                  <a href="/user/seatSelection?theater=${theater}&screen=${screen}&showtime=${show.time}&movie=${show.movie}"
  	                     class="btn btn-secondary me-2 mb-2">
  	                      <div class="d-flex flex-column align-items-center">
  	                          <span>${show.time}</span> <small class="text-muted">${show.movie}</small>
  	                      </div>
  	                  </a>
  	              `;
  	            });

  	            card.innerHTML += `</div>`; // Close screen div
  	          }

  	          card.innerHTML += `</div></div></div>`; // Close card and container
  	          theaterCards.appendChild(card);
  	        }
  	      })
  	      .catch(error => {
  	        console.error("Error fetching theaters:", error);
  	      });
  	  }
  	}

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
  	window.onload = function () {
  	      updateDatePickerLimits(); // Set date limits and default value
  		  updateShowtimes();
  	    }
    </script>
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
    <h2 class="text-center">${movie.movieName}-ShowTimings</h2>
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
                  <a href="/user/seatSelection?theater=${theater.name}&movie=${movie.movieName}&showtime=${time}&screenNumber=${screenNumber}"
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

  

</body>

</html>
