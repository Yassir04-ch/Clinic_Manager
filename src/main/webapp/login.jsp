<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Login - ClinicManager</title>
</head>

<body>

<h1>Connexion</h1>

<% if (request.getAttribute("erreur") != null) { %>
<p style="color: red;">
  <%= request.getAttribute("erreur") %>
</p>
<% } %>

<form method="post" action="<%= request.getContextPath() %>/users/login">

  <div>
    <label for="email">Email :</label>
    <input type="email" id="email" name="email" required>
  </div>

  <br>

  <div>
    <label for="password">Mot de passe :</label>
    <input type="password" id="password" name="password" required >
  </div>

  <br>

  <button type="submit">Se connecter</button>

</form>

<p>
  Vous n'avez pas encore de compte ?
  <a href="<%= request.getContextPath() %>/users/create">
    Créer un compte
  </a>
</p>

</body>
</html>