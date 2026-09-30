package com.clinicmanager.service;

import com.clinicmanager.config.JPAConfig;
import com.clinicmanager.model.User;
import com.clinicmanager.repository.JpaUserRepository;
import com.clinicmanager.repository.UserRepository;
import com.clinicmanager.utils.PasswordUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;

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
}
