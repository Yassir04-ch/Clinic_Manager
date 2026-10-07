package com.clinicmanager.service;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.exception.InvalidCredentialsException;
import com.clinicmanager.exception.UserNotFoundException;
import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;
import com.clinicmanager.repository.jpa.JpaUserRepository;
import com.clinicmanager.repository.UserRepository;
import com.clinicmanager.utils.PasswordUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public class UserService {
    private final EntityManagerFactory factory;

    public UserService(){
        this.factory = JPAConfig.getFactory();
    }

    public void createUser(User user){
        String hashedPassword = PasswordUtil.hashPassword(user.getPassword());

        user.setPassword(hashedPassword);

        EntityManager entityManager = this.factory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            UserRepository repository = new JpaUserRepository(entityManager);
            repository.save(user);
            entityManager.getTransaction().commit();
        }catch (Exception e){
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw e;
        }finally {
            entityManager.close();
        }
    }

    public User login(String email ,String password ){
        EntityManager entityManager = this.factory.createEntityManager();
        try{
            UserRepository repository = new JpaUserRepository(entityManager);
            User user = repository.findByEmail(email);
            if(user == null){
                throw new InvalidCredentialsException("Email incorrect");
            }
            if(!PasswordUtil.checkPassword(password, user.getPassword())){
                throw new InvalidCredentialsException("password incorrect");
            }
            return user;
        }finally {
            entityManager.close();
        }
    }

    public void updateProfile(User user){
        EntityManager entityManager = factory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            JpaUserRepository userRepository = new JpaUserRepository(entityManager);
            userRepository.update(user);
            entityManager.getTransaction().commit();
        }catch (Exception e){
            if(entityManager.getTransaction().isActive()){
                entityManager.getTransaction().rollback();
            }
            throw e;
        }finally {
            entityManager.close();
        }
    }

    public User findById(UUID id) {
        EntityManager entityManager = factory.createEntityManager();
        try {
            UserRepository repository = new JpaUserRepository(entityManager);
            return repository.findById(id).orElseThrow(() -> new UserNotFoundException("User not found with"));
        } finally {
            entityManager.close();
        }
    }

    public List<User> findByRole(Role role){
        EntityManager entityManager = factory.createEntityManager();
        try{
            JpaUserRepository userRepository = new JpaUserRepository(entityManager);
            return userRepository.findByRole(role);
        }finally {
            entityManager.close();
        }
    }

}
