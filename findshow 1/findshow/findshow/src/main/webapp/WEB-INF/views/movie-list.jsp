<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie List</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>

<h2>Movie List</h2>

<!-- Display Movie List -->
<table border="1">
    <thead>
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
                    <a href="/admin/movie/edit/${movie.movieId}">Edit</a> | 
                    <a href="/admin/movie/delete/${movie.movieId}" onclick="return confirm('Are you sure you want to delete this movie?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- Add New Movie Link -->
<a href="/admin/movie/add">Add New Movie</a>

</body>
</html>

