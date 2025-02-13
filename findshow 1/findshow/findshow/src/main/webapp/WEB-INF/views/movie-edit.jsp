<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Movie</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>

<h2>Edit Movie</h2>

<!-- Form for editing movie -->
<form:form modelAttribute="movie" method="POST" action="/admin/movie/edit/${movie.movieId}">
    <table>
        <tr>
            <td><label for="movie_name">Movie Name:</label></td>
            <td><form:input path="movieName" id="movie_name" /></td>
        </tr>
        <tr>
            <td><label for="movie_description">Description:</label></td>
            <td><form:textarea path="movieDescription" id="movie_description"></form:textarea></td>
        </tr>
        <tr>
            <td><label for="movie_duration">Duration (Minutes):</label></td>
            <td><form:input path="movieDuration" id="movie_duration" type="number" min="1" /></td>
        </tr>
        <tr>
            <td><label for="movie_rated">Rated:</label></td>
            <td><form:input path="movieRated" id="movie_rated" /></td>
        </tr>
        <tr>
            <td><label for="movie_languages">Languages:</label></td>
            <td><form:input path="movieLanguages" id="movie_languages" /></td>
        </tr>
        <tr>
            <td><label for="movie_genres">Genres:</label></td>
            <td><form:input path="movieGenres" id="movie_genres" /></td>
        </tr>
        <tr>
            <td><label for="movie_thumbnail">Thumbnail URL:</label></td>
            <td><form:input path="movieThumbnail" id="movie_thumbnail" /></td>
        </tr>
        <tr>
            <td><label for="movie_type">Movie Type:</label></td>
            <td>
                <form:select path="movieType">
                    <form:option value="IMAX">IMAX</form:option>
                    <form:option value="REGULAR">Regular</form:option>
                </form:select>
            </td>
        </tr>
        <tr>
            <td><label for="movie_release_date">Release Date:</label></td>
            <td><form:input path="movieReleaseDate" id="movie_release_date" type="date" /></td>
        </tr>
    </table>
    
    <br />
    <button type="submit">Update Movie</button>
    <a href="/admin/movies">Cancel</a>
</form:form>

</body>
</html>
