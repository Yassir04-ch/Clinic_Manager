<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

  <meta charset="UTF-8">

  <meta name="viewport"
        content="width=device-width, initial-scale=1.0">

  <title>Patient Dashboard - ClinicManager</title>

  <script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-gray-50 text-gray-800">

<div class="min-h-screen flex">

  <aside class="w-64 bg-gray-900 text-white fixed left-0 top-0 bottom-0 flex flex-col">


    <div class="px-6 py-6 border-b border-gray-800">

      <h2 class="text-xl font-bold">
        ClinicManager
      </h2>

      <p class="text-sm text-gray-400 mt-1">
        Patient Portal
      </p>

    </div>

    <nav class="flex-1 px-3 py-5 space-y-1">


      <a href="${pageContext.request.contextPath}/dashboard/patient"
         class="block px-4 py-3 rounded-lg
                  bg-blue-600 text-white">

        Dashboard

      </a>



      <a href="${pageContext.request.contextPath}/appointments"
         class="block px-4 py-3 rounded-lg
                  text-gray-300 hover:bg-gray-800
                  hover:text-white transition">

        My Appointments

      </a>


      <a href="${pageContext.request.contextPath}/medical-notes"
         class="block px-4 py-3 rounded-lg
                  text-gray-300 hover:bg-gray-800
                  hover:text-white transition">

        My Medical Notes

      </a>


      <a href="${pageContext.request.contextPath}/profile"
         class="block px-4 py-3 rounded-lg
                  text-gray-300 hover:bg-gray-800
                  hover:text-white transition">

        My Profile

      </a>

    </nav>



    <div class="px-3 py-4 border-t border-gray-800">

      <a href="${pageContext.request.contextPath}/users/logout"
         class="block px-4 py-3 rounded-lg
                  text-red-400 hover:bg-gray-800">

        Logout

      </a>

    </div>

  </aside>




  <main class="ml-64 flex-1 p-8">



    <header class="flex items-center justify-between mb-8">


      <div>

        <h1 class="text-3xl font-bold text-gray-900">
          Patient Dashboard
        </h1>

        <p class="text-gray-500 mt-1">
          Welcome to your ClinicManager patient portal
        </p>

      </div>


      <div class="flex items-center gap-3">


        <div class="w-10 h-10 rounded-full
                        bg-blue-600 text-white
                        flex items-center justify-center
                        font-bold">

          P

        </div>


        <div>

          <p class="font-semibold text-gray-900">
            Patient
          </p>

          <p class="text-sm text-gray-500">
            Patient account
          </p>

        </div>

      </div>

    </header>



    <section class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">


      <div class="bg-white rounded-xl
                    border border-gray-200
                    p-6 shadow-sm">

        <p class="text-sm text-gray-500">
          Upcoming Appointments
        </p>

        <h2 class="text-3xl font-bold mt-2">
          0
        </h2>

      </div>


      <div class="bg-white rounded-xl
                    border border-gray-200
                    p-6 shadow-sm">

        <p class="text-sm text-gray-500">
          Completed Appointments
        </p>

        <h2 class="text-3xl font-bold mt-2">
          0
        </h2>

      </div>


      <div class="bg-white rounded-xl
                    border border-gray-200
                    p-6 shadow-sm">

        <p class="text-sm text-gray-500">
          Medical Notes
        </p>

        <h2 class="text-3xl font-bold mt-2">
          0
        </h2>

      </div>

    </section>




    <section class="bg-white rounded-xl
                    border border-gray-200
                    shadow-sm">



      <div class="flex items-center justify-between
                    p-6 border-b border-gray-100">


        <div>

          <h2 class="text-xl font-semibold text-gray-900">
            Our Doctors
          </h2>

          <p class="text-sm text-gray-500 mt-1">
            Choose a doctor for your appointment
          </p>

        </div>


      </div>



      <div class="p-6">


        <c:choose>



          <c:when test="${not empty doctors}">


            <div class="grid grid-cols-1 md:grid-cols-2
                                xl:grid-cols-3 gap-6">


              <c:forEach var="doctor" items="${doctors}">


                <a href="${pageContext.request.contextPath}/appointments/create?doctorId=${doctor.id}"
                   class="block border border-gray-200 rounded-xl p-5
                    hover:shadow-lg hover:border-blue-300
                    transition cursor-pointer">

                  <div class="flex items-center gap-4">

                    <div class="w-12 h-12 rounded-full
                    bg-blue-100 text-blue-600
                    flex items-center justify-center
                    font-bold">

                        ${doctor.firstName.substring(0,1)}
                        ${doctor.lastName.substring(0,1)}

                    </div>

                    <div>

                      <h3 class="font-semibold text-gray-900">
                        Dr. ${doctor.firstName} ${doctor.lastName}
                      </h3>

                      <p class="text-sm text-gray-500">
                          ${doctor.title}
                      </p>

                    </div>

                  </div>

                  <div class="mt-5 space-y-2">

                    <div class="text-sm">
                      <span class="text-gray-500">Matricule:</span>
                      <span class="font-medium">
                          ${doctor.matricule}
                      </span>
                    </div>

                    <div class="text-sm">
                      <span class="text-gray-500">Email:</span>
                      <span class="font-medium">
                          ${doctor.email}
                      </span>
                    </div>

                  </div>

                  <div class="mt-5 text-center
                px-4 py-2 rounded-lg
                bg-blue-600 text-white
                text-sm font-medium">

                    Choose Doctor

                  </div>

                </a>


              </c:forEach>


            </div>


          </c:when>

          <c:otherwise>


            <div class="text-center py-12">


              <h3 class="text-lg font-semibold
                                   text-gray-900">

                No doctors available

              </h3>


              <p class="text-sm text-gray-500 mt-2">

                There are currently no doctors
                available in the system.

              </p>


            </div>


          </c:otherwise>


        </c:choose>


      </div>

    </section>


    <section class="grid grid-cols-1 md:grid-cols-3
                    gap-6 mt-6">


      <a href="${pageContext.request.contextPath}/appointments/create"
         class="bg-blue-600 text-white
                  rounded-xl p-6
                  hover:bg-blue-700 transition">


        <h3 class="font-semibold text-lg">
          Book Appointment
        </h3>


        <p class="text-sm text-blue-100 mt-2">
          Schedule a consultation with a doctor.
        </p>


      </a>


      <a href="${pageContext.request.contextPath}/appointments"
         class="bg-white border border-gray-200
                  rounded-xl p-6
                  hover:shadow-md transition">


        <h3 class="font-semibold text-lg">
          My Appointments
        </h3>


        <p class="text-sm text-gray-500 mt-2">
          View and manage your appointments.
        </p>


      </a>


      <a href="${pageContext.request.contextPath}/medical-notes"
         class="bg-white border border-gray-200
                  rounded-xl p-6
                  hover:shadow-md transition">


        <h3 class="font-semibold text-lg">
          My Medical Notes
        </h3>


        <p class="text-sm text-gray-500 mt-2">
          View your medical history and notes.
        </p>


      </a>

    </section>


  </main>

</div>

</body>

</html>
