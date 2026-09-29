package com.clinicmanager.model;

import jakarta.persistence.*;

import java.util.stream.StreamSupport;

@Entity
@Table(name = "doctors")
public class Doctor extends User {

    @Column(unique = true, nullable = false)
    private String matricule;

    private String title;

    @ManyToOne
    @JoinColumn(name = "specialty_id", nullable = false)
    private Specialty specialty;

    private String department;

    public Doctor() {
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Specialty getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}