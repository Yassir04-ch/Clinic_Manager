
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon profil | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="min-h-screen bg-slate-50 text-slate-800">

<c:set var="dashboardUrl" value="/dashboard/patient"/>

<c:choose>
    <c:when test="${user.role == 'ADMIN'}">
        <c:set var="dashboardUrl" value="/dashboard/admin"/>
    </c:when>
    <c:when test="${user.role == 'DOCTOR'}">
        <c:set var="dashboardUrl" value="/dashboard/doctor"/>
    </c:when>
    <c:when test="${user.role == 'STAFF'}">
        <c:set var="dashboardUrl" value="/dashboard/staff"/>
    </c:when>
</c:choose>

<!-- Header -->
<header class="bg-white border-b border-slate-200">
    <div class="max-w-6xl mx-auto px-6 py-5 flex items-center justify-between">
        <a href="${pageContext.request.contextPath}${dashboardUrl}"
           class="flex items-center gap-3">
            <div class="w-11 h-11 rounded-xl bg-blue-600 text-white
                        flex items-center justify-center font-bold text-lg">
                CM
            </div>
            <div>
                <h1 class="font-bold text-lg text-slate-900">ClinicManager</h1>
                <p class="text-xs text-slate-500">Espace personnel</p>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/users/logout"
           class="rounded-xl px-4 py-2.5 text-sm font-semibold
                  text-red-600 hover:bg-red-50">
            Déconnexion
        </a>
    </div>
</header>

<main class="max-w-6xl mx-auto px-6 py-10">

    <!-- Page title -->
    <div class="mb-8">
        <p class="text-sm font-semibold uppercase tracking-wider text-blue-600">
            Mon espace
        </p>
        <h2 class="mt-2 text-3xl font-bold tracking-tight text-slate-900">
            Mon profil
        </h2>
        <p class="mt-2 text-slate-500">
            Consultez et mettez à jour vos informations personnelles.
        </p>
    </div>

    <!-- Feedback -->
    <c:if test="${not empty success}">
        <div class="mb-6 rounded-xl border border-emerald-200 bg-emerald-50
                    px-5 py-4 text-sm text-emerald-800">
            <c:out value="${success}"/>
        </div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="mb-6 rounded-xl border border-red-200 bg-red-50
                    px-5 py-4 text-sm text-red-700">
            <c:out value="${error}"/>
        </div>
    </c:if>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

        <!-- Profile summary -->
        <section class="bg-white border border-slate-200 rounded-2xl p-7 shadow-sm">

            <div class="flex flex-col items-center text-center">
                <div class="w-24 h-24 rounded-3xl bg-blue-100 text-blue-700
                            flex items-center justify-center text-3xl font-bold">
                    <c:choose>
                        <c:when test="${not empty user.firstName}">
                            <c:out value="${user.firstName.substring(0,1).toUpperCase()}"/>
                        </c:when>
                        <c:otherwise>U</c:otherwise>
                    </c:choose>
                </div>

                <h3 class="mt-5 text-xl font-bold text-slate-900">
                    <c:out value="${user.firstName}"/>
                    <c:out value="${user.lastName}"/>
                </h3>

                <p class="mt-1 text-sm text-slate-500 break-all">
                    <c:out value="${user.email}"/>
                </p>

                <c:choose>
                    <c:when test="${user.role == 'ADMIN'}">
                        <span class="mt-4 rounded-full bg-purple-50 px-3 py-1
                                     text-xs font-semibold text-purple-700">
                            Administrateur
                        </span>
                    </c:when>
                    <c:when test="${user.role == 'DOCTOR'}">
                        <span class="mt-4 rounded-full bg-blue-50 px-3 py-1
                                     text-xs font-semibold text-blue-700">
                            Médecin
                        </span>
                    </c:when>
                    <c:when test="${user.role == 'PATIENT'}">
                        <span class="mt-4 rounded-full bg-emerald-50 px-3 py-1
                                     text-xs font-semibold text-emerald-700">
                            Patient
                        </span>
                    </c:when>
                    <c:when test="${user.role == 'STAFF'}">
                        <span class="mt-4 rounded-full bg-amber-50 px-3 py-1
                                     text-xs font-semibold text-amber-700">
                            Personnel
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="mt-4 rounded-full bg-slate-100 px-3 py-1
                                     text-xs font-semibold text-slate-600">
                            <c:out value="${user.role}"/>
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="mt-7 border-t border-slate-100 pt-5 space-y-4">
                <div>
                    <p class="text-xs text-slate-400 uppercase tracking-wide">
                        Téléphone
                    </p>
                    <p class="mt-1 font-medium text-slate-700">
                        <c:choose>
                            <c:when test="${not empty user.phone}">
                                <c:out value="${user.phone}"/>
                            </c:when>
                            <c:otherwise>Non renseigné</c:otherwise>
                        </c:choose>
                    </p>
                </div>

                <div>
                    <p class="text-xs text-slate-400 uppercase tracking-wide">
                        Statut du compte
                    </p>
                    <p class="mt-1 font-medium text-slate-700">
                        <c:choose>
                            <c:when test="${user.active}">
                                Actif
                            </c:when>
                            <c:otherwise>Inactif</c:otherwise>
                        </c:choose>
                    </p>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}${dashboardUrl}"
               class="mt-7 block w-full rounded-xl border border-slate-200
                      px-4 py-3 text-center text-sm font-semibold
                      text-slate-700 hover:bg-slate-50">
                Retour au dashboard
            </a>
        </section>

        <!-- Editable personal information -->
        <section class="lg:col-span-2 bg-white border border-slate-200
                        rounded-2xl p-7 shadow-sm">

            <div class="mb-7">
                <h3 class="text-lg font-bold text-slate-900">
                    Informations personnelles
                </h3>
                <p class="mt-1 text-sm text-slate-500">
                    Modifiez les informations que vous souhaitez mettre à jour.
                </p>
            </div>

            <form method="post"
                  action="${pageContext.request.contextPath}/profile"
                  class="space-y-6">

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-5">
                    <div>
                        <label for="firstName"
                               class="block text-sm font-semibold text-slate-700 mb-2">
                            Prénom
                        </label>
                        <input id="firstName" type="text" name="firstName"
                               value="<c:out value='${user.firstName}'/>"
                               required maxlength="100"
                               class="w-full rounded-xl border border-slate-300 px-4 py-3
                                      outline-none focus:border-blue-500 focus:ring-2
                                      focus:ring-blue-100">
                    </div>

                    <div>
                        <label for="lastName"
                               class="block text-sm font-semibold text-slate-700 mb-2">
                            Nom
                        </label>
                        <input id="lastName" type="text" name="lastName"
                               value="<c:out value='${user.lastName}'/>"
                               required maxlength="100"
                               class="w-full rounded-xl border border-slate-300 px-4 py-3
                                      outline-none focus:border-blue-500 focus:ring-2
                                      focus:ring-blue-100">
                    </div>
                </div>

                <div>
                    <label for="email"
                           class="block text-sm font-semibold text-slate-700 mb-2">
                        Adresse e-mail
                    </label>
                    <input id="email" type="email" name="email"
                           value="<c:out value='${user.email}'/>"
                           required maxlength="255"
                           class="w-full rounded-xl border border-slate-300 px-4 py-3
                                  outline-none focus:border-blue-500 focus:ring-2
                                  focus:ring-blue-100">
                </div>

                <div>
                    <label for="phone"
                           class="block text-sm font-semibold text-slate-700 mb-2">
                        Téléphone
                    </label>
                    <input id="phone" type="tel" name="phone"
                           value="<c:out value='${user.phone}'/>"
                           maxlength="30"
                           class="w-full rounded-xl border border-slate-300 px-4 py-3
                                  outline-none focus:border-blue-500 focus:ring-2
                                  focus:ring-blue-100">
                </div>

                <!-- Doctor-specific information -->
                <c:if test="${user.role == 'DOCTOR'}">
                    <div class="border-t border-slate-200 pt-6">
                        <h4 class="font-bold text-slate-900">
                            Informations professionnelles
                        </h4>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-5 mt-4">
                            <div>
                                <label class="block text-sm font-medium text-slate-600 mb-2">
                                    Matricule
                                </label>
                                <input type="text"
                                       value="<c:out value='${user.matricule}'/>"
                                       readonly
                                       class="w-full rounded-xl bg-slate-100 border border-slate-200
                                              px-4 py-3 text-slate-500">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-slate-600 mb-2">
                                    Spécialité
                                </label>
                                <input type="text"
                                       value="<c:out value='${user.specialty.name}'/>"
                                       readonly
                                       class="w-full rounded-xl bg-slate-100 border border-slate-200
                                              px-4 py-3 text-slate-500">
                            </div>
                        </div>

                        <p class="mt-3 text-xs text-slate-500">
                            Les informations professionnelles sont consultables ici.
                            Contactez l'administration pour les modifier.
                        </p>
                    </div>
                </c:if>

                <!-- Patient-specific information -->
                <c:if test="${user.role == 'PATIENT'}">
                    <div class="border-t border-slate-200 pt-6">
                        <h4 class="font-bold text-slate-900">
                            Informations médicales et administratives
                        </h4>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-5 mt-4">
                            <div>
                                <label class="block text-sm font-medium text-slate-600 mb-2">
                                    CIN
                                </label>
                                <input type="text"
                                       value="<c:out value='${user.cin}'/>"
                                       readonly
                                       class="w-full rounded-xl bg-slate-100 border border-slate-200
                                              px-4 py-3 text-slate-500">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-slate-600 mb-2">
                                    Groupe sanguin
                                </label>
                                <input type="text"
                                       value="<c:out value='${user.bloodGroup}'/>"
                                       readonly
                                       class="w-full rounded-xl bg-slate-100 border border-slate-200
                                              px-4 py-3 text-slate-500">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-slate-600 mb-2">
                                    Date de naissance
                                </label>
                                <input type="text"
                                       value="<c:out value='${user.dateOfBirth}'/>"
                                       readonly
                                       class="w-full rounded-xl bg-slate-100 border border-slate-200
                                              px-4 py-3 text-slate-500">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-slate-600 mb-2">
                                    Genre
                                </label>
                                <input type="text"
                                       value="<c:out value='${user.gender}'/>"
                                       readonly
                                       class="w-full rounded-xl bg-slate-100 border border-slate-200
                                              px-4 py-3 text-slate-500">
                            </div>
                        </div>

                        <div class="mt-5">
                            <label class="block text-sm font-medium text-slate-600 mb-2">
                                Adresse
                            </label>
                            <textarea readonly rows="2"
                                      class="w-full rounded-xl bg-slate-100 border border-slate-200
                                             px-4 py-3 text-slate-500"><c:out value="${user.address}"/></textarea>
                        </div>

                        <p class="mt-3 text-xs text-slate-500">
                            Les données médicales et d'identité sont en lecture seule.
                        </p>
                    </div>
                </c:if>

                <div class="border-t border-slate-200 pt-6 flex justify-end">
                    <button type="submit"
                            class="rounded-xl bg-blue-600 px-6 py-3 text-sm
                                   font-semibold text-white shadow-sm
                                   hover:bg-blue-700 focus:ring-4 focus:ring-blue-100">
                        Enregistrer les modifications
                    </button>
                </div>
            </form>
        </section>

    </div>

    <footer class="mt-10 pb-5 text-center text-xs text-slate-400">
        ClinicManager · Espace personnel sécurisé
    </footer>

</main>
</body>
</html>