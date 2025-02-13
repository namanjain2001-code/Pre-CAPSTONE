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
<style>
body {
	font-family: Arial, sans-serif;
}

.navbar-nav .nav-item {
	margin-left: 30px;
}

.custom-image {
	object-fit: cover;
	height: 100%;
}

.card {
	margin-bottom: 20px;
	border: none;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card img {
	height: 200px;
	object-fit: cover;
}

.card-title {
	font-size: 1.2em;
	font-weight: bold;
}

.card-text {
	font-size: 1em;
	color: #555;
}

.hero {
	background-color: #f8f9fa;
}

.hero .img-fluid {
	max-height: 400px;
	object-fit: cover;
}

.hero .col-md-4 {
	padding: 0;
}

.hero h1 {
	font-size: 3rem;
	font-weight: bold;
}

.hero p {
	font-size: 1.25rem;
}

.hero .btn-secondary {
	font-size: 1.25rem;
	padding: 12px 30px;
}

.custom-image {
	width: 100%;
	height: auto;
	max-width: 700px;
}

.card img {
	height: 250px;
	object-fit: cover;
	border-radius: 8px 8px 0 0;
}

footer {
	background-color: #222;
	color: #ccc;
}

/* Initial State of Images */
.fly-in-image {
	opacity: 0;
	transform: translateX(-100%);
	transition: opacity 0.6s ease-out, transform 0.6s ease-out;
}

/* When the images are in the viewport */
.visible {
	opacity: 1;
	transform: translateX(0);
}

/* Optional: Add some delay to each image to stagger the animation */
.fly-in-image:nth-child(1) {
	transition-delay: 0.2s;
}

.fly-in-image:nth-child(2) {
	transition-delay: 0.4s;
}

.fly-in-image:nth-child(3) {
	transition-delay: 0.6s;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/">FindShow</a>

		<!-- Navbar Toggle Button for Mobile -->
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<!-- <li class="nav-item ms-3">
					<form class="d-flex me-auto" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search for movies..." aria-label="Search">
						<button class="btn btn-outline-light" type="submit">Search</button>
					</form>
				</li> -->
				<li class="nav-item"><a class="btn btn-outline-light ms-2"
					href="/login">Login</a></li>
				<li class="nav-item"><a class="btn btn-outline-light ms-2"
					href="/register">Register</a></li>
			</ul>
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


			<!-- Tab Content Section -->
			<div class="tab-content mt-3" id="languageTabContent">
				<!-- Hindi Tab Content -->
				<div class="tab-pane fade show active" id="hindi" role="tabpanel"
					aria-labelledby="hindi-tab">
					<h3 class="text-center">Latest Releases</h3>
					<div class="row">
						<!-- Loop through each movie and display in a card -->
						<c:forEach var="movie" items="${movies}">
							<div class="col-md-3">
								<div class="card">
									<img class="card-img-top"
										src="https://via.placeholder.com/300x200" alt="${movie.name}">
									<div class="card-body">
										<h5 class="card-title">${movie.name}</h5>
										<p class="card-text">Genre: ${movie.genre}</p>
										<p class="card-text">Rating: ${movie.rating}</p>
										<a href="/user/movies/${movie.id}" class="btn btn-primary">View
											Details</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- English Tab Content -->
				<div class="tab-pane fade" id="english" role="tabpanel"
					aria-labelledby="english-tab">
					<h3 class="text-center">Latest Releases</h3>
					<div class="row">
						<div class="col-md-3">
							<div class="card">
								<img src="/images/english-movie1.jpg" class="card-img-top"
									alt="English Movie 1">
								<div class="card-body">
									<h5 class="card-title">Movie Title (English)</h5>
									<i class="bi bi-star-fill" style="color: yellow;"></i><br /> <a
										href="#" class="btn btn-primary" style="margin-top: 5px";>Book
										Now</a>
								</div>
							</div>
						</div>
						<!-- More English Movie Cards can go here -->
					</div>
				</div>

				<!-- Telugu Tab Content -->
				<div class="tab-pane fade" id="telugu" role="tabpanel"
					aria-labelledby="telugu-tab">
					<h3 class="text-center">Latest Releases</h3>
					<div class="row">
						<div class="col-md-3">
							<div class="card">
								<img src="/images/telugu-movie1.jpg" class="card-img-top"
									alt="Telugu Movie 1">
								<div class="card-body">
									<h5 class="card-title">Movie Title (Telugu)</h5>
									<i class="bi bi-star-fill" style="color: yellow;"></i><br /> <a
										href="#" class="btn btn-primary" style="margin-top: 5px";>Book
										Now</a>
								</div>
							</div>
						</div>
						<!-- More Telugu Movie Cards can go here -->
					</div>
				</div>

				<!-- Tamil Tab Content -->
				<div class="tab-pane fade" id="tamil" role="tabpanel"
					aria-labelledby="tamil-tab">
					<h3 class="text-center">Latest Releases</h3>
					<div class="row">
						<div class="col-md-3">
							<div class="card">
								<img src="/images/tamil-movie1.jpg" class="card-img-top"
									alt="Tamil Movie 1">
								<div class="card-body">
									<h5 class="card-title">Movie Title (Tamil)</h5>
									<i class="bi bi-star-fill" style="color: yellow;"></i><br /> <a
										href="#" class="btn btn-primary" style="margin-top: 5px";>Book
										Now</a>
								</div>
							</div>
						</div>
						<!-- More Tamil Movie Cards can go here -->
					</div>
				</div>
			</div>
		</div>
	</section>


	<section id="animated-section" class="container my-5">
		<div class="row align-items-center">
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
					<img src="/images/movie1.jpg" class="card-img-top" alt="Movie 1">
					<div class="card-body">
						<h5 class="card-title">Movie Title 1</h5>
						<p class="card-text">Release Date: 10th Oct 2021</p>
						<a href="#" class="btn btn-primary">Book Now</a>
					</div>
				</div>
			</div>
			<!-- Movie Card 2 -->
			<div class="col-md-3 mb-4">
				<div class="card">
					<img src="/images/movie2.jpg" class="card-img-top" alt="Movie 2">
					<div class="card-body">
						<h5 class="card-title">Movie Title 2</h5>
						<p class="card-text">Release Date: 15th Oct 2021</p>
						<a href="#" class="btn btn-primary">Book Now</a>
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