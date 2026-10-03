<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Patient Dashboard</title>
</head>
<body>

<h1>Bienvenue dans ClinicManager</h1>

<h2>
  Bonjour ${user.firstName} ${user.lastName}
</h2>

<p>Bienvenue dans votre espace patient.</p>

<a href="${pageContext.request.contextPath}/profile">
  Profile
</a>


<a href="${pageContext.request.contextPath}/users/logout">
  LogOut
</a>

</body>
</html>