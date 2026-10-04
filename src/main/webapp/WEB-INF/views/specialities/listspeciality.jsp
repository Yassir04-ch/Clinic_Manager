<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Specialties</title>
</head>

<body>

<h1>Specialties</h1>

<a href="${pageContext.request.contextPath}/specialties/create">
    + Create New Specialty
</a>

<br>
<br>

<c:choose>

    <c:when test="${empty specialties}">

        <p>
            No specialties found.
        </p>

    </c:when>

    <c:otherwise>

        <table border="1">

            <thead>
            <tr>
                <th>Name</th>
                <th>Department</th>
                <th>Actions</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach
                    var="specialty"
                    items="${specialties}">

                <tr>

                    <td>
                            ${specialty.name}
                    </td>

                    <td>
                            ${specialty.department.name}
                    </td>

                    <td>

                        <a href="${pageContext.request.contextPath}/specialties/update/${specialty.id}">
                            Edit
                        </a>

                    </td>

                </tr>

            </c:forEach>

            </tbody>

        </table>

    </c:otherwise>

</c:choose>

<br>

<a href="${pageContext.request.contextPath}/dashboard/admin">
    ← Back to Dashboard
</a>

</body>
</html>