<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Show</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 50px 0;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add New Show</h2>

    <form:form method="POST" modelAttribute="show" action="/admin/show/add">
        <div class="form-group">
            <label for="screen">Screen</label>
            <form:select path="screen.screenId">
                <form:options items="${screens}" itemValue="screenId" itemLabel="screenNumber" />
            </form:select>
        </div>
        <div class="form-group">
            <label for="time">Show Time</label>
            <form:input path="showTime" id="time" type="time" required="true"/>
        </div>
		<div class="form-group">
		            <label for="eventDate">Show Date</label>
		            <form:input type="date" path="showDate" id="eventDate" required="true" />
		        </div>

        <button type="submit">Add Show</button>
    </form:form>

</div>

</body>
</html>
