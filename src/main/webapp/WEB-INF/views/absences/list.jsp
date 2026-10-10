
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mes absences - ClinicManager</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen bg-gray-50 text-gray-800">

<div class="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">

  <div class="mb-8 flex flex-col justify-between gap-4 sm:flex-row sm:items-center">
    <div>
      <h1 class="text-3xl font-bold text-gray-900">Mes absences</h1>
      <p class="mt-2 text-gray-500">
        Consultez et gérez vos demandes d'absence.
      </p>
    </div>

    <div class="flex gap-3">
      <a href="${pageContext.request.contextPath}/dashboard"
         class="rounded-lg border border-gray-300 bg-white px-4 py-2 font-medium hover:bg-gray-100">
        Dashboard
      </a>

      <a href="${pageContext.request.contextPath}/absences/create"
         class="rounded-lg bg-blue-600 px-4 py-2 font-medium text-white hover:bg-blue-700">
        + Déclarer une absence
      </a>
    </div>
  </div>

  <c:if test="${param.success == 'created'}">
    <div class="mb-5 rounded-lg border border-green-200 bg-green-50 p-4 text-green-800">
      Votre demande d'absence a été créée avec succès.
    </div>
  </c:if>

  <c:if test="${param.success == 'cancelled'}">
    <div class="mb-5 rounded-lg border border-green-200 bg-green-50 p-4 text-green-800">
      Votre demande d'absence a été annulée.
    </div>
  </c:if>

  <c:if test="${not empty error}">
    <div class="mb-5 rounded-lg border border-red-200 bg-red-50 p-4 text-red-700">
      <c:out value="${error}"/>
    </div>
  </c:if>

  <div class="overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm">

    <c:choose>
      <c:when test="${empty absences}">
        <div class="px-6 py-16 text-center">
          <h2 class="text-xl font-semibold text-gray-800">
            Aucune absence
          </h2>
          <p class="mt-2 text-gray-500">
            Vous n'avez pas encore déclaré d'absence.
          </p>
          <a href="${pageContext.request.contextPath}/absences/create"
             class="mt-5 inline-block rounded-lg bg-blue-600 px-5 py-2.5 text-white hover:bg-blue-700">
            Déclarer une absence
          </a>
        </div>
      </c:when>

      <c:otherwise>
        <div class="overflow-x-auto">
          <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
            <tr>
              <th class="px-6 py-4 text-left text-xs font-semibold uppercase text-gray-500">
                Date de début
              </th>
              <th class="px-6 py-4 text-left text-xs font-semibold uppercase text-gray-500">
                Date de fin
              </th>
              <th class="px-6 py-4 text-left text-xs font-semibold uppercase text-gray-500">
                Durée
              </th>
              <th class="px-6 py-4 text-left text-xs font-semibold uppercase text-gray-500">
                Motif
              </th>
              <th class="px-6 py-4 text-left text-xs font-semibold uppercase text-gray-500">
                Statut
              </th>
              <th class="px-6 py-4 text-left text-xs font-semibold uppercase text-gray-500">
                Actions
              </th>
            </tr>
            </thead>

            <tbody class="divide-y divide-gray-100">
            <c:forEach var="absence" items="${absences}">
              <tr class="hover:bg-gray-50">

                <td class="whitespace-nowrap px-6 py-4">
                  <c:out value="${absence.startDate}"/>
                </td>

                <td class="whitespace-nowrap px-6 py-4">
                  <c:out value="${absence.endDate}"/>
                </td>

                <td class="whitespace-nowrap px-6 py-4">
                  <c:out value="${absence.startDate.until(absence.endDate).days + 1}"/> jours
                </td>

                <td class="max-w-xs px-6 py-4">
                  <c:choose>
                    <c:when test="${not empty absence.reason}">
                      <c:out value="${absence.reason}"/>
                    </c:when>
                    <c:otherwise>
                      <span class="text-gray-400">Non précisé</span>
                    </c:otherwise>
                  </c:choose>
                </td>

                <td class="whitespace-nowrap px-6 py-4">
                  <c:choose>
                    <c:when test="${absence.status == 'PENDING'}">
                                            <span class="rounded-full bg-yellow-100 px-3 py-1 text-xs font-semibold text-yellow-800">
                                                En attente
                                            </span>
                    </c:when>
                    <c:when test="${absence.status == 'APPROVED'}">
                                            <span class="rounded-full bg-green-100 px-3 py-1 text-xs font-semibold text-green-800">
                                                Approuvée
                                            </span>
                    </c:when>
                    <c:when test="${absence.status == 'REJECTED'}">
                                            <span class="rounded-full bg-red-100 px-3 py-1 text-xs font-semibold text-red-800">
                                                Rejetée
                                            </span>
                    </c:when>
                    <c:when test="${absence.status == 'CANCELLED'}">
                                            <span class="rounded-full bg-gray-100 px-3 py-1 text-xs font-semibold text-gray-600">
                                                Annulée
                                            </span>
                    </c:when>
                  </c:choose>
                </td>

                <td class="whitespace-nowrap px-6 py-4">
                  <c:if test="${absence.status == 'PENDING'}">
                    <form method="post"
                          action="${pageContext.request.contextPath}/absences/cancel/${absence.id}"
                          onsubmit="return confirm('Voulez-vous vraiment annuler cette demande ?');">
                      <button type="submit"
                              class="rounded-lg border border-red-200 px-3 py-2 text-sm font-medium text-red-600 hover:bg-red-50">
                        Annuler
                      </button>
                    </form>
                  </c:if>
                </td>

              </tr>
            </c:forEach>
            </tbody>
          </table>
        </div>
      </c:otherwise>
    </c:choose>

  </div>
</div>

</body>
</html>