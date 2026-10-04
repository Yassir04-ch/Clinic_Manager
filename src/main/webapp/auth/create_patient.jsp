<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Patient</title>
</head>

<body>

<h1>Create Patient</h1>

<form action="${pageContext.request.contextPath}/users/create" method="post">

    <!-- Role -->
    <input type="hidden" name="role" value="PATIENT">

    <!-- User fields -->

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

    <!-- Patient fields -->

    <div>
        <label>CIN:</label>
        <input type="text" name="cin" required>
    </div>

    <br>

    <div>
        <label>Date of Birth:</label>
        <input type="date" name="dateOfBirth">
    </div>

    <br>

    <div>
        <label>Gender:</label>

        <select name="gender">
            <option value="">-- Select Gender --</option>
            <option value="MALE">Male</option>
            <option value="FEMALE">Female</option>
        </select>
    </div>

    <br>

    <div>
        <label>Address:</label>
        <input type="text" name="address">
    </div>

    <br>

    <button type="submit">Create Patient</button>

</form>

</body>
</html>
