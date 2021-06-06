package com.taraszka.bookexchange.repository;

import com.taraszka.bookexchange.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {

    @Query("select b from Book b where b.user.username = ?1")
    List<Book> findAllByUser(String username);

    @Query("select b from Book b where b.user.username <> ?1")
    List<Book> findAllByUserWhereUsernameIsNot(String username);
}
