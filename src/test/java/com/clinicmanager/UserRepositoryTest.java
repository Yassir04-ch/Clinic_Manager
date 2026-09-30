package com.clinicmanager;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;
import com.clinicmanager.repository.JpaUserRepository;
import com.clinicmanager.repository.UserRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class UserRepositoryTest {

    @Test
    void testSaveAndFindUser() {


    }
}