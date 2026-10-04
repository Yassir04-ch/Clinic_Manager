<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Department</title>
</head>

<body>

<h1>Update Department</h1>

<form action="${pageContext.request.contextPath}/departments/update/${department.id}"
      method="post">

  <div>
    <label for="name">Department Name:</label>

    <input
            type="text"
            id="name"
            name="name"
            value="${department.name}"
            required
    >
  </div>

  <br>

  <div>
    <label for="description">Description:</label>

    <textarea
            id="description"
            name="description"
            rows="5"
            cols="40"
    >${department.description}</textarea>
  </div>

  <br>

  <button type="submit">
    Update Department
  </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/departments">
  Back to Departments
</a>

</body>
</html>