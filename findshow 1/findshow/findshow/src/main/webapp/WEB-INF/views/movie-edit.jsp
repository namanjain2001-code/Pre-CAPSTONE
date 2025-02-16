<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Movie</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
	<style>
	        body {
	            font-family: Arial, sans-serif;
	            background-color: #f4f7fc;
	            margin: 0;
	            padding: 0;
	        }
	 
	        h2 {
	            text-align: center;
	            margin-top: 30px;
	            font-size: 32px;
	            color: #333;
	        }
	 
	        table {
	            width: 80%;
	            margin: 20px auto;
	            border-collapse: collapse;
	        }
	 
	        table td {
	            padding: 10px;
	            vertical-align: middle;
	            font-size: 14px;
	        }
	 
	        table td label {
	            font-weight: bold;
	            color: #555;
	            width: 150px;
	        }
	 
	        form:input,
	        form:textarea,
	        form:select {
	            width: 100%;
	            padding: 8px;
	            margin: 5px 0;
	            border: 1px solid #ddd;
	            border-radius: 4px;
	            font-size: 14px;
	        }
	 
	        form:textarea {
	            resize: vertical;
	        }
	 
	        button[type="submit"] {
	            background-color: #007bff;
	            color: white;
	            border: none;
	            padding: 12px 20px;
	            font-size: 16px;
	            cursor: pointer;
	            border-radius: 5px;
	            margin-right: 30px;
	        }
	 
	        button[type="submit"]:hover {
	            background-color: #0056b3;
	        }
	 
	        a {
	            font-size: 16px;
	            color: #007bff;
	            text-decoration: none;
	        }
	 
	        a:hover {
	            text-decoration: underline;
	        }
	 
	        .form-container {
	            background-color: white;
	            border-radius: 10px;
	            padding: 30px;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	            width: 60%;
	            margin: 50px auto;
	        }
	 
	        .cancel-btn {
	            font-size: 16px;
	            color: #ff3b30;
	            text-decoration: none;
	            border: 1px solid #ff3b30;
	            border-radius: 5px;
	            padding: 10px 20px;
	        }
	 
	        .cancel-btn:hover {
	            background-color: #ff3b30;
	            color: white;
	        }
	 
	        /* Responsive styles */
	        @media screen and (max-width: 768px) {
	            table {
	                width: 100%;
	            }
	 
	            .form-container {
	                width: 90%;
	                padding: 20px;
	            }
	 
	            button[type="submit"] {
	                width: 100%;
	                padding: 15px;
	                font-size: 18px;
	            }
	        }
	    </style>
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
                    <form:option value="REGULAR">Regular</form:option>
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
