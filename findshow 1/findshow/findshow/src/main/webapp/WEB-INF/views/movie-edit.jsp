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
            <td><label for="movieName">Movie Name:</label></td>
            <td><form:input path="movieName" id="movieName" /></td>
        </tr>
        <tr>
            <td><label for="movieDescription">Description:</label></td>
            <td><form:textarea path="movieDescription" id="movieDescription"></form:textarea></td>
        </tr>
        <tr>
            <td><label for="movieDuration">Duration (Minutes):</label></td>
            <td><form:input path="movieDuration" id="movieDuration" type="number" min="1" /></td>
        </tr>
        <tr>
            <td><label for="movieRated">Rated:</label></td>
            <td><form:input path="movieRated" id="movieRated" /></td>
        </tr>
        <tr>
            <td><label for="movieLanguages">Languages:</label></td>
            <td><form:input path="movieLanguages" id="movieLanguages" /></td>
        </tr>
        <tr>
            <td><label for="movieGenres">Genres:</label></td>
            <td><form:input path="movieGenres" id="movieGenres" /></td>
        </tr>
        <tr>
            <td><label for="movieThumbnail">Thumbnail URL:</label></td>
            <td><form:input path="movieThumbnail" id="movieThumbnail" /></td>
        </tr>
        <tr>
            <td><label for="movieType">Movie Type:</label></td>
            <td>
                <form:select path="movieType">
                    <form:option value="IMAX">IMAX</form:option>
                    <form:option value="regular">Regular</form:option>
                </form:select>
            </td>
        </tr>
        <tr>
            <td><label for="movieReleaseDate">Release Date:</label></td>
            <td><form:input path="movieReleaseDate" id="movieReleaseDate" type="date" /></td>
        </tr>
    </table>
    
    <br />
    <button type="submit">Update Movie</button>
    <a href="/admin/movies">Cancel</a>
</form:form>

</body>
</html>
