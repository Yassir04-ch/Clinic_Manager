<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Doctor Dashboard - ClinicManager</title>

    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-gray-50">

<div class="flex min-h-screen">

    <!-- ================= SIDEBAR ================= -->

    <aside class="hidden md:flex md:flex-col w-64 bg-white border-r border-gray-200">

        <!-- Logo -->

        <div class="px-6 py-6 border-b border-gray-200">

            <h1 class="text-2xl font-bold text-blue-600">
                ClinicManager
            </h1>

            <p class="text-sm text-gray-500 mt-1">
                Doctor Panel
            </p>

        </div>


        <!-- Navigation -->

        <nav class="flex-1 px-4 py-6 space-y-2">

            <a href="${pageContext.request.contextPath}/dashboard/doctor"
               class="flex items-center gap-3 px-4 py-3 rounded-lg
                      bg-blue-50 text-blue-600 font-medium">

                <span>🏠</span>
                <span>Dashboard</span>

            </a>


            <a href="${pageContext.request.contextPath}/appointments"
               class="flex items-center gap-3 px-4 py-3 rounded-lg
                      text-gray-600 hover:bg-gray-100">

                <span>📅</span>
                <span>Appointments</span>

            </a>


            <a href="${pageContext.request.contextPath}/availabilities"
               class="flex items-center gap-3 px-4 py-3 rounded-lg
                      text-gray-600 hover:bg-gray-100">

                <span>🕐</span>
                <span>My Availability</span>

            </a>


            <a href="${pageContext.request.contextPath}/profile"
               class="flex items-center gap-3 px-4 py-3 rounded-lg
                      text-gray-600 hover:bg-gray-100">

                <span>👤</span>
                <span>My Profile</span>

            </a>

        </nav>


        <!-- Logout -->

        <div class="p-4 border-t border-gray-200">

            <a href="${pageContext.request.contextPath}/users/logout"
               class="flex items-center gap-3 px-4 py-3 rounded-lg
                      text-red-600 hover:bg-red-50">

                <span>↪</span>
                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- ================= MAIN ================= -->

    <main class="flex-1">

        <!-- ================= HEADER ================= -->

        <header class="bg-white border-b border-gray-200">

            <div class="px-6 py-5 flex justify-between items-center">

                <div>

                    <h2 class="text-2xl font-bold text-gray-800">
                        Doctor Dashboard
                    </h2>

                    <p class="text-sm text-gray-500 mt-1">
                        Manage your appointments and availability
                    </p>

                </div>


                <!-- Doctor -->

                <div class="flex items-center gap-3">

                    <div class="text-right hidden sm:block">

                        <p class="text-sm font-semibold text-gray-800">
                            Doctor
                        </p>

                        <p class="text-xs text-gray-500">
                            Medical Professional
                        </p>

                    </div>

                    <div class="w-11 h-11 rounded-full bg-blue-100
                                flex items-center justify-center
                                text-blue-600 font-bold">

                        DR

                    </div>

                </div>

            </div>

        </header>


        <!-- ================= CONTENT ================= -->

        <div class="p-6">


            <!-- Welcome -->

            <div class="bg-gradient-to-r from-blue-600 to-blue-700
                        rounded-2xl p-6 text-white mb-6">

                <p class="text-blue-100 text-sm">
                    Welcome back
                </p>

                <h1 class="text-2xl font-bold mt-1">
                    Doctor 👋
                </h1>

                <p class="text-blue-100 mt-2">
                    Manage your appointments and keep your schedule organized.
                </p>

            </div>


            <!-- ================= STATISTICS ================= -->

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 mb-8">


                <!-- Today's appointments -->

                <div class="bg-white rounded-xl p-5 border border-gray-200">

                    <div class="flex justify-between items-start">

                        <div>

                            <p class="text-sm text-gray-500">
                                Today's Appointments
                            </p>

                            <h3 class="text-3xl font-bold text-gray-800 mt-2">
                                0
                            </h3>

                        </div>

                        <div class="w-11 h-11 rounded-lg bg-blue-100
                                    flex items-center justify-center">

                            📅

                        </div>

                    </div>

                </div>


                <!-- Upcoming -->

                <div class="bg-white rounded-xl p-5 border border-gray-200">

                    <div class="flex justify-between items-start">

                        <div>

                            <p class="text-sm text-gray-500">
                                Upcoming
                            </p>

                            <h3 class="text-3xl font-bold text-gray-800 mt-2">
                                0
                            </h3>

                        </div>

                        <div class="w-11 h-11 rounded-lg bg-green-100
                                    flex items-center justify-center">

                            🗓️

                        </div>

                    </div>

                </div>


                <!-- Patients -->

                <div class="bg-white rounded-xl p-5 border border-gray-200">

                    <div class="flex justify-between items-start">

                        <div>

                            <p class="text-sm text-gray-500">
                                My Patients
                            </p>

                            <h3 class="text-3xl font-bold text-gray-800 mt-2">
                                0
                            </h3>

                        </div>

                        <div class="w-11 h-11 rounded-lg bg-purple-100
                                    flex items-center justify-center">

                            👥

                        </div>

                    </div>

                </div>


                <!-- Availability -->

                <div class="bg-white rounded-xl p-5 border border-gray-200">

                    <div class="flex justify-between items-start">

                        <div>

                            <p class="text-sm text-gray-500">
                                Availability
                            </p>

                            <h3 class="text-lg font-bold text-green-600 mt-3">
                                Available
                            </h3>

                        </div>

                        <div class="w-11 h-11 rounded-lg bg-green-100
                                    flex items-center justify-center">

                            ✓

                        </div>

                    </div>

                </div>

            </div>


            <!-- ================= MAIN GRID ================= -->

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">


                <!-- ================= APPOINTMENTS ================= -->

                <div class="lg:col-span-2 bg-white rounded-xl
                            border border-gray-200">

                    <div class="px-6 py-5 border-b border-gray-200
                                flex justify-between items-center">

                        <div>

                            <h3 class="text-lg font-semibold text-gray-800">
                                Upcoming Appointments
                            </h3>

                            <p class="text-sm text-gray-500 mt-1">
                                Your next scheduled consultations
                            </p>

                        </div>

                        <a href="${pageContext.request.contextPath}/appointments"
                           class="text-sm text-blue-600 hover:text-blue-700 font-medium">

                            View all

                        </a>

                    </div>


                    <!-- Empty state -->

                    <div class="p-10 text-center">

                        <div class="w-16 h-16 mx-auto rounded-full
                                    bg-gray-100 flex items-center
                                    justify-center text-2xl">

                            📅

                        </div>

                        <h4 class="mt-4 font-semibold text-gray-800">
                            No upcoming appointments
                        </h4>

                        <p class="text-sm text-gray-500 mt-2">
                            Your upcoming appointments will appear here.
                        </p>

                    </div>

                </div>


                <!-- ================= QUICK ACTIONS ================= -->

                <div class="bg-white rounded-xl border border-gray-200">

                    <div class="px-6 py-5 border-b border-gray-200">

                        <h3 class="text-lg font-semibold text-gray-800">
                            Quick Actions
                        </h3>

                        <p class="text-sm text-gray-500 mt-1">
                            Manage your activity
                        </p>

                    </div>


                    <div class="p-5 space-y-3">


                        <!-- Availability -->

                        <a href="${pageContext.request.contextPath}/availabilities/create"
                           class="flex items-center gap-4 p-4 rounded-xl
                                  bg-blue-50 hover:bg-blue-100 transition">

                            <div class="w-10 h-10 rounded-lg bg-blue-600
                                        text-white flex items-center
                                        justify-center">

                                +

                            </div>

                            <div>

                                <p class="font-semibold text-gray-800">
                                    Add Availability
                                </p>

                                <p class="text-xs text-gray-500">
                                    Define your working hours
                                </p>

                            </div>

                        </a>


                        <!-- Appointments -->

                        <a href="${pageContext.request.contextPath}/appointments"
                           class="flex items-center gap-4 p-4 rounded-xl
                                  bg-green-50 hover:bg-green-100 transition">

                            <div class="w-10 h-10 rounded-lg bg-green-600
                                        text-white flex items-center
                                        justify-center">

                                📅

                            </div>

                            <div>

                                <p class="font-semibold text-gray-800">
                                    View Appointments
                                </p>

                                <p class="text-xs text-gray-500">
                                    Manage your consultations
                                </p>

                            </div>

                        </a>


                        <!-- Profile -->

                        <a href="${pageContext.request.contextPath}/profile"
                           class="flex items-center gap-4 p-4 rounded-xl
                                  bg-purple-50 hover:bg-purple-100 transition">

                            <div class="w-10 h-10 rounded-lg bg-purple-600
                                        text-white flex items-center
                                        justify-center">

                                👤

                            </div>

                            <div>

                                <p class="font-semibold text-gray-800">
                                    My Profile
                                </p>

                                <p class="text-xs text-gray-500">
                                    View your information
                                </p>

                            </div>

                        </a>

                    </div>

                </div>

            </div>


            <!-- ================= AVAILABILITY SECTION ================= -->

            <div class="mt-6 bg-white rounded-xl border border-gray-200">

                <div class="px-6 py-5 border-b border-gray-200
                            flex justify-between items-center">

                    <div>

                        <h3 class="text-lg font-semibold text-gray-800">
                            My Availability
                        </h3>

                        <p class="text-sm text-gray-500 mt-1">
                            Manage your available working hours
                        </p>

                    </div>

                    <a href="${pageContext.request.contextPath}/availabilities"
                       class="text-sm text-blue-600 hover:text-blue-700 font-medium">

                        Manage

                    </a>

                </div>


                <div class="p-6">

                    <div class="flex items-center justify-between
                                p-4 bg-green-50 rounded-lg">

                        <div class="flex items-center gap-3">

                            <div class="w-10 h-10 bg-green-100 rounded-lg
                                        flex items-center justify-center">

                                ✓

                            </div>

                            <div>

                                <p class="font-semibold text-gray-800">
                                    Availability is active
                                </p>

                                <p class="text-sm text-gray-500">
                                    Patients can book appointments
                                </p>

                            </div>

                        </div>

                        <a href="${pageContext.request.contextPath}/availabilities"
                           class="px-4 py-2 bg-white border border-gray-300
                                  rounded-lg text-sm font-medium
                                  text-gray-700 hover:bg-gray-50">

                            Manage

                        </a>

                    </div>

                </div>

            </div>


        </div>

    </main>

</div>

</body>

</html>