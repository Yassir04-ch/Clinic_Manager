package com.clinicmanager.service;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.model.Department;
import com.clinicmanager.model.Specialty;
import com.clinicmanager.repository.jpa.JpaSpecialtyRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.util.List;
import java.util.UUID;

public class SpecialtyService {
    private final EntityManagerFactory factory;

    public SpecialtyService(){
        this.factory = JPAConfig.getFactory();
    }

    public void createSpeciality(Specialty specialty){

        EntityManager entityManager = this.factory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            JpaSpecialtyRepository specialtyRepository = new JpaSpecialtyRepository(entityManager);
            specialtyRepository.save(specialty);
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

    public List<Specialty> findAll() {

        EntityManager entityManager = factory.createEntityManager();
        try {
            JpaSpecialtyRepository repository = new JpaSpecialtyRepository(entityManager);
            return repository.finAll();
        } finally {
            entityManager.close();
        }
    }

    public Specialty findById(UUID id) {

        EntityManager entityManager = factory.createEntityManager();
        try {
            JpaSpecialtyRepository repository = new JpaSpecialtyRepository(entityManager);
            return repository.findById(id);
        } finally {
            entityManager.close();
        }
    }

    public List<Specialty> findByDepartment(Department department) {

        EntityManager entityManager = factory.createEntityManager();
        try {
            JpaSpecialtyRepository repository = new JpaSpecialtyRepository(entityManager);
            return repository.findByDepartement(department);
        } finally {
            entityManager.close();
        }
    }

    public void updateSpecialty(Specialty specialty) {

        EntityManager entityManager = factory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            JpaSpecialtyRepository repository = new JpaSpecialtyRepository(entityManager);
            repository.update(specialty);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw e;
        } finally {
            entityManager.close();
        }
    }

}
