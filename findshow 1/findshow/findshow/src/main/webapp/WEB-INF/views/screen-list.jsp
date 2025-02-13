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
                <th>Theatre</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="screen" items="${screens}">
                <tr>
                    <td>${screen.id}</td>
                    <td>${screen.screenName}</td>
                    <td>${screen.capacity}</td>
                    <td>${screen.theatre.name}</td>
                    <td>
                        <a href="/admin/screen/edit/${screen.id}">Edit</a> | 
                        <a href="/admin/screen/delete/${screen.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
