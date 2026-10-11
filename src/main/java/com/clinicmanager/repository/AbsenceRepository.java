package com.clinicmanager.repository;

import com.clinicmanager.model.Absence;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public interface AbsenceRepository {
    void save(Absence absence);

    void update(Absence absence);

    List<Absence> findAll();

    Absence find(UUID id);

    List<Absence> findByDoctor(UUID doctorId);

    void delete(Absence absence);

    boolean isDoctorAbsent(UUID doctorId, LocalDate date);
}
