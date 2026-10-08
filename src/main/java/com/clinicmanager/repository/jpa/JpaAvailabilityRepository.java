package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.Availability;
import com.clinicmanager.repository.AvailabilityRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.time.DayOfWeek;
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
    public boolean isDoctorAvailable(UUID doctorId, LocalDate date, LocalTime startTime , LocalTime endTime){
        TypedQuery<Long> query = entityManager.createQuery("SELECT count(a.id) FROM Availability a WHERE a.doctor.id = :id" +
                " AND a.validFrom <=:date AND a.validTo >= :date AND a.startTime <= :endTime AND a.endTime >= :startTime",Long.class);
        query.setParameter("id",doctorId);
        query.setParameter("date",date);
        query.setParameter("endTime",endTime);
        query.setParameter("startTime",startTime);
        return query.getSingleResult() > 0;
    }

    @Override
    public boolean existsAvailability(UUID doctorId, DayOfWeek dayOfWeek,LocalDate validTo,
                                      LocalDate  validFrom, LocalTime startTime, LocalTime endTime){
        TypedQuery<Long> query = entityManager.createQuery(" SELECT COUNT(a.id) FROM Availability a WHERE a.doctor.id = :id " +
                        "AND a.dayOfWeek = :dayOfWeek AND a.startTime <= :endTime AND " +
                        "a.endTime >= :startTime AND a.validFrom <= :validFrom AND a.validTo >= :validTo", Long.class);
        query.setParameter("id", doctorId);
        query.setParameter("dayOfWeek", dayOfWeek);
        query.setParameter("endTime", endTime);
        query.setParameter("startTime", startTime);
        query.setParameter("validFrom", validFrom);
        query.setParameter("validTo", validTo);
        return query.getSingleResult() > 0;
    }

}