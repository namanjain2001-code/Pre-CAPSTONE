<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Screen List</title>
</head>
<body>
    <h2>Screen List</h2>
    <a href="/admin/screen/add">Add New Screen</a>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Screen Name</th>
                <th>Capacity</th>
				<th>Screen Type</th>
                <th>Theatre</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="entry" items="${screens}">
				<c:forEach var="screen" items="${entry.value}">
				            
                <tr>
                    <td>${screen.screenId}</td>
                    <td>${screen.screenNumber}</td>
                    <td>${screen.screenCapacity}</td>
                    <td>${screen.screenType}</td>
                    <td>${screen.theatre.theatreId}</td>
                    <td>
                        <a href="/admin/screen/edit/${screen.screenId}">Edit</a> | 
                        <a href="/admin/screen/delete/${screen.screenId} class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this movie?')">Delete</a>
                    </td>
                </tr>
				        </c:forEach>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
