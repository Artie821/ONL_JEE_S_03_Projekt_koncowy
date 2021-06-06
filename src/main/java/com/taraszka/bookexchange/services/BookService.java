package com.taraszka.bookexchange.services;

import com.taraszka.bookexchange.entity.Book;
import com.taraszka.bookexchange.entity.User;

import java.util.List;
import java.util.Optional;

public interface BookService {
    List<Book> getBooks();

    Optional<Book> get(Long id);

    void add(Book book);

    void delete(Long id);

    void update(Book book);

    List<Book> getBooksVisibleForUser(String username);

    List<Book> getBooksVisibleForContractors(String username);
}
