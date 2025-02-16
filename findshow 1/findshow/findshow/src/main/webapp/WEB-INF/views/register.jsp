
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">

    <!-- Add JavaScript for client-side validation -->
    <script>
        function validateForm() {
			//console.log("validForm executed");
            const name = document.getElementById("name").value;
            const phone = document.getElementById("phoneno").value;
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;
			const namePattern = /^[a-zA-Z]{2,}$/; // Name must be at least 2 characters and contain only letters

            const phonePattern = /^[0-9]{10}$/; // Validate 10 digits phone number
			const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{6,}$/;
          // Password with atleast one lower case,upper case,digit,special character and min 6 length
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/; // Basic email pattern

            // Validate Name (only letters , minimum 2 characters)
            if (!name.match(namePattern)) {
				alert("Name must be at least 2 characters long and contain only letters (A-Z, a-z).");

                return false;
            }

            // Validate Phone Number (10 digits)
            if (!phone.match(phonePattern)) {
                alert("Phone number must be 10 digits.");
                return false;
            }

            // Validate Email (proper email format)
            if (!email.match(emailPattern)) {
				alert("Please enter a valid email address (e.g., example@domain.com).");

                return false;
            }

            // Validate Password (at least 6 characters, letters and numbers,special characters)
            if (!password.match(passwordPattern)) {
				alert("Password must be at least 6 characters long, and contain at least one lowercase letter, one uppercase letter, one digit, and one special character (e.g., !@#$%^&*).");
                return false;
            }
            //console.log("all validations executed");
            return true;  // All validations passed
        }
    </script>
</head>
<body>

    <div class="container">
        <h2>Admin Registration</h2>
        <form:form method="POST" action="register" modelAttribute="user" onsubmit="return validateForm()">

            <!-- Name Input Field -->
            <div class="form-group">
                <label for="name">Name:</label>
                <form:input path="name" id="name" required="true" />
            </div>

            <!-- Phone Number Input Field -->
            <div class="form-group">
                <label for="phone">Phone no:</label>
                <form:input path="phone" id="phoneno" required="true" />
            </div>

            <!-- Email Input Field -->
            <div class="form-group">
                <label for="email">Email:</label>
                <form:input path="email" id="email" type="email" required="true" />
            </div>

            <!-- Password Input Field -->
            <div class="form-group">
                <label for="password">Password:</label>
                <form:password path="passwordHash" id="password" required="true" />
            </div>

            <!-- Submit Button -->
            <button type="submit">Register</button>
        </form:form>

        <!-- Link to Login page for users who already have an account -->
        <div class="back-to-login">
            <a href="/login">Already have an account? Login here.</a>
        </div>
    </div>

</body>
</html>

