package com.taraszka.bookexchange.entity;

import lombok.Data;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.time.LocalDateTime;

@Entity
@Data
@Transactional
public class Transactions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne
    private Book book;
    @ManyToOne
    private Book contractorBook;
    private int status;
    private LocalDateTime transactionDate;
    @ManyToOne
    private UserEntity owner;
    @ManyToOne
    private UserEntity contractor;
}
