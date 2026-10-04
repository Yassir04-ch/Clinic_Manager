package com.clinicmanager.repository;

import com.clinicmanager.model.Department;

import java.util.List;
import java.util.UUID;

public interface DepartmentRepository {

    void save(Department department);

    Department findById(UUID id);

    List<Department> findAll();

    void update(Department department);
}
