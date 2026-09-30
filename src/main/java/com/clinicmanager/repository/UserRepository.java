package com.clinicmanager.repository;

import com.clinicmanager.model.User;

import java.util.UUID;

public interface UserRepository {

    void save(User user);

    User findById(UUID id);

    User findByEmail(String email);

}