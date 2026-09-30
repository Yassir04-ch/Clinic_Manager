package com.clinicmanager.config;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    private static final EntityManagerFactory FACTORY = Persistence.createEntityManagerFactory("clinicManagerPU");

    public static EntityManagerFactory getFactory(){
        return FACTORY;
    }
}
