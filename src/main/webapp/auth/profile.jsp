<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <title>Mon profil</title>
</head>

<body>

<h1>Mon profil</h1>

<form method="post" action="${pageContext.request.contextPath}/profile">

    <label>Prénom :</label>
    <input type="text"
           name="firstName"
           value="${user.firstName}">

    <br><br>

    <label>Nom :</label>
    <input type="text"
           name="lastName"
           value="${user.lastName}">

    <br><br>

    <label>Téléphone :</label>
    <input type="text" name="phone" value="${user.phone}">

    <br><br>

    <label>Email :</label>
    <input type="email" name="email" value="${user.email}" required>

    <br><br>

    <button type="submit">
        Enregistrer
    </button>

</form>

<br>

<a href="${pageContext.request.contextPath}/dashboard/patient">
    Retour au dashboard
</a>

</body>

</html>