package com.clinicmanager.controller;

import com.clinicmanager.exception.AppointmentConflictException;
import com.clinicmanager.exception.DoctorNotAvailableException;
import com.clinicmanager.exception.UserNotFoundException;
import com.clinicmanager.model.*;
import com.clinicmanager.model.enums.AppointmentStatus;
import com.clinicmanager.model.enums.AppointmentType;
import com.clinicmanager.model.enums.Role;
import com.clinicmanager.service.AppointmentService;
import com.clinicmanager.service.AvailabilityService;
import com.clinicmanager.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

@WebServlet("/appointments/*")
public class AppointmentController extends HttpServlet {
    private final AppointmentService appointmentService = new AppointmentService();
    private final UserService userService = new UserService();
    private final AvailabilityService availabilityService = new AvailabilityService();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        HttpSession session = request.getSession();
        Patient patient = (Patient) session.getAttribute("user");

        if ("/create".equals(path)) {
            String doctorId = request.getParameter("doctorId");
            if (doctorId == null || doctorId.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Doctor is required");
                return;
            }

            try {
                UUID id = UUID.fromString(doctorId);
                User user = userService.findById(id);
                if (user.getRole() != Role.DOCTOR) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Selected doctor");
                    return;
                }
                Doctor doctor = (Doctor) user;
                List<Availability> availabilities = availabilityService.findByDoctor(id);
                request.setAttribute("doctor", doctor);
                request.setAttribute("availabilities", availabilities);
                request.getRequestDispatcher("/WEB-INF/views/appointments/create.jsp").forward(request, response);
            } catch (UserNotFoundException e) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, e.getMessage());
            }
        } else if (path != null && path.startsWith("/update/")) {
            String idPath = path.substring("/update/".length());
            UUID id = UUID.fromString(idPath);
            Appointment appointment = this.appointmentService.findById(id);
            request.setAttribute("appointments", appointment);
            request.getRequestDispatcher("/WEB-INF/views/appointments/update.jsp").forward(request, response);
        } else {
            List<Appointment> appointment = appointmentService.findByPatient(patient.getId());
            request.setAttribute("appointments", appointment);
            request.getRequestDispatcher("/WEB-INF/views/appointments/list.jsp").forward(request, response);

        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String path = request.getPathInfo();
        Patient patient = (Patient) session.getAttribute("user");

        if ("/create".equals(path)) {

            try {
                UUID doctorId = UUID.fromString(request.getParameter("doctorId"));
                LocalDate date = LocalDate.parse(request.getParameter("date"));
                LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));
                LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));
                AppointmentType type = AppointmentType.valueOf(request.getParameter("type"));
                String reason = request.getParameter("reason");

                User user = userService.findById(doctorId);
                if (user.getRole() != Role.DOCTOR) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Selected doctor");
                    return;
                }

                Doctor doctor = (Doctor) user;
                Appointment appointment = new Appointment(patient, doctor, date, startTime, endTime, type, reason, AppointmentStatus.PLANNED);
                appointmentService.createAppointment(appointment);
                response.sendRedirect(request.getContextPath() + "/appointments");

            } catch (AppointmentConflictException e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/appointments/create.jsp"
                ).forward(request, response);
            } catch (DoctorNotAvailableException e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("/WEB-INF/views/appointments/create.jsp"
                ).forward(request, response);
            }   catch (UserNotFoundException e) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, e.getMessage());
          }

        }
    }
}
