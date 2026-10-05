<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Create Availability</title>
</head>

<body>

<h1>Create Doctor Availability</h1>

<% if (request.getAttribute("error") != null) { %>

<p style="color:red;">
  <%= request.getAttribute("error") %>
</p>

<% } %>

<form
        action="${pageContext.request.contextPath}/availabilities" method="post">

  <input type="hidden" name="doctorId" value="${doctorId}">

  <label>Day</label>

  <select name="dayOfWeek" required>

    <option value="MONDAY">Monday</option>
    <option value="TUESDAY">Tuesday</option>
    <option value="WEDNESDAY">Wednesday</option>
    <option value="THURSDAY">Thursday</option>
    <option value="FRIDAY">Friday</option>
    <option value="SATURDAY">Saturday</option>
    <option value="SUNDAY">Sunday</option>

  </select>

  <br><br>

  <label>Start Time</label>

  <input
          type="time"
          name="startTime"
          required
  >

  <br><br>

  <label>End Time</label>

  <input
          type="time"
          name="endTime"
          required
  >

  <br><br>

  <label>Status</label>

  <select name="status" required>

    <option value="ACTIVE">
      Available
    </option>

    <option value="INACTIVE">
      Unavailable
    </option>

  </select>

  <br><br>

  <label>Valid From</label>

  <input type="date" name="validFrom" required>

  <br><br>

  <label>Valid To</label>

  <input type="date" name="validTo" required>

  <br><br>

  <button type="submit">
    Save Availability
  </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/dashboard/admin">
  Back to doctors
</a>

</body>

</html>