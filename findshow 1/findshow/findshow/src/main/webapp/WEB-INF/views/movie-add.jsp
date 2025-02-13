<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Movie</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">  
</head>
<body>

<h2>Add New Movie</h2>

<!-- Movie add form -->
<form:form method="POST" action="/admin/movie/add" modelAttribute="movie">
    <fieldset>
        <legend>Movie Information</legend>

        <!-- Movie Name -->
        <label for="movieName">Movie Name:</label>
        <form:input path="movieName" id="movieName" required="true"/>
        <br/><br/>

        <!-- Movie Description -->
        <label for="movieDescription">Description:</label>
        <form:textarea path="movieDescription" id="movieDescription" required="true"/>
        <br/><br/>

        <!-- Movie Duration -->
        <label for="movieDuration">Duration (minutes):</label>
        <form:input path="movieDuration" id="movieDuration" required="true" type="number"/>
        <br/><br/>

        <!-- Movie Rating -->
        <label for="movieRated">Rating:</label>
        <form:input path="movieRated" id="movieRated" required="true"/>
        <br/><br/>

        <!-- Movie Languages -->
        <label for="movieLanguages">Languages:</label>
        <form:input path="movieLanguages" id="movieLanguages" required="true"/>
        <br/><br/>

        <!-- Movie Genres -->
        <label for="movieGenres">Genres:</label>
        <form:input path="movieGenres" id="movieGenres" required="true"/>
        <br/><br/>

        <!-- Movie Thumbnail -->
        <label for="movieThumbnail">Thumbnail URL:</label>
        <form:input path="movieThumbnail" id="movieThumbnail"/>
        <br/><br/>

        <!-- Movie Type (IMAX or Regular) -->
        <label for="movieType">Movie Type:</label>
        <form:select path="movieType">
            <form:option value="IMAX">IMAX</form:option>
            <form:option value="REGULAR">Regular</form:option>
        </form:select>
        <br/><br/>

        <!-- Release Date -->
        <label for="movieReleaseDate">Release Date:</label>
        <form:input path="movieReleaseDate" id="movieReleaseDate" type="date" required="true"/>
        <br/><br/>

        <!-- Submit Button -->
        <button type="submit">Add Movie</button>
    </fieldset>
</form:form>

<!-- Back to movie list -->
<a href="/admin/movies">Back to Movie List</a>

</body>
</html>


