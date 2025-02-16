<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Theatre</title>
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
        input {
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
    <h2>Add New Theatre</h2>

    <form:form method="POST" modelAttribute="theatre" action="/admin/theatre/add">
        <div class="form-group">
            <label for="theatreName">Theatre Name</label>
            <form:input path="theatreName" id="theatreName" required="true"/>
        </div>

        <div class="form-group">
            <label for="theatreLocation">Location</label>
            <form:input path="theatreLocation" id="theatreLocation" required="true"/>
        </div>

        <div class="form-group">
            <label for="noOfScreens">Number of Screens</label>
            <form:input path="noOfScreens" id="noOfScreens" required="true" type="number"/>
        </div>

            <form:input path="user.userId" id="userId" required="true" type="hidden" value="${currentUserId}" readonly="true" />

        <button type="submit">Add Theatre</button>
    </form:form>

</div>

</body>
</html>

