package com.taraszka.bookexchange.security;

import com.taraszka.bookexchange.entity.User;
import com.taraszka.bookexchange.exeptions.UserAlreadyExistException;
import com.taraszka.bookexchange.exeptions.UserAlreadyExistExceptionEmail;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public User findByUserName(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public void saveUser(User user) throws UserAlreadyExistException, UserAlreadyExistExceptionEmail {
        if(checkIfUserExist(user.getEmail())){
            throw new UserAlreadyExistExceptionEmail("User already exists for this email");
        }
        if(checkIfUserExistLogin(user.getUsername())){
            throw new UserAlreadyExistException("User already exists for this login");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public boolean checkIfUserExist(String email) {
        return userRepository.findByEmail(email) !=null ? true : false;
    }

    @Override
    public boolean checkIfUserExistLogin(String login) {
        return userRepository.findByUsername(login) !=null ? true : false;
    }



}
