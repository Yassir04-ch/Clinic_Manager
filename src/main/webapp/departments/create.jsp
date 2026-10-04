<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Create Department</title>
</head>

<body>

<h1>Create Department</h1>

<form action="${pageContext.request.contextPath}/departments/create"
      method="post">

  <div>
    <label for="name">Department Name:</label>

    <input
            type="text"
            id="name"
            name="name"
            required
    >
  </div>

  <br>

  <div>
    <label for="description">Description:</label>

    <textarea
            id="description"
            name="description"
            rows="4"
            cols="40"
    ></textarea>
  </div>

  <br>

  <button type="submit">
    Create Department
  </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/departments">
  Back to Departments
</a>

</body>
</html>