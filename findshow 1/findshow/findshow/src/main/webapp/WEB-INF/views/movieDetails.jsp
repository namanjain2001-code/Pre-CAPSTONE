<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>
<%@ taglib prefix="func" uri="jakarta.tags.functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${movie.name}-MovieDetails</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Include Bootstrap Icons CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" href="/css/movieDetail.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<!-- Logo -->
			<a class="navbar-brand" href="/user/">FindShow</a>

			<!-- Navbar Toggle Button for Mobile -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar Links -->
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<!-- Search Bar on the Left -->
					<form class="d-flex me-auto" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search for movies..." aria-label="Search">
						<button class="btn btn-outline-light" type="submit">Search</button>
					</form>
				</ul>
			</div>
		</div>
	</nav>



	<!-- Hero Section for Movie Poster -->
	<section class="hero-section"
		style="background-image: url('https://via.placeholder.com/1200x500'); background-size: cover; background-position: center center;">
		<div class="container py-5 text-center">
			<h1 class="display-4">${movie.name}</h1>
			<p class="lead">Genre: ${movie.genre} | Rating: ${movie.rating}</p>
		</div>
	</section>

	<!-- Movie Details Section -->
	<div class="container my-5">
		<div class="row">
			<div class="col-md-8">
				<!-- Movie Details -->
				<div class="card mb-4">
					<img src="https://via.placeholder.com/300x450" class="card-img-top"
						alt="${movie.name}">
					<div class="card-body">
						<h5 class="card-title">${movie.name}</h5>
						<p class="card-text">
							<strong>Cast:</strong> ${movie.cast}
						</p>
						<p class="card-text">
							<strong>Description:</strong> ${movie.description}
						</p>
						<div class="rating">
							<strong>Rating:</strong> <span class="badge bg-warning text-dark">${movie.rating}</span>
						</div>

						<a href="/user/showtimings/${movie.id}" class="btn btn-secondary mt-3">Book
							Ticket</a>

					</div>
				</div>
			</div>



			<!-- Sidebar (optional) -->
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Movie Details</h5>
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><strong>Genre:</strong>
								${movie.genre}</li>
							

							<li class="list-group-item"><strong>Rating:</strong> <span
								class="star-rating"> ${movie.rating} </span></li>

						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="bg-dark text-white text-center py-3">
		<p>&copy; 2025 FindShow. All rights reserved.</p>
	</footer>





	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
