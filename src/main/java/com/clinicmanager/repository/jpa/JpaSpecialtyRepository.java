package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.Department;
import com.clinicmanager.model.Specialty;
import com.clinicmanager.repository.SpecialtyRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.UUID;

public class JpaSpecialtyRepository implements SpecialtyRepository {
     private final EntityManager entityManager;

     public JpaSpecialtyRepository(EntityManager entityManager){
         this.entityManager = entityManager;
     }

    @Override
    public void save(Specialty specialty) {
         entityManager.persist(specialty);
    }

    @Override
    public List<Specialty> finAll() {
        return entityManager.createQuery("SELECT s FROM Specialty s",Specialty.class)
                             .getResultList();
    }

    @Override
    public Specialty findById(UUID id) {
        return entityManager.find(Specialty.class , id);
    }

    @Override
    public List<Specialty> findByDepartement(Department department) {
        TypedQuery<Specialty> query = entityManager.createQuery("SELECT s FROM Specialty s WHERE s.department.id = :departments_id", Specialty.class);
        query.setParameter("departments_id",department.getId());
        return query.getResultList();
     }

    @Override
    public void update(Specialty specialty) {
       entityManager.merge(specialty);
    }
}
