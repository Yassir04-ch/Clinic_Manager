<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion | ClinicManager</title>

  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Inter', sans-serif;
    }

    .login-background {
      background:
              radial-gradient(circle at 15% 20%, rgba(59, 130, 246, 0.12), transparent 30%),
              radial-gradient(circle at 85% 80%, rgba(20, 184, 166, 0.12), transparent 30%),
              #f8fafc;
    }
  </style>
</head>

<body class="login-background min-h-screen flex items-center justify-center p-4">

<div class="w-full max-w-5xl grid md:grid-cols-2 bg-white rounded-3xl shadow-2xl shadow-slate-200/70 overflow-hidden">

  <!-- Partie gauche : Présentation -->
  <div class="hidden md:flex flex-col justify-between bg-gradient-to-br from-blue-700 via-blue-600 to-teal-500 p-10 lg:p-12 text-white relative overflow-hidden">

    <div class="absolute -right-20 -top-20 w-72 h-72 rounded-full border border-white/10"></div>
    <div class="absolute -right-10 -top-10 w-52 h-52 rounded-full border border-white/10"></div>
    <div class="absolute -left-20 -bottom-24 w-72 h-72 rounded-full bg-white/5"></div>

    <div class="relative z-10">
      <div class="flex items-center gap-3">
        <div class="w-12 h-12 rounded-2xl bg-white/15 border border-white/20 flex items-center justify-center text-2xl font-bold">
          +
        </div>
        <div>
          <h1 class="text-2xl font-extrabold tracking-tight">ClinicManager</h1>
          <p class="text-blue-100 text-xs mt-1">Healthcare Management System</p>
        </div>
      </div>

      <div class="mt-20">
        <p class="text-blue-100 text-sm font-semibold uppercase tracking-widest">
          Bienvenue sur votre espace
        </p>

        <h2 class="text-4xl lg:text-5xl font-extrabold leading-tight mt-5">
          La gestion médicale,
          <span class="text-teal-200">en toute simplicité.</span>
        </h2>

        <p class="mt-6 text-blue-50/90 leading-7 text-sm lg:text-base max-w-sm">
          Accédez à votre espace sécurisé pour gérer les rendez-vous
          et retrouver les informations essentielles de votre activité médicale.
        </p>
      </div>
    </div>

    <div class="relative z-10 border-t border-white/20 pt-6">
      <div class="flex items-center gap-3">
        <div class="w-10 h-10 rounded-full bg-white/15 flex items-center justify-center">
          <svg class="w-5 h-5" fill="none" stroke="currentColor"
               viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 11c1.657 0 3-1.343 3-3S13.657 5 12 5 9 6.343 9 8s1.343 3 3 3zm0 0v2m-7 7h14a2 2 0 002-2v-3a2 2 0 00-2-2H5a2 2 0 00-2 2v3a2 2 0 002 2z"/>
          </svg>
        </div>
        <div>
          <p class="font-semibold text-sm">Accès sécurisé</p>
          <p class="text-blue-100 text-xs mt-1">Vos données restent protégées</p>
        </div>
      </div>

      <p class="text-blue-100/70 text-xs mt-8">
        © 2026 ClinicManager. Tous droits réservés.
      </p>
    </div>
  </div>

  <!-- Partie droite : Formulaire -->
  <div class="p-7 sm:p-10 lg:p-14 flex flex-col justify-center">

    <div class="md:hidden flex items-center gap-3 mb-10">
      <div class="w-11 h-11 rounded-xl bg-blue-600 text-white flex items-center justify-center text-2xl font-bold">
        +
      </div>
      <div>
        <h1 class="text-xl font-extrabold text-slate-900">ClinicManager</h1>
        <p class="text-xs text-slate-500">Healthcare Management</p>
      </div>
    </div>

    <div class="mb-8">
      <p class="text-sm font-semibold text-blue-600 mb-3">ESPACE DE CONNEXION</p>

      <h2 class="text-3xl font-extrabold text-slate-900 tracking-tight">
        Bon retour !
      </h2>

      <p class="text-slate-500 mt-3 text-sm leading-6">
        Connectez-vous à votre compte pour continuer.
      </p>
    </div>

    <% if (request.getAttribute("erreur") != null) { %>
    <div class="mb-6 flex items-start gap-3 rounded-xl border border-red-200 bg-red-50 p-4 text-sm text-red-700"
         role="alert">
      <svg class="w-5 h-5 shrink-0 mt-0.5" fill="none" stroke="currentColor"
           viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round"
              stroke-width="2"
              d="M12 8v4m0 4h.01M10.29 3.86L1.82 18a2 2 0 001.71 2.57h16.94A2 2 0 0022.18 18L13.71 3.86a2 2 0 00-3.42 0z"/>
      </svg>
      <span><%= request.getAttribute("erreur") %></span>
    </div>
    <% } %>

    <form method="post"
          action="<%= request.getContextPath() %>/users/login"
          class="space-y-5">

      <div>
        <label for="email" class="block text-sm font-semibold text-slate-700 mb-2">
          Adresse email
        </label>

        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400">
            <svg class="w-5 h-5" fill="none" stroke="currentColor"
                 viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round"
                    stroke-width="1.8"
                    d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
            </svg>
          </div>

          <input
                  type="email"
                  id="email"
                  name="email"
                  placeholder="nom@exemple.com"
                  autocomplete="email"
                  required
                  class="w-full rounded-xl border border-slate-200 bg-slate-50 py-3.5 pl-12 pr-4 text-sm text-slate-800 outline-none transition focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-100"
          >
        </div>
      </div>

      <div>
        <label for="password" class="block text-sm font-semibold text-slate-700 mb-2">
          Mot de passe
        </label>

        <div class="relative">
          <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none text-slate-400">
            <svg class="w-5 h-5" fill="none" stroke="currentColor"
                 viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round"
                    stroke-width="1.8"
                    d="M12 15v2m-6 4h12a2 2 0 002-2v-7a2 2 0 00-2-2H6a2 2 0 00-2 2v7a2 2 0 002 2zm2-11V7a4 4 0 118 0v4"/>
            </svg>
          </div>

          <input
                  type="password"
                  id="password"
                  name="password"
                  placeholder="Entrez votre mot de passe"
                  autocomplete="current-password"
                  required
                  class="w-full rounded-xl border border-slate-200 bg-slate-50 py-3.5 pl-12 pr-12 text-sm text-slate-800 outline-none transition focus:border-blue-500 focus:bg-white focus:ring-4 focus:ring-blue-100"
          >

          <button
                  type="button"
                  id="togglePassword"
                  aria-label="Afficher le mot de passe"
                  class="absolute inset-y-0 right-0 px-4 flex items-center text-slate-400 hover:text-blue-600 transition"
          >
            <svg id="eyeIcon" class="w-5 h-5" fill="none"
                 stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round"
                    stroke-width="1.8"
                    d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
              <path stroke-linecap="round" stroke-linejoin="round"
                    stroke-width="1.8"
                    d="M2.46 12C3.73 7.94 7.52 5 12 5s8.27 2.94 9.54 7c-1.27 4.06-5.06 7-9.54 7s-8.27-2.94-9.54-7z"/>
            </svg>
          </button>
        </div>
      </div>

      <button
              type="submit"
              class="w-full flex items-center justify-center gap-2 rounded-xl bg-blue-600 px-5 py-3.5 text-sm font-bold text-white shadow-lg shadow-blue-600/20 transition hover:bg-blue-700 hover:shadow-xl focus:outline-none focus:ring-4 focus:ring-blue-200 active:scale-[0.99]"
      >
        Se connecter
        <svg class="w-4 h-4" fill="none" stroke="currentColor"
             viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2"
                d="M5 12h14m-7-7l7 7-7 7"/>
        </svg>
      </button>

    </form>

    <div class="mt-8 flex items-center justify-center gap-2 text-xs text-slate-400">
      <svg class="w-4 h-4" fill="none" stroke="currentColor"
           viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round"
              stroke-width="1.8"
              d="M12 11c1.657 0 3-1.343 3-3S13.657 5 12 5 9 6.343 9 8s1.343 3 3 3zm0 0v2m-7 7h14a2 2 0 002-2v-3a2 2 0 00-2-2H5a2 2 0 00-2 2v3a2 2 0 002 2z"/>
      </svg>
      Connexion réservée aux utilisateurs autorisés
    </div>

    <p class="md:hidden text-center text-xs text-slate-400 mt-8">
      © 2026 ClinicManager
    </p>

  </div>
</div>

<script>
  const passwordInput = document.getElementById("password");
  const togglePassword = document.getElementById("togglePassword");

  togglePassword.addEventListener("click", function () {
    const isPassword = passwordInput.type === "password";
    passwordInput.type = isPassword ? "text" : "password";
    togglePassword.setAttribute(
            "aria-label",
            isPassword ? "Masquer le mot de passe" : "Afficher le mot de passe"
    );
  });
</script>

</body>
</html>
