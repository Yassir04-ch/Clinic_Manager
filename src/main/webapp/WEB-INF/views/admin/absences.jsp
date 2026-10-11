
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion des absences | ClinicManager</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-50 text-slate-800">

<div class="min-h-screen flex">

  <!-- Sidebar -->
  <aside class="w-64 fixed inset-y-0 left-0 bg-white border-r border-slate-200 flex flex-col">

    <div class="h-20 px-5 flex items-center gap-3 border-b border-slate-200">
      <div class="w-11 h-11 rounded-xl bg-blue-600 text-white font-bold flex items-center justify-center">
        CM
      </div>
      <div>
        <h1 class="font-bold text-slate-900">ClinicManager</h1>
        <p class="text-xs text-slate-500">Administration</p>
      </div>
    </div>

    <nav class="flex-1 p-4 space-y-2 overflow-y-auto">

      <p class="px-3 pt-3 pb-2 text-xs uppercase tracking-wider text-slate-400 font-semibold">
        Principal
      </p>

      <a href="${pageContext.request.contextPath}/dashboard/admin"
         class="block rounded-xl px-4 py-3 text-slate-600 hover:bg-slate-100">
        Dashboard
      </a>

      <p class="px-3 pt-5 pb-2 text-xs uppercase tracking-wider text-slate-400 font-semibold">
        Gestion de la clinique
      </p>

      <a href="${pageContext.request.contextPath}/users/create/patient"
         class="block rounded-xl px-4 py-3 text-slate-600 hover:bg-slate-100">
        Patients
      </a>

      <a href="${pageContext.request.contextPath}/users/create/doctor"
         class="block rounded-xl px-4 py-3 text-slate-600 hover:bg-slate-100">
        Médecins
      </a>

      <a href="${pageContext.request.contextPath}/departments"
         class="block rounded-xl px-4 py-3 text-slate-600 hover:bg-slate-100">
        Départements
      </a>

      <a href="${pageContext.request.contextPath}/specialties"
         class="block rounded-xl px-4 py-3 text-slate-600 hover:bg-slate-100">
        Spécialités
      </a>

      <a href="${pageContext.request.contextPath}/appointments"
         class="block rounded-xl px-4 py-3 text-slate-600 hover:bg-slate-100">
        Rendez-vous
      </a>

      <a href="${pageContext.request.contextPath}/absences/admin"
         class="block rounded-xl px-4 py-3 bg-blue-50 text-blue-700 font-semibold">
        Gestion des absences
      </a>

    </nav>

    <div class="p-4 border-t border-slate-200">
      <a href="${pageContext.request.contextPath}/users/logout"
         class="block rounded-xl px-4 py-3 text-red-600 hover:bg-red-50 font-medium">
        Déconnexion
      </a>
    </div>

  </aside>

  <!-- Main -->
  <div class="flex-1 min-w-0 ml-64">

    <header class="h-20 bg-white border-b border-slate-200 px-8 flex items-center justify-between">
      <div>
        <h2 class="text-xl font-bold text-slate-900">Gestion des absences</h2>
        <p class="text-sm text-slate-500">Validation des demandes des médecins</p>
      </div>

      <div class="w-10 h-10 rounded-full bg-blue-100 text-blue-700 font-bold flex items-center justify-center">
        A
      </div>
    </header>

    <main class="p-6 lg:p-8">

      <!-- Heading -->
      <div class="mb-8">
        <p class="text-sm text-blue-600 font-semibold mb-2">ADMINISTRATION / ABSENCES</p>
        <h1 class="text-3xl font-bold tracking-tight text-slate-900">
          Demandes d'absence
        </h1>
        <p class="mt-2 text-slate-500">
          Consultez les demandes et approuvez ou refusez celles en attente.
        </p>
      </div>

      <!-- Feedback -->
      <c:if test="${not empty success}">
        <div class="mb-6 rounded-xl border border-emerald-200 bg-emerald-50 px-5 py-4 text-emerald-800">
          <c:out value="${success}"/>
        </div>
      </c:if>

      <c:if test="${not empty error}">
        <div class="mb-6 rounded-xl border border-red-200 bg-red-50 px-5 py-4 text-red-800">
          <c:out value="${error}"/>
        </div>
      </c:if>

      <!-- Statistics -->
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-5 mb-8">

        <div class="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <p class="text-sm text-slate-500">Toutes les demandes</p>
          <p id="totalCount" class="mt-3 text-3xl font-bold text-slate-900">0</p>
          <p class="mt-1 text-sm text-slate-400">Demandes enregistrées</p>
        </div>

        <div class="rounded-2xl border border-amber-200 bg-white p-5 shadow-sm">
          <p class="text-sm text-slate-500">En attente</p>
          <p id="pendingCount" class="mt-3 text-3xl font-bold text-amber-600">0</p>
          <p class="mt-1 text-sm text-slate-400">À traiter</p>
        </div>

        <div class="rounded-2xl border border-emerald-200 bg-white p-5 shadow-sm">
          <p class="text-sm text-slate-500">Approuvées</p>
          <p id="approvedCount" class="mt-3 text-3xl font-bold text-emerald-600">0</p>
          <p class="mt-1 text-sm text-slate-400">Demandes acceptées</p>
        </div>

      </div>

      <!-- Table -->
      <section class="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">

        <div class="p-6 border-b border-slate-200 flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">
          <div>
            <h2 class="font-bold text-lg text-slate-900">Liste des demandes</h2>
            <p class="text-sm text-slate-500 mt-1">
              Consultez le médecin, les dates et le statut.
            </p>
          </div>

          <div class="flex flex-col sm:flex-row gap-3">
            <input id="searchInput"
                   type="search"
                   placeholder="Rechercher un médecin..."
                   class="rounded-xl border border-slate-300 px-4 py-2.5 text-sm outline-none focus:ring-2 focus:ring-blue-500">

            <select id="statusFilter"
                    class="rounded-xl border border-slate-300 px-4 py-2.5 text-sm outline-none focus:ring-2 focus:ring-blue-500">
              <option value="ALL">Tous les statuts</option>
              <option value="PENDING">En attente</option>
              <option value="APPROVED">Approuvées</option>
              <option value="REJECTED">Refusées</option>
            </select>
          </div>
        </div>

        <div class="overflow-x-auto">
          <table class="w-full text-left">
            <thead class="bg-slate-50 border-b border-slate-200">
            <tr class="text-xs uppercase tracking-wider text-slate-500">
              <th class="px-6 py-4 font-semibold">Médecin</th>
              <th class="px-6 py-4 font-semibold">Date début</th>
              <th class="px-6 py-4 font-semibold">Date fin</th>
              <th class="px-6 py-4 font-semibold">Motif</th>
              <th class="px-6 py-4 font-semibold">Statut</th>
              <th class="px-6 py-4 font-semibold text-right">Actions</th>
            </tr>
            </thead>

            <tbody id="absenceRows" class="divide-y divide-slate-100">

            <c:choose>
              <c:when test="${not empty absences}">
                <c:forEach var="absence" items="${absences}">
                  <tr class="absence-row hover:bg-slate-50"
                      data-doctor="${absence.doctor.firstName} ${absence.doctor.lastName}"
                      data-status="${absence.status}">

                    <td class="px-6 py-5">
                      <p class="font-semibold text-slate-900">
                        Dr. <c:out value="${absence.doctor.firstName}"/>
                        <c:out value="${absence.doctor.lastName}"/>
                      </p>
                      <p class="mt-1 text-xs text-slate-500">
                        <c:out value="${absence.doctor.email}"/>
                      </p>
                    </td>

                    <td class="px-6 py-5 text-sm whitespace-nowrap text-slate-600">
                      <c:out value="${absence.startDate}"/>
                    </td>

                    <td class="px-6 py-5 text-sm whitespace-nowrap text-slate-600">
                      <c:out value="${absence.endDate}"/>
                    </td>

                    <td class="px-6 py-5 text-sm text-slate-600">
                      <c:choose>
                        <c:when test="${not empty absence.reason}">
                          <c:out value="${absence.reason}"/>
                        </c:when>
                        <c:otherwise>
                          <span class="text-slate-400 italic">Non précisé</span>
                        </c:otherwise>
                      </c:choose>
                    </td>

                    <td class="px-6 py-5">
                      <c:choose>
                        <c:when test="${absence.status == 'PENDING'}">
                                                    <span class="inline-flex rounded-full bg-amber-50 px-3 py-1 text-xs font-semibold text-amber-700">
                                                        PENDING
                                                    </span>
                        </c:when>
                        <c:when test="${absence.status == 'APPROVED'}">
                                                    <span class="inline-flex rounded-full bg-emerald-50 px-3 py-1 text-xs font-semibold text-emerald-700">
                                                        APPROVED
                                                    </span>
                        </c:when>
                        <c:otherwise>
                                                    <span class="inline-flex rounded-full bg-red-50 px-3 py-1 text-xs font-semibold text-red-700">
                                                        REJECTED
                                                    </span>
                        </c:otherwise>
                      </c:choose>
                    </td>

                    <td class="px-6 py-5">
                      <div class="flex justify-end items-center gap-2">

                        <c:if test="${absence.status == 'PENDING'}">

                          <form action="${pageContext.request.contextPath}/absences/approve"
                                method="post"
                                onsubmit="return confirm('Approuver cette demande d’absence ?');">
                            <input type="hidden" name="id" value="${absence.id}">
                            <input type="hidden" name="status" value="APPROVED">

                            <button type="submit"
                                    class="rounded-lg bg-emerald-600 px-3 py-2 text-xs font-semibold text-white hover:bg-emerald-700">
                              Approve
                            </button>
                          </form>

                          <form action="${pageContext.request.contextPath}/absences/rejected"
                                method="post"
                                onsubmit="return confirm('Refuser cette demande d’absence ?');">
                            <input type="hidden" name="id" value="${absence.id}">
                            <input type="hidden" name="status" value="REJECTED">

                            <button type="submit"
                                    class="rounded-lg border border-red-200 bg-white px-3 py-2 text-xs font-semibold text-red-600 hover:bg-red-50">
                              Reject
                            </button>
                          </form>

                        </c:if>

                        <c:if test="${absence.status != 'PENDING'}">
                          <span class="text-xs text-slate-400">Déjà traitée</span>
                        </c:if>

                      </div>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>

              <c:otherwise>
                <tr>
                  <td colspan="6" class="px-6 py-16 text-center">
                    <div class="text-4xl text-slate-300">◷</div>
                    <h3 class="mt-4 font-semibold text-slate-900">
                      Aucune demande d'absence
                    </h3>
                    <p class="mt-2 text-sm text-slate-500">
                      Les demandes des médecins apparaîtront ici.
                    </p>
                  </td>
                </tr>
              </c:otherwise>
            </c:choose>

            <tr id="noResultsRow" class="hidden">
              <td colspan="6" class="px-6 py-10 text-center text-sm text-slate-500">
                Aucune demande ne correspond à votre recherche.
              </td>
            </tr>

            </tbody>
          </table>
        </div>

        <div class="px-6 py-4 border-t border-slate-200 text-sm text-slate-500">
          Demandes affichées : <span id="visibleCount">0</span>
        </div>

      </section>

      <footer class="text-center text-sm text-slate-400 mt-8">
        ClinicManager &copy; Administration
      </footer>

    </main>
  </div>
</div>

<script>
  const rows = Array.from(document.querySelectorAll(".absence-row"));
  const searchInput = document.getElementById("searchInput");
  const statusFilter = document.getElementById("statusFilter");
  const noResultsRow = document.getElementById("noResultsRow");

  document.getElementById("totalCount").textContent = rows.length;
  document.getElementById("pendingCount").textContent =
          rows.filter(row => row.dataset.status === "PENDING").length;
  document.getElementById("approvedCount").textContent =
          rows.filter(row => row.dataset.status === "APPROVED").length;

  function filterRows() {
    const search = searchInput.value.toLowerCase().trim();
    const selectedStatus = statusFilter.value;
    let visible = 0;

    rows.forEach(row => {
      const doctor = (row.dataset.doctor || "").toLowerCase();
      const status = (row.dataset.status || "").toUpperCase();

      const matchesSearch = doctor.includes(search);
      const matchesStatus =
              selectedStatus === "ALL" || status === selectedStatus;

      const show = matchesSearch && matchesStatus;
      row.classList.toggle("hidden", !show);

      if (show) visible++;
    });

    document.getElementById("visibleCount").textContent = visible;
    noResultsRow.classList.toggle("hidden", visible !== 0);
  }

  searchInput.addEventListener("input", filterRows);
  statusFilter.addEventListener("change", filterRows);

  filterRows();
</script>

</body>
</html>