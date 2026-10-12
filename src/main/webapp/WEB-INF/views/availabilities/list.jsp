<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Availability - Clinic Manager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 text-gray-800">

<div class="min-h-screen flex">

    <!-- SIDEBAR -->
    <aside class="w-64 bg-white border-r border-gray-200 flex flex-col">
        <div class="h-20 flex items-center px-6 border-b border-gray-200">
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-blue-600 rounded-xl flex items-center justify-center">
                    <span class="text-white font-bold text-lg">CM</span>
                </div>
                <div>
                    <h1 class="font-bold text-gray-900">Clinic Manager</h1>
                    <p class="text-xs text-gray-500">Doctor Panel</p>
                </div>
            </div>
        </div>

        <nav class="flex-1 px-4 py-6">
            <p class="text-xs font-semibold text-gray-400 uppercase tracking-wider px-3 mb-4">
                Menu
            </p>

            <a href="${pageContext.request.contextPath}/dashboard/doctor"
               class="flex items-center gap-3 px-3 py-3 rounded-lg text-gray-600 hover:bg-gray-100">
                <span>🏠</span> Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/appointments"
               class="flex items-center gap-3 px-3 py-3 rounded-lg text-gray-600 hover:bg-gray-100">
                <span>📅</span> Appointments
            </a>

            <a href="${pageContext.request.contextPath}/availabilities"
               class="flex items-center gap-3 px-3 py-3 rounded-lg bg-blue-50 text-blue-700 font-semibold">
                <span>🕐</span> My Availability
            </a>

            <a href="${pageContext.request.contextPath}/profile"
               class="flex items-center gap-3 px-3 py-3 rounded-lg text-gray-600 hover:bg-gray-100">
                <span>👤</span> My Profile
            </a>
        </nav>

        <div class="p-4 border-t border-gray-200">
            <a href="${pageContext.request.contextPath}/users/logout"
               class="flex items-center gap-3 px-3 py-3 rounded-lg text-red-600 hover:bg-red-50">
                <span>↪</span> Logout
            </a>
        </div>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="flex-1 min-w-0">

        <header class="min-h-20 bg-white border-b border-gray-200 flex flex-wrap items-center justify-between gap-4 px-8 py-5">
            <div>
                <h2 class="text-2xl font-bold text-gray-900">My Availability</h2>
                <p class="text-sm text-gray-500 mt-1">
                    Manage your working hours and available time slots.
                </p>
            </div>

            <a href="${pageContext.request.contextPath}/availabilities/create"
               class="inline-flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-3 rounded-lg">
                <span class="text-xl">+</span>
                Add Availability
            </a>
        </header>

        <div class="p-8">

            <!-- INFORMATION -->
            <div class="bg-blue-50 border border-blue-100 rounded-xl p-5 mb-6">
                <h3 class="font-semibold text-blue-900">Availability management</h3>
                <p class="text-sm text-blue-700 mt-1">
                    Define the days and time periods when you are available.
                </p>
            </div>

            <!-- AVAILABILITY TABLE -->
            <div class="bg-white border border-gray-200 rounded-xl shadow-sm">

                <div class="px-6 py-5 border-b border-gray-200 flex flex-wrap items-center justify-between gap-3">
                    <div>
                        <h3 class="text-lg font-semibold text-gray-900">Your Availability</h3>
                        <p class="text-sm text-gray-500 mt-1">
                            Your configured working hours.
                        </p>
                    </div>

                    <div class="bg-blue-50 text-blue-700 px-4 py-2 rounded-lg text-sm font-semibold">
                        ${fn:length(availabilities)} availabilities
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-sm">

                        <thead class="bg-gray-50 border-b border-gray-200">
                        <tr>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase">Day</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase">Start Time</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase">End Time</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase">Valid From</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase">Valid To</th>
                            <th class="px-6 py-4 text-left text-xs font-semibold text-gray-500 uppercase">Status</th>
                            <th class="px-6 py-4 text-right text-xs font-semibold text-gray-500 uppercase">Actions</th>
                        </tr>
                        </thead>

                        <tbody class="divide-y divide-gray-200">

                        <c:choose>
                            <c:when test="${not empty availabilities}">

                                <c:forEach var="availability" items="${availabilities}">
                                    <tr class="hover:bg-gray-50">

                                        <td class="px-6 py-5 font-semibold text-gray-800">
                                            <c:out value="${availability.dayOfWeek}" />
                                        </td>

                                        <td class="px-6 py-5">
                                            <c:out value="${availability.startTime}" />
                                        </td>

                                        <td class="px-6 py-5">
                                            <c:out value="${availability.endTime}" />
                                        </td>

                                        <td class="px-6 py-5">
                                            <c:out value="${availability.validFrom}" />
                                        </td>

                                        <td class="px-6 py-5">
                                            <c:out value="${availability.validTo}" />
                                        </td>

                                        <td class="px-6 py-5">
                                            <c:choose>
                                                <c:when test="${availability.status == 'ACTIVE'}">
                                                    <span class="inline-flex px-3 py-1.5 rounded-full bg-green-100 text-green-700 text-xs font-semibold">
                                                        Active
                                                    </span>
                                                </c:when>

                                                <c:otherwise>
                                                    <span class="inline-flex px-3 py-1.5 rounded-full bg-red-100 text-red-700 text-xs font-semibold">
                                                        Inactive
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <td class="px-6 py-5">
                                            <div class="flex items-center justify-end gap-2">
                                                <a href="${pageContext.request.contextPath}/availabilities/update/${availability.id}"
                                                   class="px-3 py-2 text-blue-600 hover:bg-blue-50 rounded-lg">
                                                    Edit
                                                </a>

                                                <a href="${pageContext.request.contextPath}/availabilities/delete/${availability.id}"
                                                   onclick="return confirm('Are you sure you want to delete this availability?');"
                                                   class="px-3 py-2 text-red-600 hover:bg-red-50 rounded-lg">
                                                    Delete
                                                </a>
                                            </div>
                                        </td>

                                    </tr>
                                </c:forEach>

                            </c:when>

                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="px-6 py-12 text-center">
                                        <div class="text-gray-400 text-4xl mb-3">🕐</div>
                                        <p class="font-semibold text-gray-700">
                                            No availabilities found
                                        </p>
                                        <p class="text-gray-500 mt-2">
                                            Add your working hours to display them here.
                                        </p>
                                        <a href="${pageContext.request.contextPath}/availabilities/create"
                                           class="inline-block mt-4 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg">
                                            Add Availability
                                        </a>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>

</body>
</html>
