<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie List</title>
 
    <!-- Bootstrap CSS (via CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
    <style>
		h4 {
				           font-size: 30px;
				           font-weight: 500;
				           margin-bottom: 20px;
						   margin-left: 900px;
				       }
	</style>
    
</head>
<body>
 
<div class="container mt-5">
    <h2 class="text-center mb-4">Movie List</h2>
 
    <!-- Movie List Table -->
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>Movie Name</th>
                <th>Description</th>
                <th>Duration</th>
                <th>Rating</th>
                <th>Genres</th>
                <th>Languages</th>
                <th>Release Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate through the list of movies -->
            <c:forEach var="movie" items="${movies}">
                <tr>
                    <td>${movie.movieName}</td>
                    <td>${movie.movieDescription}</td>
                    <td>${movie.movieDuration}</td>
                    <td>${movie.movieRated}</td>
                    <td>${movie.movieGenres}</td>
                    <td>${movie.movieLanguages}</td>
                    <td>${movie.movieReleaseDate}</td>
                    <td>
                        <!-- Edit and Delete Actions -->
                        <a href="/admin/movie/edit/${movie.movieId}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="/admin/movie/delete/${movie.movieId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this movie?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
 
    <!-- Add New Movie Link -->
    <a href="/admin/movie/add" class="btn btn-primary">Add New Movie</a>
</div>
 
<!-- Bootstrap JS and Popper.js from CDN -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"  crossorigin="anonymous"></script>
 
</body>
<h4><a href="/admin/dashboard" class="btn btn-primary">Back to Dashboard</a></h4>
</html>

