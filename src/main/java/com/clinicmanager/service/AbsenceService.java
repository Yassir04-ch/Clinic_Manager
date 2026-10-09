package com.clinicmanager.service;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.exception.InvalidAbsenceException;
import com.clinicmanager.model.Absence;
import com.clinicmanager.repository.jpa.JpaAbsenceRepositpry;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;

import java.time.LocalDate;

public class AbsenceService {
    private final EntityManagerFactory factory;

    public AbsenceService(){
        this.factory = JPAConfig.getFactory();
    }


    public void createAbsence(Absence absence){
        validateAbsence(absence);

        EntityManager entityManager = JPAConfig.getFactory().createEntityManager();
        try{
            entityManager.getTransaction().begin();
            JpaAbsenceRepositpry absenceRepositpry = new JpaAbsenceRepositpry(entityManager);
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

        if (absence.getReason() != null) {
            throw new InvalidAbsenceException("Le reason est obligatoire."
            );
        }
    }
}
