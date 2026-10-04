package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.Department;
import com.clinicmanager.model.Specialty;
import com.clinicmanager.repository.SpecialtyRepository;

import java.util.List;
import java.util.UUID;

public class JpaSpecialtyRepository implements SpecialtyRepository {
    @Override
    public void save(Specialty specialty) {

    }

    @Override
    public List<Specialty> finAll() {
        return List.of();
    }

    @Override
    public Specialty findById(UUID id) {
        return null;
    }

    @Override
    public List<Specialty> findByDepartement(Department department) {
        return List.of();
    }

    @Override
    public void update(Specialty specialty) {

    }
}
