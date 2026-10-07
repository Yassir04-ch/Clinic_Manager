package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.Appointment;
import com.clinicmanager.repository.AppointmentRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;

public class JpaAppointmentRepository implements AppointmentRepository {

    private final EntityManager entityManager ;

    public JpaAppointmentRepository(EntityManager entityManager){
        this.entityManager = entityManager;
    }

    @Override
    public void save(Appointment appointment) {
          entityManager.persist(appointment);
    }

    @Override
    public Appointment findById(UUID id) {
        return entityManager.find(Appointment.class,id);
    }

    @Override
    public List<Appointment> findByPatient(UUID patientId) {
        TypedQuery<Appointment> query = entityManager.createQuery("SELECT a FROM Appointment a WHERE a.patient.id = :id",Appointment.class);
        query.setParameter("id",patientId);
        return query.getResultList();
    }

    @Override
    public List<Appointment> findByDoctor(UUID doctorId) {
        TypedQuery<Appointment> query = entityManager.createQuery("SELECT a FROM Appointment a WHERE a.doctor.id = :id",Appointment.class);
        query.setParameter("id",doctorId);
        return query.getResultList();
    }

    @Override
    public void update(Appointment appointment) {
      entityManager.merge(appointment);
    }

    @Override
    public void delete(Appointment appointment) {
        entityManager.remove(appointment);
    }

    @Override
    public boolean checkAppointment(UUID doctorId, LocalDate date, LocalTime startTime, LocalTime endTime) {
        TypedQuery<Long> query = entityManager.createQuery("SELECT count(a.id) FROM Appointment a WHERE a.doctor.id = :id " +
                "AND a.date = :date AND a.startTime < :and AND a.endTime > :start",Long.class);
        query.setParameter("id",doctorId);
        query.setParameter("date",date);
        query.setParameter("and",endTime);
        query.setParameter("start",startTime);
        return query.getSingleResult() > 0;
    }
}
