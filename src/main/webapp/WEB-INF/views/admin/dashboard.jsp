
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard | ClinicManager</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-50 text-slate-800">

<div class="min-h-screen flex">

  <!-- Sidebar -->
  <aside class="w-64 bg-white border-r border-slate-200 flex flex-col fixed inset-y-0 left-0 z-30">

    <!-- Logo -->
    <div class="h-20 px-6 flex items-center gap-3 border-b border-slate-200">
      <div class="w-11 h-11 rounded-xl bg-blue-600 text-white flex items-center justify-center font-bold text-lg">
        CM
      </div>
      <div>
        <h1 class="font-bold text-lg text-slate-900">Clinic Manager</h1>
        <p class="text-sm text-slate-500">Administration Panel</p>
      </div>
    </div>

    <!-- Navigation -->
    <nav class="flex-1 overflow-y-auto px-4 py-6">

      <p class="px-3 mb-3 text-xs font-semibold uppercase tracking-wider text-slate-400">
        Main menu
      </p>

      <a href="${pageContext.request.contextPath}/dashboard/admin"
         class="flex items-center gap-3 px-3 py-3 mb-2 rounded-xl bg-blue-50 text-blue-700 font-semibold">
        <span>▦</span>
        Dashboard
      </a>

      <p class="px-3 mt-7 mb-3 text-xs font-semibold uppercase tracking-wider text-slate-400">
        User management
      </p>

      <a href="${pageContext.request.contextPath}/users/create/patient"
         class="flex items-center gap-3 px-3 py-3 mb-1 rounded-xl text-slate-600 hover:bg-slate-100 hover:text-blue-700">
        <span>＋</span>
        Create Patient
      </a>

      <a href="${pageContext.request.contextPath}/users/create/doctor"
         class="flex items-center gap-3 px-3 py-3 mb-1 rounded-xl text-slate-600 hover:bg-slate-100 hover:text-blue-700">
        <span>＋</span>
        Create Doctor
      </a>

      <a href="${pageContext.request.contextPath}/users/create/user"
         class="flex items-center gap-3 px-3 py-3 mb-1 rounded-xl text-slate-600 hover:bg-slate-100 hover:text-blue-700">
        <span>＋</span>
        Create Staff / User
      </a>

      <p class="px-3 mt-7 mb-3 text-xs font-semibold uppercase tracking-wider text-slate-400">
        Clinic management
      </p>

      <a href="${pageContext.request.contextPath}/departments"
         class="flex items-center gap-3 px-3 py-3 mb-1 rounded-xl text-slate-600 hover:bg-slate-100 hover:text-blue-700">
        <span>▤</span>
        Departments
      </a>

      <a href="${pageContext.request.contextPath}/specialties"
         class="flex items-center gap-3 px-3 py-3 mb-1 rounded-xl text-slate-600 hover:bg-slate-100 hover:text-blue-700">
        <span>✚</span>
        Specialties
      </a>

      <a href="${pageContext.request.contextPath}/appointments"
         class="flex items-center gap-3 px-3 py-3 mb-1 rounded-xl text-slate-600 hover:bg-slate-100 hover:text-blue-700">
        <span>▦</span>
        Appointments
      </a>

      <a href="${pageContext.request.contextPath}/absences/admin"
         class="flex items-center gap-3 px-3 py-3 mb-1 rounded-xl text-slate-600 hover:bg-slate-100 hover:text-blue-700">
        <span>◷</span>
        Absence Requests
      </a>

    </nav>

    <!-- Sidebar footer -->
    <div class="p-4 border-t border-slate-200">
      <a href="${pageContext.request.contextPath}/users/logout"
         class="flex items-center gap-3 px-3 py-3 rounded-xl text-red-600 hover:bg-red-50 font-medium">
        <span>↪</span>
        Logout
      </a>
    </div>

  </aside>

  <!-- Main content -->
  <div class="flex-1 min-w-0 ml-64">

    <!-- Topbar -->
    <header class="h-20 bg-white border-b border-slate-200 px-8 flex items-center justify-between sticky top-0 z-20">
      <div>
        <h2 class="text-xl font-bold text-slate-900">Administration</h2>
        <p class="text-sm text-slate-500">Manage your clinic from one place</p>
      </div>

      <div class="flex items-center gap-3">
        <div class="hidden sm:block text-right">
          <p class="text-sm font-semibold text-slate-800">Administrator</p>
          <p class="text-xs text-slate-500">ClinicManager</p>
        </div>
        <div class="w-10 h-10 rounded-full bg-blue-100 text-blue-700 font-bold flex items-center justify-center">
          A
        </div>
      </div>
    </header>

    <main class="p-6 lg:p-8 max-w-screen-2xl mx-auto">

      <!-- Welcome section -->
      <section class="mb-8 flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
          <p class="text-sm font-semibold text-blue-600 mb-2">ADMIN OVERVIEW</p>
          <h1 class="text-3xl font-bold tracking-tight text-slate-900">
            Welcome to your dashboard
          </h1>
          <p class="mt-2 text-slate-500">
            Manage users, clinic organization, appointments and absence requests.
          </p>
        </div>

        <a href="${pageContext.request.contextPath}/users/create/doctor"
           class="inline-flex items-center justify-center gap-2 px-5 py-3 rounded-xl bg-blue-600 text-white font-semibold hover:bg-blue-700 shadow-sm">
          <span class="text-xl">＋</span>
          Add Doctor
        </a>
      </section>

      <!-- Information banner -->
      <section class="mb-8 rounded-2xl border border-blue-100 bg-blue-50 p-5 flex items-start gap-4">
        <div class="w-11 h-11 shrink-0 rounded-xl bg-blue-100 text-blue-700 flex items-center justify-center text-xl">
          i
        </div>
        <div>
          <h3 class="font-semibold text-blue-900">Clinic administration</h3>
          <p class="mt-1 text-sm text-blue-700 leading-6">
            Use the navigation menu to manage the clinic's users and organizational data.
            Review absence requests and coordinate appointment management.
          </p>
        </div>
      </section>

      <!-- Quick actions -->
      <section class="mb-8">
        <div class="mb-5">
          <h2 class="text-xl font-bold text-slate-900">Quick actions</h2>
          <p class="text-sm text-slate-500 mt-1">
            Access the most frequently used administration features.
          </p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-5">

          <!-- Patients -->
          <a href="${pageContext.request.contextPath}/users/create/patient"
             class="group bg-white border border-slate-200 rounded-2xl p-6 hover:border-blue-300 hover:shadow-md transition">
            <div class="w-12 h-12 rounded-xl bg-blue-50 text-blue-700 flex items-center justify-center text-2xl mb-5">
              ♙
            </div>
            <h3 class="font-bold text-lg text-slate-900">Create Patient</h3>
            <p class="text-sm text-slate-500 mt-2 leading-6">
              Register a new patient and enter their personal information.
            </p>
            <div class="mt-5 text-sm font-semibold text-blue-600 group-hover:text-blue-800">
              Create patient <span>→</span>
            </div>
          </a>

          <!-- Doctors -->
          <a href="${pageContext.request.contextPath}/users/create/doctor"
             class="group bg-white border border-slate-200 rounded-2xl p-6 hover:border-emerald-300 hover:shadow-md transition">
            <div class="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-700 flex items-center justify-center text-2xl mb-5">
              ✚
            </div>
            <h3 class="font-bold text-lg text-slate-900">Create Doctor</h3>
            <p class="text-sm text-slate-500 mt-2 leading-6">
              Create a doctor account and assign a specialty.
            </p>
            <div class="mt-5 text-sm font-semibold text-emerald-700">
              Add doctor <span>→</span>
            </div>
          </a>

          <!-- Staff -->
          <a href="${pageContext.request.contextPath}/users/create/user"
             class="group bg-white border border-slate-200 rounded-2xl p-6 hover:border-violet-300 hover:shadow-md transition">
            <div class="w-12 h-12 rounded-xl bg-violet-50 text-violet-700 flex items-center justify-center text-2xl mb-5">
              ♧
            </div>
            <h3 class="font-bold text-lg text-slate-900">Create Staff</h3>
            <p class="text-sm text-slate-500 mt-2 leading-6">
              Create an account for a staff member who helps manage daily operations.
            </p>
            <div class="mt-5 text-sm font-semibold text-violet-700">
              Add staff member <span>→</span>
            </div>
          </a>

          <!-- Departments -->
          <a href="${pageContext.request.contextPath}/departments"
             class="group bg-white border border-slate-200 rounded-2xl p-6 hover:border-amber-300 hover:shadow-md transition">
            <div class="w-12 h-12 rounded-xl bg-amber-50 text-amber-700 flex items-center justify-center text-2xl mb-5">
              ▤
            </div>
            <h3 class="font-bold text-lg text-slate-900">Departments</h3>
            <p class="text-sm text-slate-500 mt-2 leading-6">
              Organize and maintain the clinic's medical departments.
            </p>
            <div class="mt-5 text-sm font-semibold text-amber-700">
              Manage departments <span>→</span>
            </div>
          </a>

          <!-- Specialties -->
          <a href="${pageContext.request.contextPath}/specialties"
             class="group bg-white border border-slate-200 rounded-2xl p-6 hover:border-cyan-300 hover:shadow-md transition">
            <div class="w-12 h-12 rounded-xl bg-cyan-50 text-cyan-700 flex items-center justify-center text-2xl mb-5">
              ✚
            </div>
            <h3 class="font-bold text-lg text-slate-900">Specialties</h3>
            <p class="text-sm text-slate-500 mt-2 leading-6">
              Manage medical specialties linked to departments.
            </p>
            <div class="mt-5 text-sm font-semibold text-cyan-700">
              Manage specialties <span>→</span>
            </div>
          </a>

          <!-- Appointments -->
          <a href="${pageContext.request.contextPath}/appointments"
             class="group bg-white border border-slate-200 rounded-2xl p-6 hover:border-rose-300 hover:shadow-md transition">
            <div class="w-12 h-12 rounded-xl bg-rose-50 text-rose-700 flex items-center justify-center text-2xl mb-5">
              ▦
            </div>
            <h3 class="font-bold text-lg text-slate-900">Appointments</h3>
            <p class="text-sm text-slate-500 mt-2 leading-6">
              Access appointment management and help coordinate schedules.
            </p>
            <div class="mt-5 text-sm font-semibold text-rose-700">
              View appointments <span>→</span>
            </div>
          </a>

          <!-- Absences -->
          <a href="${pageContext.request.contextPath}/absences/admin"
             class="group bg-white border border-slate-200 rounded-2xl p-6 hover:border-orange-300 hover:shadow-md transition">
            <div class="w-12 h-12 rounded-xl bg-orange-50 text-orange-700 flex items-center justify-center text-2xl mb-5">
              ◷
            </div>
            <h3 class="font-bold text-lg text-slate-900">Absence Requests</h3>
            <p class="text-sm text-slate-500 mt-2 leading-6">
              Review doctors' absence requests and approve or reject them.
            </p>
            <div class="mt-5 text-sm font-semibold text-orange-700">
              Review requests <span>→</span>
            </div>
          </a>

        </div>
      </section>

      <!-- Administration responsibilities -->
      <section class="bg-white border border-slate-200 rounded-2xl p-6">
        <h2 class="text-lg font-bold text-slate-900">Administration responsibilities</h2>
        <p class="text-sm text-slate-500 mt-1 mb-5">
          Keep the clinic organized and its access permissions controlled.
        </p>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-5">

          <div class="flex items-start gap-3">
            <div class="w-10 h-10 shrink-0 rounded-lg bg-blue-50 text-blue-700 flex items-center justify-center">
              ✓
            </div>
            <div>
              <h3 class="font-semibold text-slate-800">User accounts</h3>
              <p class="text-sm text-slate-500 mt-1">
                Maintain patient, doctor and staff accounts.
              </p>
            </div>
          </div>

          <div class="flex items-start gap-3">
            <div class="w-10 h-10 shrink-0 rounded-lg bg-emerald-50 text-emerald-700 flex items-center justify-center">
              ✓
            </div>
            <div>
              <h3 class="font-semibold text-slate-800">Medical organization</h3>
              <p class="text-sm text-slate-500 mt-1">
                Maintain departments and specialties.
              </p>
            </div>
          </div>

          <div class="flex items-start gap-3">
            <div class="w-10 h-10 shrink-0 rounded-lg bg-orange-50 text-orange-700 flex items-center justify-center">
              ✓
            </div>
            <div>
              <h3 class="font-semibold text-slate-800">Absence validation</h3>
              <p class="text-sm text-slate-500 mt-1">
                Review absence requests and coordinate affected appointments.
              </p>
            </div>
          </div>

        </div>
      </section>

      <!-- Footer -->
      <footer class="mt-8 pb-3 text-center text-sm text-slate-400">
        ClinicManager · Administration Panel
      </footer>

    </main>
  </div>
</div>

</body>
</html>