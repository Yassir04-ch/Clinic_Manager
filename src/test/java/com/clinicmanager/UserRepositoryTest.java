
package com.clinicmanager;

import com.clinicmanager.model.User;
import com.clinicmanager.repository.jpa.JpaUserRepository;
import jakarta.persistence.EntityManager;
import org.junit.jupiter.api.Test;

import java.util.Optional;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;

class UserRepositoryTest {

    @Test
    void testSave() {

        EntityManager entityManager = mock(EntityManager.class);
        JpaUserRepository repository = new JpaUserRepository(entityManager);

        User user = new User();
        repository.save(user);

        verify(entityManager).persist(user);
    }

    @Test
    void testUpdate(){
        EntityManager entityManager = mock(EntityManager.class);
        JpaUserRepository repository = new JpaUserRepository(entityManager);
        User user = new User();
        repository.update(user);
        verify(entityManager).merge(user);
    }

    @Test
    void testFindById() {
        EntityManager entityManager = mock(EntityManager.class);
        JpaUserRepository repository = new JpaUserRepository(entityManager);

        UUID id = UUID.randomUUID();
        User user = new User();

        when(entityManager.find(User.class, id)).thenReturn(user);
        Optional<User> result = repository.findById(id);

        assertTrue(result.isPresent());
        assertEquals(user, result.get());

        verify(entityManager).find(User.class, id);
    }
}