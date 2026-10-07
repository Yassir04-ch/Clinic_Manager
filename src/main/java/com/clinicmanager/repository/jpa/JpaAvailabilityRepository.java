package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.Availability;
import com.clinicmanager.repository.AvailabilityRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

public class JpaAvailabilityRepository implements AvailabilityRepository {

    private final EntityManager entityManager;

    public JpaAvailabilityRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public void save(Availability availability) {
        entityManager.persist(availability);
    }

    @Override
    public Availability findById(UUID id) {
        return entityManager.find(Availability.class, id);
    }

    @Override
    public List<Availability> findByDoctor(UUID doctorId) {

        TypedQuery<Availability> query = entityManager.createQuery("SELECT a FROM Availability a WHERE a.doctor.id = :id",Availability.class);
        query.setParameter("id", doctorId);
        return query.getResultList();
    }

    @Override
    public void update(Availability availability) {
        entityManager.merge(availability);
    }

    @Override
    public void delete(Availability availability) {
        entityManager.remove(availability);
    }

    @Override
    public boolean isDoctorAvailable(UUID doctorId, LocalDate date, LocalTime startTime, LocalTime endTime){
        TypedQuery<Long> query = entityManager.createQuery("SELECT a FROM Availability a WHERE a.doctor.id = :id" +
                " AND a.dayOfWeek =:dayOfweek AND a.validFrom <= :start AND a.validTo >= :end",Long.class);
        query.setParameter("id",doctorId);
        query.setParameter("start",startTime);
        query.setParameter("end",endTime);
        return query.getSingleResult() > 0;
    }
}