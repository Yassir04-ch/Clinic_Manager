<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Departments Dashboard</title>

  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: #f5f6fa;
    }

    .container {
      width: 90%;
      margin: 40px auto;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
    }

    .header h1 {
      margin: 0;
    }

    .create-btn {
      background: #2563eb;
      color: white;
      padding: 12px 18px;
      text-decoration: none;
      border-radius: 6px;
    }

    .create-btn:hover {
      background: #1d4ed8;
    }

    .card {
      background: white;
      border-radius: 8px;
      padding: 20px;
      margin-bottom: 15px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    }

    .card h3 {
      margin-top: 0;
    }

    .description {
      color: #666;
      margin-bottom: 15px;
    }

    .actions a {
      text-decoration: none;
      margin-right: 10px;
    }

    .edit-btn {
      color: #2563eb;
    }

    .empty {
      background: white;
      padding: 30px;
      text-align: center;
      border-radius: 8px;
      color: #777;
    }

    .back-btn {
      display: inline-block;
      margin-top: 20px;
      color: #444;
      text-decoration: none;
    }
  </style>
</head>

<body>

<div class="container">

  <div class="header">

    <div>
      <h1>Departments</h1>
      <p>Manage hospital departments</p>
    </div>

    <a
            class="create-btn"
            href="${pageContext.request.contextPath}/departments/create">
      + Create New Department
    </a>

  </div>


  <c:choose>

    <c:when test="${empty departments}">

      <div class="empty">
        <h3>No Departments Found</h3>
        <p>Create your first department.</p>

        <a
                class="create-btn"
                href="${pageContext.request.contextPath}/departments/create">
          Create Department
        </a>
      </div>

    </c:when>


    <c:otherwise>

      <c:forEach var="department" items="${departments}">

        <div class="card">

          <h3>
              ${department.name}
          </h3>

          <p class="description">
              ${department.description}
          </p>

          <div class="actions">

            <a
                    class="edit-btn"
                    href="${pageContext.request.contextPath}/departments/update/${department.id}">
              Edit
            </a>

          </div>

        </div>

      </c:forEach>

    </c:otherwise>

  </c:choose>


  <a
          class="back-btn"
          href="${pageContext.request.contextPath}/dashboard/admin">
    ← Back to Dashboard
  </a>

</div>

</body>
</html>