package com.clinicmanager.exception;

public class DoctorAbsentException extends RuntimeException {
    public DoctorAbsentException(String message) {
        super(message);
    }
}
