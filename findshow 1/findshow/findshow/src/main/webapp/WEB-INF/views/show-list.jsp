<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Screens</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles if needed */
        table th, table td {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Show and Screen Details</h2>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>Show Time</th>
                <th>Show Date</th>
                <th>Screen Name</th>
                <th>Movie Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Iterate over the screenShowsMap -->
            <c:forEach var="show" items="${shows}" >
                <!-- Extract Screen and its Shows -->
                
                    <tr>
                        <!-- Display show details -->
                        <td>${show.showTime}</td>
                        <td>${show.showDate}</td>
                        <td>${show.screen.screenNumber}</td>
                        <td>${show.movie.movieName}</td>
                        <td>
                            
                            <a href="/admin/show/edit/${show.showId}" class="btn btn-primary btn-sm">Edit</a> 
                            <a href="/admin/show/delete/${show.showId}" class="btn btn-danger btn-sm ml-2">Delete</a>
                        </td>
                    </tr>
               
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Include Bootstrap JS and Popper.js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
