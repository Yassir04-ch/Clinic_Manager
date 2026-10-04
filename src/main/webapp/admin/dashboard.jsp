<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-color: #f4f6f9;
    }

    .navbar {
      background-color: #222;
      color: white;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .navbar h2 {
      margin: 0;
    }

    .logout {
      color: white;
      text-decoration: none;
      background-color: #dc3545;
      padding: 10px 15px;
      border-radius: 5px;
    }

    .container {
      padding: 40px;
    }

    .container h1 {
      margin-bottom: 10px;
    }

    .actions {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 20px;
      margin-top: 30px;
    }

    .card {
      background-color: white;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .card h3 {
      margin-top: 0;
    }

    .card p {
      color: #666;
    }

    .btn {
      display: inline-block;
      margin-top: 15px;
      padding: 10px 18px;
      text-decoration: none;
      color: white;
      background-color: #007bff;
      border-radius: 5px;
    }

    .btn:hover {
      background-color: #0056b3;
    }
  </style>
</head>

<body>

<!-- Navbar -->

<div class="navbar">

  <h2>ClinicManager - Admin</h2>

  <a class="logout"
     href="${pageContext.request.contextPath}/users/logout">
    Logout
  </a>

</div>


<!-- Dashboard -->

<div class="container">

  <h1>Admin Dashboard</h1>

  <p>Welcome to the administration panel.</p>


  <!-- Actions -->

  <div class="actions">

    <!-- Create Patient -->

    <div class="card">

      <h3>Create Patient</h3>

      <p>
        Create a new patient account and add
        patient information.
      </p>

      <a class="btn"
         href="${pageContext.request.contextPath}/users/create/patient">
        Create Patient
      </a>

    </div>


    <!-- Create Doctor -->

    <div class="card">

      <h3>Create Doctor</h3>

      <p>
        Create a new doctor account and assign
        a specialty.
      </p>

      <a class="btn"
         href="${pageContext.request.contextPath}/users/create/doctor">
        Create Doctor
      </a>

    </div>


    <!-- Create User -->

    <div class="card">

      <h3>Create User</h3>

      <p>
        Create a general user account.
      </p>

      <a class="btn"
         href="${pageContext.request.contextPath}/users/create/user">
        Create User
      </a>

    </div>

  </div>

</div>

</body>
</html>
