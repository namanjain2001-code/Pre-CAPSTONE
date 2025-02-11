<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html  lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
</head>
<body>
    <h2>Admin Resgister</h2>
	<form:form method="POST">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>
        <label for="phoneno">Phone no:</label>
        <input type="text" id="phoneno" name="phone" required><br><br>
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br><br>        
        <label for="password">Password:</label>
        <input type="password" id="password" name="passwordHash" required><br><br>
	       
        <button type="submit">Login</button>
    </form:form>
</body>
</html>

