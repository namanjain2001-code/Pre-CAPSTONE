<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Screen List</title>
	<style>
	        /* General body styling */
	        body {
	            font-family: Arial, sans-serif;
	            background-color: #f9f9f9;
	            margin: 0;
	            padding: 0;
	        }
	 
	        h2 {
	            text-align: center;
	            margin-top: 30px;
	            font-size: 32px;
	            color: #333;
	        }
	 
	        a {
	            text-decoration: none;
	            color: #007bff;
	        }
	 
	        a:hover {
	            text-decoration: underline;
	        }
	 
	        .container {
	            width: 80%;
	            margin: 0 auto;
	            padding: 20px;
	        }
	 
	        .add-screen-btn {
	            display: inline-block;
	            background-color: #28a745;
	            color: white;
	            padding: 10px 20px;
	            border-radius: 5px;
	            margin-bottom: 20px;
	            text-align: center;
	            font-size: 16px;
	        }
	 
	        .add-screen-btn:hover {
	            background-color: #218838;
	        }
	 
	        table {
	            width: 100%;
	            border-collapse: collapse;
	            margin-bottom: 20px;
	            background-color: white;
	            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	        }
	 
	        th, td {
	            padding: 12px;
	            text-align: center;
	            border: 1px solid #ddd;
	        }
	 
	        th {
	            background-color: #007bff;
	            color: white;
	            font-size: 18px;
	        }
	 
	        td {
	            font-size: 16px;
	            color: #333;
	        }
	 
	        /* Button styles */
	        .btn-edit, .btn-delete {
	            text-decoration: none;
	            padding: 5px 10px;
	            border-radius: 5px;
	            color: white;
	        }
	 
	        .btn-edit {
	            background-color: #ffc107;
	        }
	 
	        .btn-edit:hover {
	            background-color: #e0a800;
	        }
	 
	        .btn-delete {
	            background-color: #dc3545;
	        }
	 
	        .btn-delete:hover {
	            background-color: #c82333;
	        }
	 
	        /* Confirmation button styles */
	        .confirm-btn {
	            color: white;
	            background-color: red;
	            border: none;
	            border-radius: 5px;
	            padding: 5px 10px;
	            font-size: 14px;
	        }
	 
	        .confirm-btn:hover {
	            background-color: darkred;
	        }
	 
	        /* Responsive styling for smaller screens */
	        @media screen and (max-width: 768px) {
	            .container {
	                width: 95%;
	                padding: 10px;
	            }
	 
	            table {
	                font-size: 14px;
	            }
	 
	            th, td {
	                padding: 8px;
	            }
	        }
	    </style>
</head>
<body>
    <h2>Screen List</h2>
   
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
<h4><a href="/admin/screen/add">Add New Screen</a></h4>
</html>
