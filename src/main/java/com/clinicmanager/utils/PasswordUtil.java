package com.clinicmanager.utils;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    public static String hashPassword(String password){
        String passwordHash = BCrypt.hashpw(password , BCrypt.gensalt());
        return passwordHash;
    }

    public static boolean checkPassword(String password ,String hashPassword){
        boolean valide = BCrypt.checkpw(password , hashPassword);
        return valide;
    }
}
