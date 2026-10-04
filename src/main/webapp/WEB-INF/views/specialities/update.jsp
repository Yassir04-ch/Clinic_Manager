<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Specialty</title>
</head>

<body>

<h1>Update Specialty</h1>

<form action="${pageContext.request.contextPath}/specialties/update"
      method="post">

  <input
          type="hidden"
          name="id"
          value="${specialty.id}"
  >

  <div>

    <label for="name">
      Specialty Name:
    </label>

    <input
            type="text"
            id="name"
            name="name"
            value="${specialty.name}"
            required
    >

  </div>

  <br>

  <div>

    <label for="department">
      Department:
    </label>

    <select
            id="department"
            name="departmentId"
            required
    >

      <c:forEach
              var="department"
              items="${departments}">

        <option
                value="${department.id}"
          ${department.id == specialty.department.id ? 'selected' : ''}>

            ${department.name}

        </option>

      </c:forEach>

    </select>

  </div>

  <br>

  <button type="submit">
    Update Specialty
  </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/specialties">
  ← Back to Specialties
</a>

</body>
</html>