package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.Absence;
import com.clinicmanager.model.enums.AbsenceStatus;
import com.clinicmanager.repository.AbsenceRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public class JpaAbsenceRepository implements AbsenceRepository {

    private final EntityManager entityManager;

    public  JpaAbsenceRepository(EntityManager entityManager){
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
    public Absence find(UUID id) {
        return  entityManager.find(Absence.class,id);
    }

    @Override
    public List<Absence> findByDoctor(UUID doctorId) {
        TypedQuery<Absence> query = entityManager.createQuery("SELECT a FROM Absence a WHERE a.doctor.id = :id",Absence.class);
        query.setParameter("id",doctorId);
        return query.getResultList();
    }

    @Override
    public List<Absence> findAll() {
        TypedQuery<Absence> query = entityManager.createQuery(
                "SELECT a FROM Absence a JOIN FETCH a.doctor ORDER BY a.startDate DESC", Absence.class);
        return query.getResultList();
    }
    @Override
    public void delete(Absence absence) {
      entityManager.remove(absence);
    }


    public boolean isDoctorAbsent(UUID doctorId, LocalDate date) {
        TypedQuery<Long> query = entityManager.createQuery(
                "SELECT COUNT(a.id) FROM Absence a WHERE a.doctor.id = :doctorId " +
                        "AND a.status = :status AND a.startDate <= :date " +
                        "AND a.endDate >= :date", Long.class);
        query.setParameter("doctorId", doctorId);
        query.setParameter("status", AbsenceStatus.APPROVED);
        query.setParameter("date", date);
        return query.getSingleResult() > 0;
    }
}
