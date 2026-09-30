<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>

<body>

<h1>Create Account</h1>

<form action="${pageContext.request.contextPath}/users/create"
      method="post">

    <div>
        <label for="firstName">First Name:</label>
        <input type="text"id="firstName"name="firstName"required>
    </div>

    <br>

    <div>
        <label for="lastName">Last Name:</label>
        <input type="text"id="lastName"name="lastName"required>
    </div>

    <br>

     <div>
            <label for="phone">Phone:</label>
            <input type="text"id="phone"name="phone"required>
        </div>

    <br>

    <div>
        <label for="email">Email:</label>
        <input type="email"id="email"name="email"required>
    </div>

    <br>


    <div>
        <label for="password">Password:</label>
        <input type="password"id="password"name="password"required>
    </div>

    <br>

    <button type="submit">Register</button>

</form>

</body>
</html>
