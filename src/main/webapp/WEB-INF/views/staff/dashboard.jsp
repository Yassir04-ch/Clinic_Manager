
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard | ClinicManager</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-50 text-slate-800">

<div class="min-h-screen flex">

    <!-- Sidebar -->
    <aside class="w-64 fixed inset-y-0 left-0 z-30 bg-white border-r border-slate-200 flex flex-col">

        <div class="h-20 px-5 flex items-center gap-3 border-b border-slate-200">
            <div class="w-11 h-11 rounded-xl bg-blue-600 text-white font-bold flex items-center justify-center text-lg">
                CM
            </div>
            <div>
                <h1 class="font-bold text-slate-900 text-lg">ClinicManager</h1>
                <p class="text-xs text-slate-500">Staff Workspace</p>
            </div>
        </div>

        <nav class="flex-1 overflow-y-auto px-4 py-6">

            <p class="px-3 mb-3 text-xs font-semibold uppercase tracking-wider text-slate-400">
                Workspace
            </p>

            <a href="${pageContext.request.contextPath}/dashboard/staff"
               class="flex items-center gap-3 px-3 py-3 rounded-xl bg-blue-50 text-blue-700 font-semibold mb-2">
                <span>▦</span> Dashboard
            </a>

            <p class="px-3 mt-7 mb-3 text-xs font-semibold uppercase tracking-wider text-slate-400">
                Clinic operations
            </p>

            <a href="${pageContext.request.contextPath}/appointments"
               class="flex items-center gap-3 px-3 py-3 rounded-xl text-slate-600 hover:bg-slate-100 mb-1">
                <span>▣</span> Appointments
            </a>


            <p class="px-3 mt-7 mb-3 text-xs font-semibold uppercase tracking-wider text-slate-400">
                Account
            </p>

            <a href="${pageContext.request.contextPath}/profile"
               class="flex items-center gap-3 px-3 py-3 rounded-xl text-slate-600 hover:bg-slate-100 mb-1">
                <span>◎</span> My Profile
            </a>

        </nav>

        <div class="p-4 border-t border-slate-200">
            <a href="${pageContext.request.contextPath}/users/logout"
               class="flex items-center gap-3 px-3 py-3 rounded-xl text-red-600 hover:bg-red-50 font-medium">
                <span>↪</span> Logout
            </a>
        </div>
    </aside>

    <!-- Main content -->
    <div class="flex-1 min-w-0 ml-64">

        <!-- Header -->
        <header class="h-20 bg-white border-b border-slate-200 px-8 flex items-center justify-between">
            <div>
                <h2 class="text-xl font-bold text-slate-900">Staff Dashboard</h2>
                <p class="text-sm text-slate-500">Clinic operations and daily activities</p>
            </div>

            <div class="flex items-center gap-3">
                <div class="text-right">
                    <p class="text-sm font-semibold text-slate-900">
                        <c:out value="${sessionScope.user.firstName}"/>
                        <c:out value="${sessionScope.user.lastName}"/>
                    </p>
                    <p class="text-xs text-slate-500">Staff Member</p>
                </div>

                <div class="w-11 h-11 rounded-full bg-blue-100 text-blue-700 font-bold flex items-center justify-center">
                    <c:out value="${sessionScope.user.firstName.substring(0,1)}"/>
                </div>
            </div>
        </header>

        <main class="p-6 lg:p-8 max-w-screen-2xl mx-auto">

            <!-- Welcome -->
            <section class="rounded-2xl bg-gradient-to-r from-blue-700 to-indigo-600 p-8 text-white mb-8">
                <p class="text-blue-100 text-sm font-medium">STAFF WORKSPACE</p>

                <h1 class="mt-3 text-3xl font-bold">
                    Welcome back,
                    <c:out value="${sessionScope.user.firstName}"/>!
                </h1>

                <p class="mt-3 text-blue-100 max-w-2xl leading-6">
                    Manage clinic operations, follow appointment schedules,
                    and help maintain smooth coordination between patients and doctors.
                </p>
            </section>

            <!-- Quick actions -->
            <section class="bg-white border border-slate-200 rounded-2xl p-6">
                <div class="mb-5">
                    <h2 class="text-lg font-bold text-slate-900">Quick Actions</h2>
                    <p class="text-sm text-slate-500 mt-1">Access your main workspace tools.</p>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">

                    <a href="${pageContext.request.contextPath}/appointments"
                       class="border border-slate-200 rounded-xl p-5 hover:border-blue-300 hover:bg-blue-50/50 transition">
                        <span class="text-2xl">📅</span>
                        <h3 class="mt-3 font-semibold text-slate-900">Appointment Management</h3>
                        <p class="mt-1 text-sm text-slate-500">Access appointment records and schedules.</p>
                    </a>

                    <a href="${pageContext.request.contextPath}/profile"
                       class="border border-slate-200 rounded-xl p-5 hover:border-blue-300 hover:bg-blue-50/50 transition">
                        <span class="text-2xl">👤</span>
                        <h3 class="mt-3 font-semibold text-slate-900">My Profile</h3>
                        <p class="mt-1 text-sm text-slate-500">View and update your account information.</p>
                    </a>

                </div>
            </section>

            <footer class="mt-8 pb-3 text-center text-sm text-slate-400">
                © ClinicManager · Staff Workspace
            </footer>

        </main>
    </div>
</div>

</body>
</html>