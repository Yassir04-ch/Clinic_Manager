<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Doctor</title>
</head>

<body>

<h1>Create Doctor</h1>

<form action="${pageContext.request.contextPath}/users/create" method="post">

    <input type="hidden" name="role" value="DOCTOR">


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


    <div>
        <label>Matricule:</label>
        <input type="text" name="matricule" required>
    </div>

    <br>

    <div>
        <label>Title:</label>
        <input type="text" name="title">
    </div>

    <br>

    <div>
        <label>Specialty:</label>

        <select name="specialtyId" required>

            <option value="">-- Select Specialty --</option>

            <option value="SPECIALTY_UUID_1">
                Cardiology
            </option>

            <option value="SPECIALTY_UUID_2">
                Dermatology
            </option>

            <option value="SPECIALTY_UUID_3">
                Pediatrics
            </option>

        </select>
    </div>

    <br>

    <button type="submit">Create Doctor</button>

</form>

</body>
</html>
