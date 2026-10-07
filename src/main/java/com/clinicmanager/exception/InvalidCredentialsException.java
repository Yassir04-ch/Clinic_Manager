package com.clinicmanager.exception;

public class InvalidCredentialsException extends RuntimeException {

    public InvalidCredentialsException(String message) {
        super(message);
    }

    public static class AppointmentConflictException extends RuntimeException {
        public AppointmentConflictException(String message) {
            super(message);
        }
    }
}