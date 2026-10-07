package com.clinicmanager.repository;

import com.clinicmanager.model.Appointment;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

public interface AppointmentRepository {

    void save(Appointment appointment);

    Appointment findById(UUID id);

    List<Appointment> findByPatient(UUID patientId);

    List<Appointment> findByDoctor(UUID doctorId);

    void update(Appointment appointment);

    void delete(Appointment appointment);

    boolean checkAppointment(UUID doctorId, LocalDate date, LocalTime startTime, LocalTime endTime);
}
