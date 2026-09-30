package com.clinicmanager.repository;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.UUID;

public class JpaUserRepository implements UserRepository {

    private final EntityManager entityManager;

    public JpaUserRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public void save(User user) {
        entityManager.persist(user);
    }

    @Override
    public User findById(UUID id) {
        return entityManager.find(User.class, id);
    }

    @Override
    public User findByEmail(String email) {
        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email",
                User.class);
        query.setParameter("email", email);
        return query.getResultStream().findFirst().orElse(null);
    }
}