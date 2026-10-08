<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Create Availability - ClinicManager</title>

  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 min-h-screen">

<div class="min-h-screen flex items-center justify-center px-4 py-10">

  <div class="w-full max-w-2xl">

    <!-- Header -->
    <div class="mb-6">

      <a href="${pageContext.request.contextPath}/dashboard/doctor"
         class="text-sm text-blue-600 hover:text-blue-700">
        ← Back to Dashboard
      </a>

      <h1 class="text-3xl font-bold text-gray-800 mt-4">
        Create Availability
      </h1>

      <p class="text-gray-500 mt-1">
        Define your working hours and availability.
      </p>

    </div>


    <!-- Error -->
    <% if (request.getAttribute("error") != null) { %>

    <div class="mb-6 p-4 rounded-lg bg-red-50 border border-red-200 text-red-700">

      <div class="flex items-center gap-2">

        <span>⚠️</span>

        <p>
          <%= request.getAttribute("error") %>
        </p>

      </div>

    </div>

    <% } %>


    <!-- Form Card -->
    <div class="bg-white rounded-2xl shadow-sm border border-gray-200">

      <!-- Card Header -->
      <div class="px-6 py-5 border-b border-gray-200">

        <h2 class="text-lg font-semibold text-gray-800">
          Availability Information
        </h2>

        <p class="text-sm text-gray-500 mt-1">
          Please provide the details of your availability.
        </p>

      </div>


      <!-- Form -->
      <form action="${pageContext.request.contextPath}/availabilities/create" method="post" class="p-6 space-y-6">


        <!-- Day -->
        <div>

          <label for="dayOfWeek"
                 class="block text-sm font-medium text-gray-700 mb-2">
            Day of Week
          </label>

          <select
                  id="dayOfWeek"
                  name="dayOfWeek"
                  required
                  class="w-full px-4 py-3 border border-gray-300 rounded-lg
                                   focus:ring-2 focus:ring-blue-500
                                   focus:border-blue-500 outline-none">

            <option value="">Select a day</option>

            <option value="MONDAY">Monday</option>
            <option value="TUESDAY">Tuesday</option>
            <option value="WEDNESDAY">Wednesday</option>
            <option value="THURSDAY">Thursday</option>
            <option value="FRIDAY">Friday</option>
            <option value="SATURDAY">Saturday</option>
            <option value="SUNDAY">Sunday</option>

          </select>

        </div>


        <!-- Time -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

          <!-- Start -->
          <div>

            <label for="startTime"
                   class="block text-sm font-medium text-gray-700 mb-2">
              Start Time
            </label>

            <input
                    type="time"
                    id="startTime"
                    name="startTime"
                    required
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg
                                       focus:ring-2 focus:ring-blue-500
                                       focus:border-blue-500 outline-none">

          </div>


          <!-- End -->
          <div>

            <label for="endTime"
                   class="block text-sm font-medium text-gray-700 mb-2">
              End Time
            </label>

            <input
                    type="time"
                    id="endTime"
                    name="endTime"
                    required
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg
                                       focus:ring-2 focus:ring-blue-500
                                       focus:border-blue-500 outline-none">

          </div>

        </div>


        <!-- Status -->
        <div>

          <label for="status"
                 class="block text-sm font-medium text-gray-700 mb-2">
            Status
          </label>

          <select
                  id="status"
                  name="status"
                  required
                  class="w-full px-4 py-3 border border-gray-300 rounded-lg
                                   focus:ring-2 focus:ring-blue-500
                                   focus:border-blue-500 outline-none">

            <option value="ACTIVE">
              Available
            </option>

            <option value="INACTIVE">
              Unavailable
            </option>

          </select>

        </div>


        <!-- Validity -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

          <!-- Valid From -->
          <div>

            <label for="validFrom"
                   class="block text-sm font-medium text-gray-700 mb-2">
              Valid From
            </label>

            <input
                    type="date"
                    id="validFrom"
                    name="validFrom"
                    required
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg
                                       focus:ring-2 focus:ring-blue-500
                                       focus:border-blue-500 outline-none">

          </div>


          <!-- Valid To -->
          <div>

            <label for="validTo"
                   class="block text-sm font-medium text-gray-700 mb-2">
              Valid To
            </label>

            <input
                    type="date"
                    id="validTo"
                    name="validTo"
                    required
                    class="w-full px-4 py-3 border border-gray-300 rounded-lg
                                       focus:ring-2 focus:ring-blue-500
                                       focus:border-blue-500 outline-none">

          </div>

        </div>


        <!-- Info -->
        <div class="p-4 bg-blue-50 border border-blue-100 rounded-lg">

          <div class="flex gap-3">

                        <span class="text-blue-600">
                            ℹ️
                        </span>

            <div>

              <p class="text-sm font-medium text-blue-800">
                Availability information
              </p>

              <p class="text-sm text-blue-700 mt-1">
                This availability will be associated automatically
                with your doctor account.
              </p>

            </div>

          </div>

        </div>


        <!-- Buttons -->
        <div class="flex flex-col sm:flex-row gap-3 pt-2">

          <a
                  href="${pageContext.request.contextPath}/dashboard/doctor"
                  class="flex-1 text-center px-5 py-3
                                   border border-gray-300 rounded-lg
                                   text-gray-700 font-medium
                                   hover:bg-gray-50 transition">

            Cancel

          </a>


          <button
                  type="submit"
                  class="flex-1 px-5 py-3
                                   bg-blue-600 text-white rounded-lg
                                   font-medium
                                   hover:bg-blue-700
                                   transition">

            Save Availability

          </button>

        </div>

      </form>

    </div>

  </div>

</div>

</body>

</html>