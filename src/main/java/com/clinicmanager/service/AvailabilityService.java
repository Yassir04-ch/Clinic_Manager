package com.clinicmanager.service;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.model.Availability;
import com.clinicmanager.repository.AvailabilityRepository;
import com.clinicmanager.repository.jpa.JpaAvailabilityRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.util.List;
import java.util.UUID;

public class AvailabilityService {

    private final EntityManagerFactory factory;

    public AvailabilityService() {
        this.factory = JPAConfig.getFactory();
    }

    public void createAvailability(Availability availability) {

        EntityManager entityManager = factory.createEntityManager();

        try {
            entityManager.getTransaction().begin();
            AvailabilityRepository repository = new JpaAvailabilityRepository(entityManager);
            repository.save(availability);
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

    public List<Availability> findByDoctor(UUID doctorId) {

        EntityManager entityManager = factory.createEntityManager();
        try {
            AvailabilityRepository repository = new JpaAvailabilityRepository(entityManager);
            return repository.findByDoctor(doctorId);
        } finally {
            entityManager.close();
        }
    }

    public Availability findById(UUID id) {
        EntityManager entityManager = factory.createEntityManager();
        try {
            AvailabilityRepository repository = new JpaAvailabilityRepository(entityManager);
            return repository.findById(id);
        } finally {
            entityManager.close();
        }
    }

    public void updateAvailability(Availability availability) {

        EntityManager entityManager = factory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            AvailabilityRepository repository = new JpaAvailabilityRepository(entityManager);
            repository.update(availability);
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

    public void deleteAvailability(Availability availability) {

        EntityManager entityManager = factory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            AvailabilityRepository repository = new JpaAvailabilityRepository(entityManager);
            repository.delete(availability);
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