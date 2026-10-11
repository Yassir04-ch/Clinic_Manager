package com.clinicmanager.service;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.exception.InvalidAbsenceException;
import com.clinicmanager.model.Absence;
import com.clinicmanager.repository.jpa.JpaAbsenceRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public class AbsenceService {
    private final EntityManagerFactory factory;

    public AbsenceService(){
        this.factory = JPAConfig.getFactory();
    }


    public void createAbsence(Absence absence){
        validateAbsence(absence);

        EntityManager entityManager = this.factory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            JpaAbsenceRepository absenceRepositpry = new JpaAbsenceRepository(entityManager);
            absenceRepositpry.save(absence);
            entityManager.getTransaction().commit();
        } catch (RuntimeException e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw e;
        } finally {
            entityManager.close();
        }

    }

    public List<Absence> findAbsenceByDoctor(UUID doctorId){
            EntityManager entityManager = this.factory.createEntityManager();
        try{
            JpaAbsenceRepository absenceRepositpry = new JpaAbsenceRepository(entityManager);
            return absenceRepositpry.findByDoctor(doctorId);
        }finally {
            entityManager.close();
        }
    }

    public List<Absence> findAll(){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            JpaAbsenceRepository absenceRepositpry = new JpaAbsenceRepository(entityManager);
            return absenceRepositpry.findAll();
        }finally {
            entityManager.close();
        }
    }

    public void update(Absence absence){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            JpaAbsenceRepository absenceRepository = new JpaAbsenceRepository(entityManager);
            absenceRepository.update(absence);
            entityManager.getTransaction().commit();

        }catch (Exception e){
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw  e;
        }finally
         {
            entityManager.close();
        }
    }

    public Absence find(UUID id){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            JpaAbsenceRepository absenceRepository = new JpaAbsenceRepository(entityManager);
            return absenceRepository.find(id);
        }finally {
            entityManager.close();
        }
    }

    private void validateAbsence(Absence absence) {
        if (absence == null) {
            throw new InvalidAbsenceException("L'absence est obligatoire.");
        }

        if (absence.getDoctor() == null || absence.getDoctor().getId() == null) {
            throw new InvalidAbsenceException("Le médecin est obligatoire.");
        }

        LocalDate startDate = absence.getStartDate();
        LocalDate endDate = absence.getEndDate();

        if (startDate == null || endDate == null) {
            throw new InvalidAbsenceException("Les dates de début et de fin sont obligatoires.");
        }

        if (endDate.isBefore(startDate)) {
            throw new InvalidAbsenceException("La date de fin doit être égale ou postérieure à la date de début.");
        }

        }
}

