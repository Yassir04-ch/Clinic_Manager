<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments Management | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-50 text-slate-800">

<div class="min-h-screen flex">

    <!-- Sidebar -->
    <aside class="fixed inset-y-0 left-0 z-30 flex w-64 flex-col border-r border-slate-200 bg-white">

        <div class="flex h-20 items-center gap-3 border-b border-slate-200 px-6">
            <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-blue-600 text-lg font-bold text-white">
                CM
            </div>
            <div>
                <h1 class="font-bold text-slate-900">ClinicManager</h1>
                <p class="text-xs text-slate-500">Staff Panel</p>
            </div>
        </div>

        <nav class="flex-1 overflow-y-auto px-4 py-6">
            <p class="mb-3 px-3 text-xs font-semibold uppercase tracking-wider text-slate-400">
                Main menu
            </p>

            <a href="${pageContext.request.contextPath}/dashboard/staff"
               class="mb-2 flex items-center gap-3 rounded-xl px-3 py-3 text-slate-600 hover:bg-slate-100">
                Dashboard
            </a>

            <p class="mb-3 mt-7 px-3 text-xs font-semibold uppercase tracking-wider text-slate-400">
                Clinic management
            </p>

            <a href="${pageContext.request.contextPath}/appointments"
               class="flex items-center gap-3 rounded-xl bg-blue-50 px-3 py-3 font-semibold text-blue-700">
                Appointments
            </a>
        </nav>

        <div class="border-t border-slate-200 p-4">
            <a href="${pageContext.request.contextPath}/users/logout"
               class="flex items-center gap-3 rounded-xl px-3 py-3 font-medium text-red-600 hover:bg-red-50">
                Logout
            </a>
        </div>
    </aside>

    <!-- Main -->
    <div class="ml-64 min-w-0 flex-1">

        <header class="flex h-20 items-center justify-between border-b border-slate-200 bg-white px-8">
            <div>
                <h2 class="text-xl font-bold text-slate-900">Appointments Management</h2>
                <p class="text-sm text-slate-500">Manage and monitor clinic appointments</p>
            </div>

            <div class="flex h-10 w-10 items-center justify-center rounded-full bg-blue-100 font-bold text-blue-700">
                A
            </div>
        </header>

        <main class="mx-auto max-w-screen-2xl p-6 lg:p-8">

            <div class="mb-8">
                <p class="mb-2 text-sm font-semibold uppercase tracking-wider text-blue-600">
                    Clinic management
                </p>
                <h1 class="text-3xl font-bold tracking-tight text-slate-900">
                    All Appointments
                </h1>
                <p class="mt-2 text-slate-500">
                    View appointment details and update their status.
                </p>
            </div>

            <!-- Feedback -->
            <c:if test="${not empty success}">
                <div class="mb-5 rounded-xl border border-emerald-200 bg-emerald-50 px-4 py-3 text-emerald-800">
                    <c:out value="${success}"/>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="mb-5 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-red-800">
                    <c:out value="${error}"/>
                </div>
            </c:if>

            <!-- Summary cards -->
            <section class="mb-8 grid grid-cols-1 gap-5 sm:grid-cols-2 xl:grid-cols-4">

                <div class="rounded-2xl border border-slate-200 bg-white p-5">
                    <p class="text-sm font-medium text-slate-500">Total appointments</p>
                    <p class="mt-3 text-3xl font-bold text-slate-900">
                        <c:out value="${appointments.size()}"/>
                    </p>
                </div>

                <div class="rounded-2xl border border-slate-200 bg-white p-5">
                    <p class="text-sm font-medium text-slate-500">Pending</p>
                    <p id="pendingCount" class="mt-3 text-3xl font-bold text-amber-600">0</p>
                </div>

                <div class="rounded-2xl border border-slate-200 bg-white p-5">
                    <p class="text-sm font-medium text-slate-500">Confirmed</p>
                    <p id="confirmedCount" class="mt-3 text-3xl font-bold text-emerald-600">0</p>
                </div>

                <div class="rounded-2xl border border-slate-200 bg-white p-5">
                    <p class="text-sm font-medium text-slate-500">Completed</p>
                    <p id="completedCount" class="mt-3 text-3xl font-bold text-blue-600">0</p>
                </div>

            </section>

            <!-- Appointment list -->
            <section class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm">

                <div class="flex flex-col gap-4 border-b border-slate-200 p-6 lg:flex-row lg:items-center lg:justify-between">
                    <div>
                        <h2 class="text-lg font-bold text-slate-900">Appointment list</h2>
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-left">
                        <thead class="border-b border-slate-200 bg-slate-50">
                        <tr class="text-xs uppercase tracking-wider text-slate-500">
                            <th class="px-5 py-4">Patient</th>
                            <th class="px-5 py-4">Doctor</th>
                            <th class="px-5 py-4">Date & time</th>
                            <th class="px-5 py-4">Type</th>
                            <th class="px-5 py-4">Reason</th>
                            <th class="px-5 py-4">Status</th>
                            <th class="px-5 py-4 text-right">Update status</th>
                        </tr>
                        </thead>


                        <tbody id="appointmentTableBody" class="divide-y divide-slate-100">

                        <c:choose>
                            <c:when test="${not empty appointments}">
                                <c:forEach var="appointment" items="${appointments}">

                                    <tr class="transition hover:bg-blue-50/50">

                                        <td class="whitespace-nowrap px-5 py-5">
                                            <p class="font-semibold text-slate-900">
                                                    ${appointment.getPatient().getFirstName()}
                                                    ${appointment.getPatient().getLastName()}
                                            </p>
                                            <p class="mt-1 text-xs text-slate-500">
                                                    ${appointment.getPatient().getEmail()}
                                            </p>
                                        </td>

                                        <td class="whitespace-nowrap px-5 py-5">
                                            <p class="font-semibold text-slate-900">
                                                Dr. ${appointment.getDoctor().getFirstName()}
                                                    ${appointment.getDoctor().getLastName()}
                                            </p>
                                            <p class="mt-1 text-xs text-slate-500">
                                                    ${appointment.getDoctor().getTitle()}
                                            </p>
                                        </td>

                                        <td class="whitespace-nowrap px-5 py-5">
                                            <p class="text-sm font-medium text-slate-800">
                                                    ${appointment.date}
                                            </p>
                                            <p class="mt-1 text-xs text-slate-500">
                                                    ${appointment.startTime} - ${appointment.endTime}
                                            </p>
                                        </td>

                                        <td class="whitespace-nowrap px-5 py-5">
                                                ${appointment.type}
                                        </td>

                                        <td class="max-w-xs px-5 py-5">
                                            <p class="max-w-[200px] truncate text-sm text-slate-600"
                                               title="${appointment.reason}">
                                                    ${appointment.reason}
                                            </p>
                                        </td>

                                        <td class="whitespace-nowrap px-5 py-5">
                                                ${appointment.status}
                                        </td>
                                        <td class="whitespace-nowrap px-5 py-5">
                                            <form action="${pageContext.request.contextPath}/appointments/status"
                                                  method="post"
                                                  class="flex items-center gap-2">

                                                <input type="hidden"
                                                       name="appointmentId"
                                                       value="${appointment.id}"/>

                                                <select name="status"
                                                        class="rounded-lg border border-slate-300 bg-white px-3 py-2 text-sm
                                                        focus:border-blue-500 focus:outline-none">

                                                    <option value="PENDING"
                                                        ${appointment.status == 'PENDING' ? 'selected' : ''}>
                                                        Pending
                                                    </option>

                                                    <option value="PLANNED"
                                                        ${appointment.status == 'PLANNED' ? 'selected' : ''}>
                                                        Planned
                                                    </option>

                                                    <option value="DONE"
                                                        ${appointment.status == 'DONE' ? 'selected' : ''}>
                                                        Done
                                                    </option>

                                                    <option value="REJECTED"
                                                        ${appointment.status == 'REJECTED' ? 'selected' : ''}>
                                                        Rejected
                                                    </option>

                                                    <option value="CANCELED"
                                                        ${appointment.status == 'CANCELED' ? 'selected' : ''}>
                                                        Canceled
                                                    </option>
                                                </select>

                                                <button type="submit"
                                                        class="rounded-lg bg-blue-600 px-3 py-2 text-sm font-semibold text-white
                                                         transition hover:bg-blue-700">
                                                    Update
                                                </button>
                                            </form>
                                        </td>


                                    </tr>

                                </c:forEach>
                            </c:when>

                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="px-6 py-16 text-center">
                                        <h3 class="font-semibold text-slate-900">
                                            No appointments found
                                        </h3>
                                        <p class="mt-1 text-sm text-slate-500">
                                            No appointments are available.
                                        </p>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>

                        </tbody>
                    </table>
                </div>

                <div class="border-t border-slate-200 px-6 py-4 text-sm text-slate-500">
                    Showing <span id="visibleCount">0</span> appointment(s)
                </div>

            </section>

        </main>
    </div>
</div>
</body>
</html>
