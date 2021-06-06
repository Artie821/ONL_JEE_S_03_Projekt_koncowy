package com.taraszka.bookexchange.security;

import com.taraszka.bookexchange.entity.User;
import com.taraszka.bookexchange.exeptions.UserAlreadyExistException;
import com.taraszka.bookexchange.exeptions.UserAlreadyExistExceptionEmail;

public interface UserService {

    User findByUserName(String name);
    void saveUser(User user) throws UserAlreadyExistException, UserAlreadyExistExceptionEmail;
    boolean checkIfUserExist(String email);
    boolean checkIfUserExistLogin(String login);

}