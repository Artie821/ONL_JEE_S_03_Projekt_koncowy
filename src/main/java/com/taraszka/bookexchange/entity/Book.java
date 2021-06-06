package com.taraszka.bookexchange.entity;

import lombok.Data;
import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Data
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String isbn;
    @NotNull
    @Size(min = 2, max = 500)
    private String title;
    @NotNull
    @Size(min = 2, max = 500)
    private String author;
    @NotNull
    @Size(min = 2, max = 500)
    private String publisher;
    @NotNull
    @Size(min = 2, max = 500)
    private String type;
    private String description;
    private boolean visible;
    @ManyToOne
    private User user;

}
