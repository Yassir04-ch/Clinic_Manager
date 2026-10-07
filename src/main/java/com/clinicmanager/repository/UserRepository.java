package com.clinicmanager.repository;

import com.clinicmanager.model.User;
import com.clinicmanager.model.enums.Role;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserRepository {

    void save(User user);

    Optional<User> findById(UUID id);

    User findByEmail(String email);

    void update(User user);

    List<User> findByRole(Role role);

}