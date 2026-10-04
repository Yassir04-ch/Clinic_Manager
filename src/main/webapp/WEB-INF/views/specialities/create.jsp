<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Specialty</title>
</head>

<body>

<h1>Create Specialty</h1>

<form action="${pageContext.request.contextPath}/specialties/create"
      method="post">

    <div>
        <label for="name">
            Specialty Name:
        </label>

        <input
                type="text"
                id="name"
                name="name"
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

            <option value="">
                -- Select Department --
            </option>

            <c:forEach
                    var="department"
                    items="${departments}">

                <option value="${department.id}">
                        ${department.name}
                </option>

            </c:forEach>

        </select>

    </div>

    <br>

    <button type="submit">
        Create Specialty
    </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/specialties">
    Back to Specialties
</a>

</body>
</html>