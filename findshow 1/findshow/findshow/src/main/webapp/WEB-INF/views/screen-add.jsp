<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Screen</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-size: 16px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 15px;
        }
        button:hover {
            background-color: #45a049;
        }
        .cancel-btn {
            background-color: #f44336;
        }
        .cancel-btn:hover {
            background-color: #e53935;
        }
        .footer {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Add New Screen</h2>

    <form:form method="POST" modelAttribute="screen" action="/admin/screen/add">
        <!-- Screen Number -->
        <div class="form-group">
            <label for="screenNumber">Screen Number</label>
            <form:input path="screenNumber" id="screenNumber" required="true" />
        </div>

        <!-- Screen Capacity -->
        <div class="form-group">
            <label for="screenCapacity">Screen Capacity</label>
            <form:input path="screenCapacity" id="screenCapacity" required="true" type="number" />
        </div>

        <!-- Theatre Selection -->
        <div class="form-group">
            <label for="theatre">Theatre</label>
            <form:select path="theatre.theatreId" id="theatre" required="true">
                <c:forEach items="${theaters}" var="theatre">
                    <option value="${theatre.theatreId}">${theatre.theatreName}</option>
                </c:forEach>
            </form:select>
        </div>
		<div class="form-group">
		        <label for="screenType">Screen Type</label><br>
		        <c:forEach items="${screenTypes}" var="type">
		            <input type="radio" id="screenType_${type}" name="screenType" value="${type}" required="true" />
		            <label for="screenType_${type}">${type}</label>
		        </c:forEach>
		    </div>
        <!-- Submit Button -->
        <button type="submit">Add Screen</button>
        <a href="/admin/screens">
            <button type="button" class="cancel-btn">Cancel</button>
        </a>
    </form:form>
</div>

<div class="footer">
    <p>&copy; Hardik and Yashi Part (Girish Group)</p>
</div>

</body>
</html>

