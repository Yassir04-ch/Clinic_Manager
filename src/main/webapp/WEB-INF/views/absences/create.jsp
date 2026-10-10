
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Déclarer une absence - ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-50 text-gray-800">

<div class="mx-auto max-w-3xl px-4 py-10 sm:px-6">

    <a href="${pageContext.request.contextPath}/absences"
       class="text-sm font-medium text-blue-600 hover:text-blue-800">
        ← Retour à mes absences
    </a>

    <div class="mt-6 rounded-xl border border-gray-200 bg-white p-6 shadow-sm sm:p-8">

        <h1 class="text-2xl font-bold text-gray-900">
            Déclarer une absence
        </h1>

        <p class="mt-2 text-sm text-gray-500">
            Remplissez les informations ci-dessous. Votre demande sera envoyée à l'administration.
        </p>

        <c:if test="${not empty error}">
            <div class="mt-5 rounded-lg border border-red-200 bg-red-50 p-4 text-sm text-red-700">
                <c:out value="${error}"/>
            </div>
        </c:if>

        <form method="post"
              action="${pageContext.request.contextPath}/absences/create"
              class="mt-8 space-y-6">

            <div>
                <label for="startDate" class="mb-2 block text-sm font-medium text-gray-700">
                    Date de début <span class="text-red-500">*</span>
                </label>

                <input type="date"
                       id="startDate"
                       name="startDate"
                       required
                       value="<c:out value='${param.startDate}'/>"
                       class="w-full rounded-lg border border-gray-300 px-4 py-3 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-100">
            </div>

            <div>
                <label for="endDate" class="mb-2 block text-sm font-medium text-gray-700">
                    Date de fin <span class="text-red-500">*</span>
                </label>

                <input type="date"
                       id="endDate"
                       name="endDate"
                       required
                       value="<c:out value='${param.endDate}'/>"
                       class="w-full rounded-lg border border-gray-300 px-4 py-3 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-100">
            </div>

            <div>
                <label for="reason" class="mb-2 block text-sm font-medium text-gray-700">
                    Motif
                </label>

                <textarea id="reason"
                          name="reason"
                          rows="4"
                          maxlength="500"
                          placeholder="Précisez le motif si nécessaire..."
                          class="w-full rounded-lg border border-gray-300 px-4 py-3 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-100"><c:out value="${param.reason}"/></textarea>

                <p class="mt-1 text-xs text-gray-500">
                    Facultatif — 500 caractères maximum.
                </p>
            </div>

            <div class="rounded-lg bg-blue-50 p-4 text-sm text-blue-800">
                Votre demande sera enregistrée avec le statut
                <strong>En attente</strong> jusqu'à la décision de l'administration.
            </div>

            <div class="flex flex-col-reverse gap-3 sm:flex-row sm:justify-end">
                <a href="${pageContext.request.contextPath}/absences"
                   class="rounded-lg border border-gray-300 px-5 py-3 text-center font-medium hover:bg-gray-50">
                    Annuler
                </a>

                <button type="submit"
                        class="rounded-lg bg-blue-600 px-5 py-3 font-medium text-white hover:bg-blue-700">
                    Envoyer la demande
                </button>
            </div>

        </form>
    </div>
</div>

<script>
    const startDate = document.getElementById("startDate");
    const endDate = document.getElementById("endDate");

    startDate.addEventListener("change", function () {
        endDate.min = startDate.value;
    });

    endDate.addEventListener("change", function () {
        if (startDate.value && endDate.value < startDate.value) {
            endDate.setCustomValidity(
                "La date de fin doit être égale ou postérieure à la date de début."
            );
        } else {
            endDate.setCustomValidity("");
        }
    });

    if (startDate.value) {
        endDate.min = startDate.value;
    }
</script>

</body>
</html>