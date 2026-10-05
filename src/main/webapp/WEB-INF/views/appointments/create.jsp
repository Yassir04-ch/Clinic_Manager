<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }

        .container {
            width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
        }

        h1 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
        }

        button {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            cursor: pointer;
        }

        .error {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Book Appointment</h1>

    <% if (request.getAttribute("error") != null) { %>

    <div class="error">
        <%= request.getAttribute("error") %>
    </div>

    <% } %>

    <form action="${pageContext.request.contextPath}/appointments/create"
          method="post">

        <label for="doctorId">Doctor ID</label>

        <input
                type="text"
                id="doctorId"
                name="doctorId"
                required
        >

        <label for="date">Date</label>

        <input
                type="date"
                id="date"
                name="date"
                required
        >

        <label for="startTime">Start Time</label>

        <input
                type="time"
                id="startTime"
                name="startTime"
                required
        >

        <label for="endTime">End Time</label>

        <input
                type="time"
                id="endTime"
                name="endTime"
                required
        >

        <label for="type">Appointment Type</label>

        <select id="type" name="type" required>

            <option value="">-- Select type --</option>

            <option value="CONSULTATION">
                Consultation
            </option>

            <option value="FOLLOW_UP">
                Follow Up
            </option>

            <option value="URGENT">
                Urgent
            </option>

        </select>

        <label for="reason">Reason</label>

        <textarea
                id="reason"
                name="reason"
                maxlength="500"
                placeholder="Enter the reason for your appointment..."
        ></textarea>

        <button type="submit">
            Book Appointment
        </button>

    </form>

    <br>

    <a href="${pageContext.request.contextPath}/appointments">
        Back to my appointments
    </a>

</div>

</body>
</html>