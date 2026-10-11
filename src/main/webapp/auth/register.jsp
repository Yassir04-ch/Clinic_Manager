<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create STAFF</title>
</head>

<body>

<h1>Create STAFF</h1>

<form action="${pageContext.request.contextPath}/users/create" method="post">

    <input type="hidden" name="role" value="STAFF">

    <div>
        <label>First Name:</label>
        <input type="text" name="firstName" required>
    </div>

    <br>

    <div>
        <label>Last Name:</label>
        <input type="text" name="lastName" required>
    </div>

    <br>

    <div>
        <label>Phone:</label>
        <input type="text" name="phone">
    </div>

    <br>

    <div>
        <label>Email:</label>
        <input type="email" name="email" required>
    </div>

    <br>

    <div>
        <label>Password:</label>
        <input type="password" name="password" required>
    </div>


    <br>

    <br>

    <button type="submit">Create STAFF</button>

</form>

</body>
</html>
