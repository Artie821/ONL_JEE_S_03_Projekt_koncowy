package com.taraszka.bookexchange.exeptions;

public class UserAlreadyExistExceptionEmail extends Exception {

    public UserAlreadyExistExceptionEmail() {
        super();
    }


    public UserAlreadyExistExceptionEmail(String message) {
        super(message);
    }


    public UserAlreadyExistExceptionEmail(String message, Throwable cause) {
        super(message, cause);
    }
}
