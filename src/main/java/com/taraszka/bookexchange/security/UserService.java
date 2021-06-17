package com.taraszka.bookexchange.security;


import com.taraszka.bookexchange.entity.UserEntity;
import com.taraszka.bookexchange.exeptions.UserAlreadyExistException;
import com.taraszka.bookexchange.exeptions.UserAlreadyExistExceptionEmail;

public interface UserService {

    UserEntity findByUserName(String name);
    void saveUser(UserEntity user) throws UserAlreadyExistException, UserAlreadyExistExceptionEmail;
    boolean checkIfUserExist(String email);
    boolean checkIfUserExistLogin(String login);

}