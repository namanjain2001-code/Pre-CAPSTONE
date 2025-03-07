<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${movie.movieName}-ShowTimings</title>
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
	  					<form action="/user/searchMovie" method="get">
	  						<input type="text" name="movieName"
	  							placeholder="Search for movies..." required />
	  						<button type="submit">Search</button>
	  					</form>
	   
	  				</ul>
	  			</div>
  </nav>

  <div class="container my-5">
    <h2 class="text-center">${movie.movieName}-ShowTimings</h2>
    <p class="text-center">Select your showtime</p>

    <div class="row" id="theaterCards">
      <c:forEach var="theater" items="${allShows}">
        <div class="col-md-4">
          <div class="card mb-4">
            <div class="card-body">
              <h5 class="card-title">${theater.theatreName}</h5>
              <p>${theater.theatreLocation}</p>
              <div class="d-flex flex-wrap">
                <c:forEach var="screen" items="${theater.screens}">
                  <c:forEach var="show" items="${screen.shows}">
                    <c:set var="time" value="${show.showTime}" />
                    <c:set var="screenType" value="${screen.screenType}" />
                    <a
                      href="/user/seatSelection?theater=${theater.theatreName}&screen=${screen.screenNumber}&show=${show.showId}"
                      class="btn btn-secondary me-2 mb-2">
                      <div class="d-flex flex-column align-items-center">
                        <span>${time}</span>
                        <small class="text-muted">${screenType}</small>
                        <small class="text-muted" style="font-style: italic;">Screen ${screen.screenNumber}</small>
                      </div>
                    </a>
                  </c:forEach>
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
