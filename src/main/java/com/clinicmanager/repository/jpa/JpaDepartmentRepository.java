package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.Department;
import com.clinicmanager.repository.DepartmentRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.UUID;

public class JpaDepartmentRepository implements DepartmentRepository {

    private final EntityManager entityManager;

    public JpaDepartmentRepository(EntityManager entityManager){
        this.entityManager = entityManager;
    }
    @Override
    public void save(Department department) {
        entityManager.persist(department);
    }

    @Override
    public Department findById(UUID id) {
      return entityManager.find(Department.class,id);
    }

    @Override
    public List<Department> findAll() {
          return entityManager.createQuery("SELECT d FROM Department d",
                          Department.class).getResultList();
    }

    @Override
    public void update(Department department) {
        entityManager.merge(department);
    }
}
