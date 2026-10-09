package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.Absence;
import com.clinicmanager.repository.AbsenceRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.UUID;

public class JpaAbsenceRepositpry implements AbsenceRepository {

    private final EntityManager entityManager;

    public  JpaAbsenceRepositpry(EntityManager entityManager){
        this.entityManager = entityManager;
    }
    @Override
    public void save(Absence absence) {
         entityManager.persist(absence);
    }

    @Override
    public void update(Absence absence) {
        entityManager.merge(absence);
    }

    @Override
    public List<Absence> findByDoctor(UUID doctorId) {
        TypedQuery<Absence> query = entityManager.createQuery("SELECT a FROM Absence a WHERE a.doctor.id = :id",Absence.class);
        query.setParameter("id",doctorId);
        return query.getResultList();
    }

    @Override
    public void delete(Absence absence) {
      entityManager.remove(absence);
    }
}
