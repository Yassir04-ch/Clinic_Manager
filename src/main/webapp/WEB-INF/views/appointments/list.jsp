<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Appointments</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }

        .container {
            width: 90%;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
        }

        h1 {
            margin-bottom: 20px;
        }

        .add-button {
            display: inline-block;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
        }

        .empty {
            padding: 20px;
            text-align: center;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>My Appointments</h1>

    <a
            class="add-button"
            href="${pageContext.request.contextPath}/appointments/create">
        + Book Appointment
    </a>

    <c:choose>

        <c:when test="${empty appointments}">

            <div class="empty">
                You don't have any appointments.
            </div>

        </c:when>

        <c:otherwise>

            <table>

                <thead>

                <tr>
                    <th>Date</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Type</th>
                    <th>Reason</th>
                    <th>Status</th>
                </tr>

                </thead>

                <tbody>

                <c:forEach var="appointment"
                           items="${appointments}">

                    <tr>

                        <td>
                                ${appointment.date}
                        </td>

                        <td>
                                ${appointment.startTime}
                        </td>

                        <td>
                                ${appointment.endTime}
                        </td>

                        <td>
                                ${appointment.type}
                        </td>

                        <td>
                                ${appointment.reason}
                        </td>

                        <td>
                                ${appointment.status}
                        </td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

        </c:otherwise>

    </c:choose>

</div>

</body>
</html>