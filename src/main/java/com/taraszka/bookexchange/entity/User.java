package com.taraszka.bookexchange.entity;

import com.taraszka.bookexchange.security.Role;
import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Data
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Size(min=6, max=50)
    @Column(nullable = false, unique = true, length = 60)
    private String username;
    @Size(min=3, max=50)
    @Column(nullable = false, length = 60)
    private String name;
    @Size(min=6, max=255)
    @Column(nullable = false, length = 60)
    private String password;
    @Size(min=3, max=50)
    @Column(nullable = false, length = 60)
    private String surname;
    @Email
    @Column(nullable = false, unique = true, length = 80)
    private String email;
    private long phone;
    private int points;
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Role> roles;
    private int enabled;


}
