<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Theater List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 50px 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .action-buttons a {
            margin: 0 5px;
            text-decoration: none;
            color: #007BFF;
        }
        .action-buttons a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Theater List</h2>

    <table>
        <thead>
            <tr>
                <th>Theater Name</th>
                <th>Location</th>
                <th>Number of Screens</th>
               
            </tr>
        </thead>
        <tbody>
            <c:forEach var="theater" items="${theatres}">
                <tr>
                    <td>${theater.theatreName}</td>
                    <td>${theater.TheatreLocation}</td>
                    <td>${theater.noOfScreens}</td> <!-- Displaying number of screens -->
                    <td class="action-buttons">
                        <a href="/theater/edit/${theater.theatreId}">Edit</a>  <!-- Link for edit action -->
                        <a href="/theater/delete/${theater.theatreId}">Delete</a>  <!-- Link for delete action -->
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>

