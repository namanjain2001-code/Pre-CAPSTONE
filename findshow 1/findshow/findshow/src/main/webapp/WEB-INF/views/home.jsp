<%@ taglib prefix="c" uri="jakarta.tags.core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Show</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- <link rel="stylesheet" href="/css/home.css"> -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css" />
 
</head>
<body>
 
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="/user/">FindShow</a>
	 
			<!-- Navbar Toggle Button for Mobile -->
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
	 
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					
						
						<form action="/user/searchMovie" method="get">
							<input type="text" name="movieName"
								placeholder="Search for movies..." required />
							<button type="submit">Search</button>
						</form>
						
						<li class="nav-item">
						                <a class="nav-link" href="/user/notifications">
						                    <i class="bi bi-bell" style="font-size: 1.5rem;"></i>
						                    <span class="badge badge-danger" style="position: absolute; top: 0; right: 0; font-size: 0.8rem;">5</span>
						                </a>
						 </li>
					</ul>
					<div class="nav-item">
					    <button class="btn btn-secondary ml-3" onclick="window.location.href='/user/bookings';">My Bookings</button>
					</div>
			
			</div>
		</nav>
 
 
	<!-- Hero Section -->
	<section class="hero py-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-2">
					<img src="/images/bg2.png" class="img-fluid" alt="Left Image">
				</div>
				<div class="col-md-6 text-center">
					<h1 class="display-4">Book Your Movie Tickets Online</h1>
					<p class="lead">Find your favorite movies and book tickets in
						just a few clicks!</p>
					<a href="#languageTabContent" class="btn btn-secondary btn-lg">Browse
						Movies</a>
				</div>
				<div class="col-md-4">
					<img src="/images/bg1.png" class="custom-image img-fluid w-100"
						alt="Right Image">
				</div>
			</div>
		</div>
	</section>
 
 
	<section id="language-tabs">
		<div class="container my-5">
			<!-- Language Tabs -->
			<ul class="nav nav-pills justify-content-center" id="languageTab"
				role="tablist">
				<li class="nav-item" role="presentation"><a
					class="nav-link active" id="hindi-tab" data-toggle="pill"
					href="#hindi" role="tab" aria-controls="hindi" aria-selected="true">Hindi</a>
				</li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="english-tab" data-toggle="pill" href="#english" role="tab"
					aria-controls="english" aria-selected="false">English</a></li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="telugu-tab" data-toggle="pill" href="#telugu" role="tab"
					aria-controls="telugu" aria-selected="false">Telugu</a></li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="tamil-tab" data-toggle="pill" href="#tamil" role="tab"
					aria-controls="tamil" aria-selected="false">Tamil</a></li>
			</ul>
 
			<!-- Tab Content -->
			<div class="tab-content mt-3" id="languageTabContent">
				<div class="tab-pane fade show active" id="hindi" role="tabpanel"
					aria-labelledby="hindi-tab">
					<h3 class="text-center">Latest Releases</h3>
					<div class="row" id="hindi-movies">
						<!-- Movie Cards for Hindi -->
						<c:forEach var="movie" items="${movies}">
							<c:if test="${movie.movieLanguages == 'Hindi'}">
								<div class="col-md-3 movie-card" data-language="Hindi">
									<div class="card">
										<img class="card-img-top" src="${movie.movieThumbnail}"
											alt="${movie.movieName}">
										<div class="card-body">
											<h5 class="card-title">${movie.movieName}</h5>
											<p class="card-text">Genre: ${movie.movieGenres}</p>
											<p class="card-text">Rating: ${movie.movieRated}</p>
											<a href="/user/movies/${movie.movieId}"
												class="btn btn-primary">View Details</a>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
 
				<!-- Repeat the same structure for other languages -->
				<div class="tab-pane fade" id="english" role="tabpanel"
					aria-labelledby="english-tab">
					<h3 class="text-center">Latest Releases</h3>
					<div class="row" id="english-movies">
						<!-- Movie Cards for English -->
						<c:forEach var="movie" items="${movies}">
							<c:if test="${movie.movieLanguages == 'English'}">
								<div class="col-md-3 movie-card" data-language="English">
									<div class="card">
										<img class="card-img-top" src="${movie.movieThumbnail}"
											alt="${movie.movieName}">
										<div class="card-body">
											<h5 class="card-title">${movie.movieName}</h5>
											<p class="card-text">Genre: ${movie.movieGenres}</p>
											<p class="card-text">Rating: ${movie.movieRated}</p>
											<a href="/user/movies/${movie.movieId}"
												class="btn btn-primary">View Details</a>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
 
				<!-- Repeat the same structure for Telugu and Tamil -->
				<div class="tab-pane fade" id="telugu" role="tabpanel"
					aria-labelledby="telugu-tab">
					<h3 class="text-center">Latest Releases</h3>
					<div class="row" id="telugu-movies">
						<c:forEach var="movie" items="${movies}">
							<c:if test="${movie.movieLanguages == 'Telugu'}">
								<div class="col-md-3 movie-card" data-language="Telugu">
									<div class="card">
										<img class="card-img-top" src="${movie.movieThumbnail}"
											alt="${movie.movieName}">
										<div class="card-body">
											<h5 class="card-title">${movie.movieName}</h5>
											<p class="card-text">Genre: ${movie.movieGenres}</p>
											<p class="card-text">Rating: ${movie.movieRated}</p>
											<a href="/user/movies/${movie.movieId}"
												class="btn btn-primary">View Details</a>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
 
				<div class="tab-pane fade" id="tamil" role="tabpanel"
					aria-labelledby="tamil-tab">
					<h3 class="text-center">Latest Releases</h3>
					<div class="row" id="tamil-movies">
						<c:forEach var="movie" items="${movies}">
							<c:if test="${movie.movieLanguages == 'Tamil'}">
								<div class="col-md-3 movie-card" data-language="Tamil">
									<div class="card">
										<img class="card-img-top" src="${movie.movieThumbnail}"
											alt="${movie.movieName}">
										<div class="card-body">
											<h5 class="card-title">${movie.movieName}</h5>
											<p class="card-text">Genre: ${movie.movieGenres}</p>
											<p class="card-text">Rating: ${movie.movieRated}</p>
											<a href="/user/movies/${movie.movieId}"
												class="btn btn-primary">View Details</a>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
 
 
 
 
	<section id="animated-section" class="container my-5">
		<div class="row align-items-center slider-container">
			<div class="col-md-6">
				<h2>Explore Our Featured Movies</h2>
				<p>Discover exciting films that are gaining popularity!</p>
			</div>
			<div class="col-md-6 text-center">
				<div class="image-container">
					<img src="/images/bg1.png" class="fly-in-image"
						alt="Featured Movie 1">
 
				</div>
			</div>
		</div>
	</section>
 
 
	<section id="movies" class="container my-5">
		<h2 class="text-center mb-4">Upcoming Movies</h2>
		<div class="row">
			<!-- Movie Card 1 -->
			<div class="col-md-3 mb-4">
				<div class="card">
					<img
						src="https://static.toiimg.com/thumb/imgsize-23456,msid-101385836,width-600,resizemode-4/101385836.jpg"
						class="card-img-topp" alt="Movie 1">
					<div class="card-body">
						<h5 class="card-title">Housefull 5</h5>
						<p class="card-text">Release Date: 10th Oct 2025</p>
						<p class="card-text">Language: Hindi</p>
					</div>
				</div>
			</div>
			<!-- Movie Card 2 -->
			<div class="col-md-3 mb-4">
				<div class="card">
					<img src="https://m.media-amazon.com/images/M/MV5BOWM0YTlmZjEtOTA5ZC00MmY0LTk4NjgtNGUyYjAzZTk3ZmMxXkEyXkFqcGc@._V1_.jpg
				" class="card-img-topp" alt="Movie 2">
					<div class="card-body">
						<h5 class="card-title">The RajSaab</h5>
						<p class="card-text">Release Date: 15th March 2025</p>
						<p class="card-text">Language: Tamil</p>
						
					</div>
				</div>
			</div>
			
			<div class="col-md-3 mb-4">
				<div class="card">
					<img src="https://vice-press.com/cdn/shop/files/jurassic-park-movie-poster-andrew-swainson_grande.jpg?v=1739274335"  class="card-img-topp" alt="Movie 2">
					<div class="card-body">
						<h5 class="card-title">Jurassic Park</h5>
						<p class="card-text">Release Date: 21st April 2025</p>
						<p class="card-text">Language: English</p>
					</div>
				</div>
			</div>
			<!-- Add more movies... -->
		</div>
	</section>
 
 
 
	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-3">
		<p>&copy; 2025 FindShow. All rights reserved.</p>
	</footer>
 
 
 
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(window).on('scroll', function() {
			var scrollPos = $(window).scrollTop();
			var sectionOffset = $('#animated-section').offset().top;
			var windowHeight = $(window).height();
 
			if (scrollPos + windowHeight > sectionOffset) {
				// Add the 'visible' class to images when they come into the viewport
				$('.fly-in-image').each(function() {
					$(this).addClass('visible');
				});
			}
		});
	</script>
 
</body>
</html>