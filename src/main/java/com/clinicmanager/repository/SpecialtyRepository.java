package com.clinicmanager.repository;

import com.clinicmanager.model.Department;
import com.clinicmanager.model.Specialty;

import java.util.List;
import java.util.UUID;

public interface SpecialtyRepository {

    void save(Specialty specialty);

    List<Specialty> finAll();

    Specialty findById(UUID id);

    List<Specialty> findByDepartement(Department department);

    void update(Specialty specialty);
}
