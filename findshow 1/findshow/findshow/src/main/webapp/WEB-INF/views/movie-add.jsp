<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Movie</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>"> 
	<style>
	        /* Basic Styles for the Form */
	        body {
	            font-family: Arial, sans-serif;
	            background-color: #f4f4f9;
	            margin: 0;
	            padding: 0;
	        }

	        h2 {
	            text-align: center;
	            margin-top: 20px;
	            color: #333;
	        }

	        .form-container {
	            width: 80%;
	            max-width: 800px;
	            margin: 30px auto;
	            background-color: #fff;
	            padding: 20px;
	            border-radius: 8px;
	            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	        }

	        fieldset {
	            border: 2px solid #007bff;
	            padding: 20px;
	            border-radius: 8px;
	        }

	        legend {
	            font-size: 1.5em;
	            color: #007bff;
	            font-weight: bold;
	        }

	        label {
	            font-size: 1.1em;
	            margin-bottom: 5px;
	            display: inline-block;
	        }

	        input, select, textarea {
	            width: 100%;
	            padding: 8px;
	            margin: 10px 0;
	            border: 1px solid #ccc;
	            border-radius: 5px;
	            box-sizing: border-box;
	        }

	        textarea {
	            resize: vertical;
	            height: 100px;
	        }

	        button {
	            background-color: #007bff;
	            color: white;
	            border: none;
	            padding: 12px 20px;
	            font-size: 1.1em;
	            border-radius: 5px;
	            cursor: pointer;
	            width: 100%;
	            margin-top: 10px;
	        }

	        button:hover {
	            background-color: #0056b3;
	        }

	        a {
	            display: block;
	            text-align: center;
	            margin-top: 20px;
	            font-size: 1.2em;
	            text-decoration: none;
	            color: #007bff;
	        }

	        a:hover {
	            text-decoration: underline;
	        }
	    </style> 
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


