

<!DOCTYPE html>
<html  lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Theatre Register</title>
</head>
<body>
    <h2>Theatre Resgister</h2>
	<form:form method="POST">

        <label for="theatreName">Theatre Name:</label>
        <input type="text" id="theatreName" name="theatreName" required><br><br>
        <label for="theatreLocation">Theatre Location:</label>
        <input type="text" id="theatreLocation" name="theatreLocation" required><br><br>
		
        <label for="noOfScreens">No of Screens:</label>
        <input type="text" id="noOfScreens" name="noOfScreens" required><br><br>
	       
        <button type="submit">Save</button>
    </form:form>
</body>
</html>

