<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Theatre List</title>
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
    <h2>Theatre List</h2>

    <table>
        <thead>
            <tr>
                <th>Theatre Name</th>
                <th>Theatre Location</th>
                <th>Number of Screens</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="theatre" items="${theatres}">
                <tr>
                    <td>${theatre.theatreName}</td>
                    <td>${theatre.theatreLocation}</td>
                    <td>${theatre.noOfScreens}</td> <!-- Displaying the number of screens -->
                    <td class="action-buttons">
                        <a href="/admin/theatre/edit/${theatre.theatreId}">Edit</a>
                        <a href="/admin/theatre/delete/${theatre.theatreId}" onclick="return confirm('Are you sure you want to delete this theatre?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<a href="/admin/theatre/add" class="btn btn-primary btn-add">Add Theatre</a>

</body>
</html>
