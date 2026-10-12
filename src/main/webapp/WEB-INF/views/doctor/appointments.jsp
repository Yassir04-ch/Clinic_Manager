<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Mes rendez-vous | ClinicManager</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">

  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: #f8fafc;
    }

    .status-badge {
      display: inline-flex;
      align-items: center;
      padding: 5px 11px;
      border-radius: 999px;
      font-size: 12px;
      font-weight: 600;
      white-space: nowrap;
    }

    .status-PENDING {
      background: #fef3c7;
      color: #92400e;
    }

    .status-PLANNED,
    .status-CONFIRMED {
      background: #dcfce7;
      color: #166534;
    }

    .status-CANCELLED,
    .status-REJECTED {
      background: #fee2e2;
      color: #991b1b;
    }

    .status-COMPLETED {
      background: #dbeafe;
      color: #1e40af;
    }

    .type-badge {
      display: inline-flex;
      padding: 5px 10px;
      border-radius: 8px;
      background: #eef2ff;
      color: #4338ca;
      font-size: 12px;
      font-weight: 600;
    }
  </style>
</head>

<body class="min-h-screen text-slate-800">

<div class="min-h-screen">

  <!-- Header -->
  <header class="bg-white border-b border-slate-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-5">
      <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">

        <div class="flex items-center gap-3">
          <div class="w-12 h-12 rounded-xl bg-indigo-600 text-white
                                flex items-center justify-center shadow-sm">
            <svg xmlns="http://www.w3.org/2000/svg"
                 width="25" height="25" viewBox="0 0 24 24"
                 fill="none" stroke="currentColor" stroke-width="2"
                 stroke-linecap="round" stroke-linejoin="round">
              <rect x="3" y="4" width="18" height="17" rx="2"/>
              <path d="M16 2v4M8 2v4M3 10h18"/>
              <path d="M12 14v4M10 16h4"/>
            </svg>
          </div>

          <div>
            <h1 class="text-2xl font-bold tracking-tight text-slate-900">
              Mes rendez-vous
            </h1>
            <p class="text-sm text-slate-500 mt-1">
              Consultez les rendez-vous de vos patients
            </p>
          </div>
        </div>

        <div class="flex items-center gap-2 text-sm text-slate-500">
          <span class="w-2 h-2 rounded-full bg-emerald-500"></span>
          Espace médecin
        </div>

      </div>
    </div>
  </header>

  <!-- Main content -->
  <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <!-- Statistics -->
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-5 mb-7">

      <div class="bg-white border border-slate-200 rounded-2xl p-5 shadow-sm">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm font-medium text-slate-500">
              Total des rendez-vous
            </p>
            <p class="text-3xl font-bold text-slate-900 mt-2">
              <c:out value="${empty appointments ? 0 : appointments.size()}"/>
            </p>
          </div>

          <div class="w-12 h-12 rounded-xl bg-indigo-50 text-indigo-600
                                flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg"
                 width="24" height="24" viewBox="0 0 24 24"
                 fill="none" stroke="currentColor" stroke-width="2">
              <rect x="3" y="4" width="18" height="17" rx="2"/>
              <path d="M16 2v4M8 2v4M3 10h18"/>
            </svg>
          </div>
        </div>
      </div>

      <div class="bg-white border border-slate-200 rounded-2xl p-5 shadow-sm">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-sm font-medium text-slate-500">
              En attente
            </p>
            <p class="text-3xl font-bold text-amber-600 mt-2">
              <c:set var="pendingCount" value="0"/>
              <c:forEach var="appointment" items="${appointments}">
                <c:if test="${appointment.status == 'PENDING'}">
                  <c:set var="pendingCount" value="${pendingCount + 1}"/>
                </c:if>
              </c:forEach>
              <c:out value="${pendingCount}"/>
            </p>
          </div>

          <div class="w-12 h-12 rounded-xl bg-amber-50 text-amber-600
                                flex items-center justify-center">
            <svg xmlns="http://www.w3.org/2000/svg"
                 width="24" height="24" viewBox="0 0 24 24"
                 fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"/>
              <path d="M12 6v6l4 2"/>
            </svg>
          </div>
        </div>
      </div>

    </div>

    <!-- Appointments table -->
    <section class="bg-white border border-slate-200 rounded-2xl shadow-sm overflow-hidden">

      <div class="px-5 sm:px-6 py-5 border-b border-slate-200
                        flex flex-col md:flex-row md:items-center md:justify-between gap-4">

        <div>
          <h2 class="text-lg font-bold text-slate-900">
            Liste des rendez-vous
          </h2>
          <p class="text-sm text-slate-500 mt-1">
            Informations concernant vos consultations
          </p>
        </div>

        <div class="relative w-full md:w-80">
          <svg xmlns="http://www.w3.org/2000/svg"
               class="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400"
               width="18" height="18" viewBox="0 0 24 24"
               fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="11" cy="11" r="8"/>
            <path d="m21 21-4.35-4.35"/>
          </svg>

          <input type="text"
                 id="searchInput"
                 placeholder="Rechercher un patient..."
                 class="w-full pl-10 pr-4 py-2.5 rounded-xl border border-slate-200
                                  text-sm outline-none focus:ring-2 focus:ring-indigo-500
                                  focus:border-indigo-500">
        </div>

      </div>

      <c:choose>
        <c:when test="${empty appointments}">

          <div class="px-6 py-16 text-center">
            <div class="w-16 h-16 mx-auto rounded-2xl bg-slate-100
                                    flex items-center justify-center text-slate-400">
              <svg xmlns="http://www.w3.org/2000/svg"
                   width="30" height="30" viewBox="0 0 24 24"
                   fill="none" stroke="currentColor" stroke-width="1.7">
                <rect x="3" y="4" width="18" height="17" rx="2"/>
                <path d="M16 2v4M8 2v4M3 10h18"/>
              </svg>
            </div>

            <h3 class="text-lg font-semibold text-slate-800 mt-4">
              Aucun rendez-vous
            </h3>

            <p class="text-sm text-slate-500 mt-2">
              Vous n'avez aucun rendez-vous à afficher pour le moment.
            </p>
          </div>

        </c:when>

        <c:otherwise>

          <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-slate-200">

              <thead class="bg-slate-50">
              <tr>
                <th class="px-6 py-4 text-left text-xs font-semibold
                                           uppercase tracking-wider text-slate-500">
                  Patient
                </th>

                <th class="px-6 py-4 text-left text-xs font-semibold
                                           uppercase tracking-wider text-slate-500">
                  Date
                </th>

                <th class="px-6 py-4 text-left text-xs font-semibold
                                           uppercase tracking-wider text-slate-500">
                  Horaire
                </th>

                <th class="px-6 py-4 text-left text-xs font-semibold
                                           uppercase tracking-wider text-slate-500">
                  Type
                </th>

                <th class="px-6 py-4 text-left text-xs font-semibold
                                           uppercase tracking-wider text-slate-500">
                  Motif
                </th>

                <th class="px-6 py-4 text-left text-xs font-semibold
                                           uppercase tracking-wider text-slate-500">
                  Statut
                </th>
              </tr>
              </thead>

              <tbody id="appointmentsTable"
                     class="divide-y divide-slate-100 bg-white">

              <c:forEach var="appointment" items="${appointments}">

                <tr class="appointment-row hover:bg-slate-50 transition-colors">

                  <!-- Patient -->
                  <td class="px-6 py-4 whitespace-nowrap">
                    <div class="flex items-center gap-3">
                      <di class="w-10 h-10 rounded-full bg-indigo-100 text-indigo-700 flex items-center justify-center font-bold text-sm">
                        <c:out value="${empty appointment.patient.firstName? '?' : appointment.patient.firstName.substring(0,1)}"/>
                      </di>

                      <div>
                        <p class="text-sm font-semibold text-slate-900 patient-name">
                          <c:out value="${appointment.patient.firstName}"/>
                          <c:out value="${appointment.patient.lastName}"/>
                        </p>
                        <p class="text-xs text-slate-500">
                          <c:out value="${appointment.patient.email}"/>
                        </p>
                      </div>
                    </div>
                  </td>

                  <!-- Date -->
                  <td class="px-6 py-4 whitespace-nowrap text-sm text-slate-700">
                    <c:out value="${appointment.date}"/>
                  </td>

                  <!-- Time -->
                  <td class="px-6 py-4 whitespace-nowrap">
                    <div class="text-sm font-medium text-slate-800">
                      <c:out value="${appointment.startTime}"/>
                      -
                      <c:out value="${appointment.endTime}"/>
                    </div>
                  </td>

                  <!-- Type -->
                  <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="type-badge">
                                            <c:out value="${appointment.type}"/>
                                        </span>
                  </td>

                  <!-- Reason -->
                  <td class="px-6 py-4 text-sm text-slate-600 max-w-xs">
                                        <span class="block truncate"
                                              title="<c:out value='${appointment.reason}'/>">
                                            <c:choose>
                                              <c:when test="${not empty appointment.reason}">
                                                <c:out value="${appointment.reason}"/>
                                              </c:when>
                                              <c:otherwise>
                                                <span class="text-slate-400">Non renseigné</span>
                                              </c:otherwise>
                                            </c:choose>
                                        </span>
                  </td>

                  <!-- Status -->
                  <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="status-badge status-${appointment.status}">
                                            <c:out value="${appointment.status}"/>
                                        </span>
                  </td>

                </tr>

              </c:forEach>

              </tbody>
            </table>
          </div>

          <div id="noSearchResults" class="hidden px-6 py-10 text-center">
            <p class="text-sm text-slate-500">
              Aucun rendez-vous ne correspond à votre recherche.
            </p>
          </div>

          <div class="px-6 py-4 border-t border-slate-100 bg-slate-50">
            <p class="text-sm text-slate-500">
              Nombre de rendez-vous :
              <span class="font-semibold text-slate-800">
                                <c:out value="${appointments.size()}"/>
                            </span>
            </p>
          </div>

        </c:otherwise>
      </c:choose>

    </section>

  </main>

</div>

<script>
  const searchInput = document.getElementById("searchInput");
  const rows = document.querySelectorAll(".appointment-row");
  const noResults = document.getElementById("noSearchResults");

  if (searchInput) {
    searchInput.addEventListener("input", function () {
      const searchValue = this.value.toLowerCase().trim();
      let visibleRows = 0;

      rows.forEach(function (row) {
        const patientName = row.querySelector(".patient-name")
                .textContent.toLowerCase();

        const matches = patientName.includes(searchValue);

        row.style.display = matches ? "" : "none";

        if (matches) {
          visibleRows++;
        }
      });

      if (noResults) {
        noResults.classList.toggle("hidden", visibleRows !== 0);
      }
    });
  }
</script>

</body>
</html>
