<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Doctor | ClinicManager</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .form-input {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            background: #ffffff;
            color: #0f172a;
            font-size: 14px;
            outline: none;
            transition: border-color .2s, box-shadow .2s;
        }

        .form-input:focus {
            border-color: #0d9488;
            box-shadow: 0 0 0 3px rgba(13, 148, 136, .12);
        }

        .form-input::placeholder {
            color: #94a3b8;
        }

        .field-label {
            display: block;
            margin-bottom: 8px;
            color: #334155;
            font-size: 13px;
            font-weight: 600;
        }
    </style>
</head>

<body class="min-h-screen bg-slate-50 text-slate-800">

<div class="min-h-screen flex">

    <!-- Sidebar -->
    <aside class="hidden lg:flex w-64 shrink-0 flex-col bg-slate-950 text-white p-6">

        <a href="${pageContext.request.contextPath}/dashboard"
           class="flex items-center gap-3 mb-12">
            <div class="flex h-11 w-11 items-center justify-center rounded-xl bg-teal-500">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                     stroke-width="2" stroke-linecap="round">
                    <path d="M12 5v14M5 12h14"/>
                </svg>
            </div>
            <div>
                <h1 class="text-lg font-bold tracking-tight">ClinicManager</h1>
                <p class="text-xs text-slate-400">Healthcare Management</p>
            </div>
        </a>

        <p class="mb-4 px-3 text-xs font-semibold uppercase tracking-widest text-slate-500">
            Administration
        </p>

        <nav class="space-y-2">
            <a href="${pageContext.request.contextPath}/dashboard"
               class="flex items-center gap-3 rounded-xl px-4 py-3 text-sm text-slate-300 transition hover:bg-slate-800 hover:text-white">
                <span>▦</span>
                Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/users/create"
               class="flex items-center gap-3 rounded-xl bg-teal-500/15 px-4 py-3 text-sm font-semibold text-teal-300">
                <span>＋</span>
                Create Doctor
            </a>

            <a href="${pageContext.request.contextPath}/departments"
               class="flex items-center gap-3 rounded-xl px-4 py-3 text-sm text-slate-300 transition hover:bg-slate-800 hover:text-white">
                <span>▤</span>
                Departments
            </a>

            <a href="${pageContext.request.contextPath}/specialties"
               class="flex items-center gap-3 rounded-xl px-4 py-3 text-sm text-slate-300 transition hover:bg-slate-800 hover:text-white">
                <span>✚</span>
                Specialties
            </a>
        </nav>

        <div class="mt-auto rounded-2xl border border-slate-800 bg-slate-900 p-4">
            <p class="text-sm font-semibold">ClinicManager</p>
            <p class="mt-1 text-xs leading-5 text-slate-400">
                Manage your healthcare team in one place.
            </p>
        </div>
    </aside>

    <!-- Main content -->
    <main class="min-w-0 flex-1">

        <!-- Top bar -->
        <header class="flex items-center justify-between border-b border-slate-200 bg-white px-5 py-4 sm:px-8">
            <div>
                <p class="text-xs font-medium text-slate-500">Administration / Doctors</p>
                <h2 class="mt-1 text-lg font-bold text-slate-900">Create Doctor</h2>
            </div>

            <div class="flex h-10 w-10 items-center justify-center rounded-full bg-teal-50 font-bold text-teal-700">
                A
            </div>
        </header>

        <div class="mx-auto max-w-5xl px-5 py-8 sm:px-8 lg:py-10">

            <!-- Page heading -->
            <div class="mb-8">
                <div class="mb-4 flex h-14 w-14 items-center justify-center rounded-2xl bg-teal-100 text-teal-700">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                         viewBox="0 0 24 24" fill="none" stroke="currentColor"
                         stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M3 21v-2a6 6 0 0 1 6-6h2"/>
                        <path d="M19 14v6M16 17h6"/>
                    </svg>
                </div>

                <h1 class="text-2xl font-extrabold tracking-tight text-slate-900 sm:text-3xl">
                    Add a new doctor
                </h1>

                <p class="mt-2 max-w-2xl text-sm leading-6 text-slate-500">
                    Create a doctor profile by entering their personal information,
                    professional details and specialty.
                </p>
            </div>

            <!-- Form card -->
            <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm">

                <div class="border-b border-slate-100 px-6 py-5 sm:px-8">
                    <h2 class="font-bold text-slate-900">Doctor information</h2>
                    <p class="mt-1 text-sm text-slate-500">
                        Fields marked with * are required.
                    </p>
                </div>

                <form action="${pageContext.request.contextPath}/users/create"
                      method="post">

                    <input type="hidden" name="role" value="DOCTOR">

                    <div class="space-y-8 px-6 py-7 sm:px-8">

                        <!-- Personal information -->
                        <section>
                            <div class="mb-5 flex items-center gap-3">
                                <div class="flex h-9 w-9 items-center justify-center rounded-lg bg-slate-100 text-slate-600">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                         viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                         stroke-width="1.8">
                                        <circle cx="12" cy="8" r="4"/>
                                        <path d="M5 21v-2a7 7 0 0 1 14 0v2"/>
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-sm font-bold text-slate-900">Personal information</h3>
                                    <p class="text-xs text-slate-500">Basic contact details</p>
                                </div>
                            </div>

                            <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">

                                <div>
                                    <label class="field-label" for="firstName">
                                        First name *
                                    </label>
                                    <input class="form-input" id="firstName"
                                           type="text" name="firstName"
                                           placeholder="Enter first name" required>
                                </div>

                                <div>
                                    <label class="field-label" for="lastName">
                                        Last name *
                                    </label>
                                    <input class="form-input" id="lastName"
                                           type="text" name="lastName"
                                           placeholder="Enter last name" required>
                                </div>

                                <div>
                                    <label class="field-label" for="email">
                                        Email address *
                                    </label>
                                    <input class="form-input" id="email"
                                           type="email" name="email"
                                           placeholder="doctor@example.com" required>
                                </div>

                                <div>
                                    <label class="field-label" for="phone">
                                        Phone number
                                    </label>
                                    <input class="form-input" id="phone"
                                           type="tel" name="phone"
                                           placeholder="+212 6XX XXX XXX">
                                </div>

                                <div class="sm:col-span-2">
                                    <label class="field-label" for="password">
                                        Password *
                                    </label>
                                    <input class="form-input" id="password"
                                           type="password" name="password"
                                           placeholder="Create a secure password"
                                           autocomplete="new-password" required minlength="8">
                                    <p class="mt-2 text-xs text-slate-400">
                                        Use at least 8 characters.
                                    </p>
                                </div>

                            </div>
                        </section>

                        <div class="border-t border-slate-100"></div>

                        <!-- Professional information -->
                        <section>
                            <div class="mb-5 flex items-center gap-3">
                                <div class="flex h-9 w-9 items-center justify-center rounded-lg bg-teal-50 text-teal-700">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="19" height="19"
                                         viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                         stroke-width="1.8" stroke-linecap="round">
                                        <path d="M12 22s8-4 8-11V5l-8-3-8 3v6c0 7 8 11 8 11z"/>
                                        <path d="M9 12l2 2 4-4"/>
                                    </svg>
                                </div>
                                <div>
                                    <h3 class="text-sm font-bold text-slate-900">Professional details</h3>
                                    <p class="text-xs text-slate-500">Medical identification and specialty</p>
                                </div>
                            </div>

                            <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">

                                <div>
                                    <label class="field-label" for="matricule">
                                        Medical registration number *
                                    </label>
                                    <input class="form-input" id="matricule"
                                           type="text" name="matricule"
                                           placeholder="Enter matricule" required>
                                </div>

                                <div>
                                    <label class="field-label" for="title">
                                        Professional title
                                    </label>
                                    <input class="form-input" id="title"
                                           type="text" name="title"
                                           placeholder="e.g. Dr., Professor">
                                </div>

                                <div class="sm:col-span-2">
                                    <label class="field-label" for="specialtyId">
                                        Medical specialty *
                                    </label>

                                    <select class="form-input" id="specialtyId"
                                            name="specialtyId" required>
                                        <option value="">Select a specialty</option>

                                        <c:forEach var="specialty" items="${specialities}">
                                            <option value="${specialty.id}">
                                                <c:out value="${specialty.name}"/>
                                            </option>
                                        </c:forEach>
                                    </select>

                                    <c:if test="${empty specialities}">
                                        <p class="mt-2 text-sm text-amber-600">
                                            No specialties available. Please add a specialty first.
                                        </p>
                                    </c:if>
                                </div>

                            </div>
                        </section>

                    </div>

                    <!-- Actions -->
                    <div class="flex flex-col-reverse gap-3 border-t border-slate-100 bg-slate-50 px-6 py-5 sm:flex-row sm:justify-end sm:px-8">

                        <a href="${pageContext.request.contextPath}/dashboard"
                           class="inline-flex items-center justify-center rounded-xl border border-slate-200 bg-white px-5 py-3 text-sm font-semibold text-slate-600 transition hover:bg-slate-100">
                            Cancel
                        </a>

                        <button type="submit"
                                class="inline-flex items-center justify-center gap-2 rounded-xl bg-teal-600 px-6 py-3 text-sm font-semibold text-white shadow-sm transition hover:bg-teal-700 focus:outline-none focus:ring-4 focus:ring-teal-100">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                                 viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                 stroke-width="2" stroke-linecap="round">
                                <path d="M12 5v14M5 12h14"/>
                            </svg>
                            Create Doctor
                        </button>

                    </div>

                </form>
            </div>

            <p class="mt-5 text-center text-xs text-slate-400">
                ClinicManager · Healthcare management system
            </p>

        </div>
    </main>

</div>

</body>
</html>
