package com.clinicmanager.service;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.exception.AppointmentConflictException;
import com.clinicmanager.exception.DoctorNotAvailableException;
import com.clinicmanager.model.Appointment;
import com.clinicmanager.repository.jpa.JpaAppointmentRepository;
import com.clinicmanager.repository.jpa.JpaAvailabilityRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.util.List;
import java.util.UUID;

public class AppointmentService {

    private final EntityManagerFactory factory;

    public AppointmentService() {
        this.factory = JPAConfig.getFactory();
    }

    public void createAppointment(Appointment appointment){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            JpaAppointmentRepository appointmentRepository = new JpaAppointmentRepository(entityManager);
            JpaAvailabilityRepository availabilityRepository = new JpaAvailabilityRepository(entityManager);
             boolean ckeck = appointmentRepository.checkAppointment(appointment.getDoctor().getId(),
                     appointment.getDate(),appointment.getStartTime(),appointment.getStartTime());
             boolean ckeckdoc = availabilityRepository.isDoctorAvailable( appointment.getDoctor().getId(), appointment.getDate(), appointment.getStartTime(), appointment.getEndTime());
             if(ckeck){
                 throw new AppointmentConflictException("Doctor already has an appointment at this time");
             }
             if(!ckeckdoc){
                 throw new DoctorNotAvailableException("Doctor already has an appointment at this time");
             }
            appointmentRepository.save(appointment);
            entityManager.getTransaction().commit();
        }catch (Exception e){
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw  e;
        }finally {
            entityManager.close();
        }

    }

    public void updateAppointment(Appointment appointment){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            JpaAppointmentRepository appointmentRepository = new JpaAppointmentRepository(entityManager);
            appointmentRepository.update(appointment);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw  e;
        }finally {
            entityManager.close();
        }
    }

    public List<Appointment> findByPatient(UUID patientId){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            JpaAppointmentRepository appointmentRepository = new JpaAppointmentRepository(entityManager);
            List<Appointment> appointments = appointmentRepository.findByPatient(patientId);
            return appointments;
        }finally {
            entityManager.close();
        }
    }

    public List<Appointment> findByDoctor(UUID doctorId){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            JpaAppointmentRepository appointmentRepository = new JpaAppointmentRepository(entityManager);
            List<Appointment> appointments = appointmentRepository.findByDoctor(doctorId);
            return appointments;
        }finally {
            entityManager.close();
        }
    }

    public Appointment findById(UUID id){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            JpaAppointmentRepository appointmentRepository = new JpaAppointmentRepository(entityManager);
            return  appointmentRepository.findById(id);
        }finally {
            entityManager.close();
        }
    }
}
