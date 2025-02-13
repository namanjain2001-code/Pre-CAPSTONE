<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:csrfInput />
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="sql" uri="jakarta.tags.sql" %>
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>
<%@ taglib prefix="func" uri="jakarta.tags.functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Show</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
</head>
<body>

<h2>Edit Show</h2>

<!-- Display the form to edit a show -->
<form:form method="POST" action="<c:url value='/admin/show/edit/${show.id}'/>" modelAttribute="show">
    <fieldset>
        <legend>Show Information</legend>

        <!-- Show Name -->
        <label for="movieName">Movie Name:</label>
        <input type="text" id="movieName" name="movieName" value="${show.movieName}" required />
        <br/><br/>

        <!-- Show Time -->
        <label for="showTime">Show Time:</label>
        <input type="datetime-local" id="showTime" name="showTime" value="${show.showTime}" required />
        <br/><br/>

        <!-- Select Screen -->
        <label for="screen">Screen:</label>
        <select id="screen" name="screen.id" required>
            <option value="" disabled>Select Screen</option>
            <c:forEach var="screen" items="${screens}">
                <option value="${screen.id}" <c:if test="${screen.id == show.screen.id}">selected</c:if>>
                    ${screen.screenName}
                </option>
            </c:forEach>
        </select>
        <br/><br/>

        <!-- Submit Button -->
        <button type="submit">Save Changes</button>
    </fieldset>
</form:form>

<!-- Back to Show List -->
<a href="<c:url value='/admin/shows'/>">Back to Show List</a>

</body>
</html>
