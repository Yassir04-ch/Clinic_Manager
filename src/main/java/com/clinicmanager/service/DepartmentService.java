package com.clinicmanager.service;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.model.Department;
import com.clinicmanager.repository.DepartmentRepository;
import com.clinicmanager.repository.jpa.JpaDepartmentRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.util.List;
import java.util.UUID;

public class DepartmentService {
    private final EntityManagerFactory factory ;

    public DepartmentService() {
        this.factory = JPAConfig.getFactory();
    }

    public void createDepartment(Department department){

        EntityManager entityManager = factory.createEntityManager();

        try {
            entityManager.getTransaction().begin();
            JpaDepartmentRepository departmentRepository = new JpaDepartmentRepository(entityManager);
            departmentRepository.save(department);
            entityManager.getTransaction().commit();
        }catch (Exception e){
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw e;
        }finally {
            entityManager.close();
        }
    }

    public List<Department> findAll() {

        EntityManager entityManager =
                factory.createEntityManager();

        try {
            JpaDepartmentRepository departmentRepository = new JpaDepartmentRepository(entityManager);

            return departmentRepository.findAll();

        } finally {
            entityManager.close();
        }
    }

    public Department findById(UUID id) {

        EntityManager entityManager =
                factory.createEntityManager();

        try {
            DepartmentRepository repository =
                    new JpaDepartmentRepository(entityManager);

            return repository.findById(id);

        } finally {
            entityManager.close();
        }
    }

    public void updateDepartment(Department department){
        EntityManager entityManager = this .factory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            JpaDepartmentRepository departmentRepository = new JpaDepartmentRepository(entityManager);
            departmentRepository.update(department);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw e;
        }finally {
            entityManager.close();
        }
    }

}
