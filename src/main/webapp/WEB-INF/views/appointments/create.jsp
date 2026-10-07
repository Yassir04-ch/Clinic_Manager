<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Book Appointment</title>

    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-100 min-h-screen">

<div class="max-w-5xl mx-auto px-6 py-10">

    <!-- Header -->
    <div class="mb-8">
        <a href="${pageContext.request.contextPath}/appointments"
           class="text-sm text-slate-500 hover:text-blue-600">
            ← Back to my appointments
        </a>

        <h1 class="text-3xl font-bold text-slate-800 mt-4">
            Book an Appointment
        </h1>

        <p class="text-slate-500 mt-2">
            Choose a suitable date and time for your consultation.
        </p>
    </div>


    <!-- Error message -->
    <c:if test="${not empty error}">
        <div class="mb-6 rounded-lg border border-red-200 bg-red-50 px-5 py-4 text-red-700">
            <div class="flex items-center gap-3">
                <span class="font-semibold">Error:</span>
                <span>${error}</span>
            </div>
        </div>
    </c:if>


    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

        <!-- LEFT SIDE -->
        <div class="lg:col-span-1 space-y-6">

            <!-- Doctor Card -->
            <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6">

                <div class="flex items-center gap-4 mb-5">

                    <!-- Avatar -->
                    <div class="w-14 h-14 rounded-full bg-blue-100
                                flex items-center justify-center
                                text-blue-700 text-xl font-bold">

                        ${doctor.firstName.substring(0,1)}
                        ${doctor.lastName.substring(0,1)}

                    </div>

                    <div>
                        <h2 class="text-lg font-bold text-slate-800">
                            Dr. ${doctor.firstName} ${doctor.lastName}
                        </h2>

                        <p class="text-sm text-blue-600">
                            ${doctor.title}
                        </p>
                    </div>

                </div>

                <div class="space-y-3 text-sm">

                    <div>
                        <p class="text-slate-400">Email</p>
                        <p class="text-slate-700">
                            ${doctor.email}
                        </p>
                    </div>

                    <div>
                        <p class="text-slate-400">Matricule</p>
                        <p class="text-slate-700">
                            ${doctor.matricule}
                        </p>
                    </div>

                    <c:if test="${not empty doctor.specialty}">
                        <div>
                            <p class="text-slate-400">Specialty</p>
                            <p class="text-slate-700 font-medium">
                                    ${doctor.specialty.name}
                            </p>
                        </div>
                    </c:if>

                </div>

            </div>


            <!-- Availability -->
            <div class="bg-white rounded-2xl shadow-sm border border-slate-200 p-6">

                <div class="mb-5">
                    <h2 class="text-lg font-bold text-slate-800">
                        Doctor's Availability
                    </h2>

                    <p class="text-sm text-slate-500 mt-1">
                        Available consultation periods.
                    </p>
                </div>


                <c:choose>

                    <c:when test="${not empty doctor}">

                        <div class="space-y-3">

                            <c:forEach var="availability"
                                       items="${availabilities}">

                                <div class="rounded-xl border border-slate-200
                                            p-4 bg-slate-50">

                                    <div class="flex items-center justify-between mb-2">

                                        <span class="font-semibold text-slate-800">
                                                ${availability.dayOfWeek}
                                        </span>

                                        <c:choose>

                                            <c:when test="${availability.status == 'AVAILABLE'}">

                                                <span class="text-xs font-medium
                                                             bg-green-100 text-green-700
                                                             px-2.5 py-1 rounded-full">
                                                    Available
                                                </span>

                                            </c:when>

                                            <c:otherwise>

                                                <span class="text-xs font-medium
                                                             bg-red-100 text-red-700
                                                             px-2.5 py-1 rounded-full">
                                                    Unavailable
                                                </span>

                                            </c:otherwise>

                                        </c:choose>

                                    </div>


                                    <p class="text-sm text-slate-600">

                                            ${availability.startTime}
                                        -
                                            ${availability.endTime}

                                    </p>


                                    <c:if test="${not empty availability.validFrom
                                                  or not empty availability.validTo}">

                                        <p class="text-xs text-slate-400 mt-2">

                                            Valid from
                                                ${availability.validFrom}

                                            <c:if test="${not empty availability.validTo}">
                                                to ${availability.validTo}
                                            </c:if>

                                        </p>

                                    </c:if>

                                </div>

                            </c:forEach>

                        </div>

                    </c:when>


                    <c:otherwise>

                        <div class="rounded-xl bg-yellow-50
                                    border border-yellow-200
                                    p-4 text-sm text-yellow-700">

                            This doctor has no availability configured.

                        </div>

                    </c:otherwise>

                </c:choose>

            </div>

        </div>


        <!-- RIGHT SIDE : FORM -->
        <div class="lg:col-span-2">

            <div class="bg-white rounded-2xl shadow-sm
                        border border-slate-200 p-8">

                <div class="mb-7">

                    <h2 class="text-xl font-bold text-slate-800">
                        Appointment Details
                    </h2>

                    <p class="text-sm text-slate-500 mt-1">
                        Enter the details of your appointment.
                    </p>

                </div>


                <form
                        action="${pageContext.request.contextPath}/appointments/create"
                        method="post"
                        class="space-y-6">


                    <!-- Doctor ID -->
                    <input
                            type="hidden"
                            name="doctorId"
                            value="${doctor.id}"
                    >


                    <!-- Date -->
                    <div>

                        <label
                                for="date"
                                class="block text-sm font-medium
                                       text-slate-700 mb-2">

                            Appointment Date

                        </label>

                        <input
                                type="date"
                                id="date"
                                name="date"
                                required
                                class="w-full rounded-lg border
                                       border-slate-300 px-4 py-3
                                       text-slate-700
                                       focus:outline-none
                                       focus:ring-2
                                       focus:ring-blue-500
                                       focus:border-blue-500"
                        >

                        <p class="text-xs text-slate-400 mt-2">
                            Select a date according to the doctor's availability.
                        </p>

                    </div>


                    <!-- Time -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

                        <!-- Start -->
                        <div>

                            <label
                                    for="startTime"
                                    class="block text-sm font-medium
                                           text-slate-700 mb-2">

                                Start Time

                            </label>

                            <input
                                    type="time"
                                    id="startTime"
                                    name="startTime"
                                    required
                                    class="w-full rounded-lg border
                                           border-slate-300 px-4 py-3
                                           text-slate-700
                                           focus:outline-none
                                           focus:ring-2
                                           focus:ring-blue-500
                                           focus:border-blue-500"
                            >

                        </div>


                        <!-- End -->
                        <div>

                            <label
                                    for="endTime"
                                    class="block text-sm font-medium
                                           text-slate-700 mb-2">

                                End Time

                            </label>

                            <input
                                    type="time"
                                    id="endTime"
                                    name="endTime"
                                    required
                                    class="w-full rounded-lg border
                                           border-slate-300 px-4 py-3
                                           text-slate-700
                                           focus:outline-none
                                           focus:ring-2
                                           focus:ring-blue-500
                                           focus:border-blue-500"
                            >

                        </div>

                    </div>


                    <!-- Appointment Type -->
                    <div>

                        <label
                                for="type"
                                class="block text-sm font-medium
                                       text-slate-700 mb-2">

                            Appointment Type

                        </label>

                        <select
                                id="type"
                                name="type"
                                required
                                class="w-full rounded-lg border
                                       border-slate-300 px-4 py-3
                                       text-slate-700 bg-white
                                       focus:outline-none
                                       focus:ring-2
                                       focus:ring-blue-500
                                       focus:border-blue-500">

                            <option value="">
                                -- Select appointment type --
                            </option>

                            <option value="CONSULTATION">
                                Consultation
                            </option>

                            <option value="FOLLOW_UP">
                                Follow Up
                            </option>

                            <option value="URGENT">
                                Urgent
                            </option>

                        </select>

                    </div>


                    <!-- Reason -->
                    <div>

                        <label
                                for="reason"
                                class="block text-sm font-medium
                                       text-slate-700 mb-2">

                            Reason

                        </label>

                        <textarea
                                id="reason"
                                name="reason"
                                maxlength="500"
                                rows="5"
                                placeholder="Describe the reason for your appointment..."
                                class="w-full rounded-lg border
                                       border-slate-300 px-4 py-3
                                       text-slate-700
                                       resize-none
                                       focus:outline-none
                                       focus:ring-2
                                       focus:ring-blue-500
                                       focus:border-blue-500"></textarea>

                        <p class="text-xs text-slate-400 mt-2">
                            Maximum 500 characters.
                        </p>

                    </div>


                    <!-- Actions -->
                    <div class="flex flex-col sm:flex-row
                                gap-3 pt-4">

                        <a
                                href="${pageContext.request.contextPath}/appointments"
                                class="flex-1 text-center
                                       rounded-lg border
                                       border-slate-300
                                       px-5 py-3
                                       font-medium text-slate-600
                                       hover:bg-slate-50
                                       transition">

                            Cancel

                        </a>


                        <button
                                type="submit"
                                class="flex-1 rounded-lg
                                       bg-blue-600 px-5 py-3
                                       font-semibold text-white
                                       hover:bg-blue-700
                                       transition">

                            Book Appointment

                        </button>

                    </div>

                </form>

            </div>

        </div>

    </div>

</div>

</body>
</html>
