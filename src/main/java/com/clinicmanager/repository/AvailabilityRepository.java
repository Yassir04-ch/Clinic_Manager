package com.clinicmanager.repository;
import com.clinicmanager.model.Availability;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

public interface AvailabilityRepository {

    void save(Availability availability);

    Availability findById(UUID id);

    List<Availability> findByDoctor(UUID doctorId);

    void update(Availability availability);

    void delete(Availability availability);

    boolean isDoctorAvailable(UUID doctorId, LocalDate date, LocalTime startTime, LocalTime endTime);
}