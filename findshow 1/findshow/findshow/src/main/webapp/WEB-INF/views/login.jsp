<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>
<%@ taglib prefix="func" uri="jakarta.tags.functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <h3></h3></h3>
            <h2>Hi Girish</h2>
            <h3></h3>
        <!-- Display error message if login failed -->
        <c:if test="${param.error}">
            <p style="color: red;">Invalid email or password. Please try again.</p>
        </c:if>

        <form:form  >
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="passwordHash" required />
            </div>
            <button type="submit">Login</button>
        </form:form>
        <div>
            <a href="<c:url value='/register' />">Don't have an account? Register here.</a>
        </div>
    </div>
</body>
</html>



