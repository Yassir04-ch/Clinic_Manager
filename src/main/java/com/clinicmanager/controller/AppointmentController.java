package com.clinicmanager.controller;

import com.clinicmanager.model.Appointment;
import com.clinicmanager.model.AppointmentService;
import com.clinicmanager.model.Doctor;
import com.clinicmanager.model.Patient;
import com.clinicmanager.model.enums.AppointmentStatus;
import com.clinicmanager.model.enums.AppointmentType;
import com.clinicmanager.model.enums.Role;
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

    @Override
    public void doGet(HttpServletRequest request , HttpServletResponse response)
                     throws ServletException , IOException
    {
        String path = request.getPathInfo();
        HttpSession session = request.getSession();
        Patient patient =(Patient) session.getAttribute("user");

        if(patient.getRole() != Role.PATIENT){
            response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
            return;
        }

        if("/create".equals(path)){
            request.getRequestDispatcher("/WEB-INF/views/appointments/create.jsp").forward(request, response);
        } else if (path !=null && path.startsWith("/update/")) {
            String idPath = path.substring("/update/".length());
            UUID id = UUID.fromString(idPath);
            Appointment appointment = this.appointmentService.findById(id);
            request.setAttribute("appointments", appointment);
            request.getRequestDispatcher("/WEB-INF/views/appointments/update.jsp").forward(request, response);
        }else {
            List<Appointment> appointment = appointmentService.findByPatient(patient.getId());
            request.setAttribute("appointments",appointment );
            request.getRequestDispatcher("/WEB-INF/views/appointments/list.jsp").forward(request, response);

        }
    }

    @Override
    public void doPost(HttpServletRequest request , HttpServletResponse response)
        throws ServletException , IOException
    {

        HttpSession session = request.getSession();
        String path = request.getPathInfo();
        Patient patient = (Patient) session.getAttribute("user");
        if("/create".equals(path)){
              try{

                  UUID doctorId = UUID.fromString(request.getParameter("doctorId"));

                  LocalDate date = LocalDate.parse(request.getParameter("date"));

                  LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));

                  LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));

                  AppointmentType type = AppointmentType.valueOf(request.getParameter("type"));

                  String reason = request.getParameter("reason");

                  Doctor doctor = new Doctor();
                  doctor.setId(doctorId);

                  Appointment appointment = new Appointment(patient, doctor, date, startTime, endTime, type, reason, AppointmentStatus.PLANNED);
                  appointmentService.createAppointment(appointment);

                  response.sendRedirect(request.getContextPath() + "/appointments");


              } catch (Exception e) {
                  request.setAttribute("error", "Erreur lors de la création du rendez-vous.");
                  request.getRequestDispatcher("/WEB-INF/views/appointments/create.jsp").forward(request, response);
              }
        }

    }
}
