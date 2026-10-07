package com.clinicmanager.repository.jpa;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;
import com.clinicmanager.repository.UserRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;
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
    public Optional<User> findById(UUID id) {
        return Optional.ofNullable(entityManager.find(User.class, id));
    }
    @Override
    public User findByEmail(String email) {
        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM User u WHERE u.email = :email",
                User.class);
        query.setParameter("email", email);
        return query.getResultStream().findFirst().orElse(null);
    }

    @Override
    public List<User> findByRole(Role role) {
        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM User u WHERE u.role = :role", User.class);
        query.setParameter("role", role);
        return query.getResultList();
    }

    @Override
    public void update(User user){
        entityManager.merge(user);
    }
}