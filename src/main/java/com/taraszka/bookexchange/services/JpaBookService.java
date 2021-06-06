package com.taraszka.bookexchange.services;

import com.taraszka.bookexchange.entity.Book;
import com.taraszka.bookexchange.entity.User;
import com.taraszka.bookexchange.repository.BookRepository;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Primary
public class JpaBookService implements BookService {

    private final BookRepository bookRepository;

    public JpaBookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @Override
    public List<Book> getBooks() {
        return bookRepository.findAll();
    }

    @Override
    public Optional<Book> get(Long id) {
        return bookRepository.findById(id);
    }

    @Override
    public void add(Book book) {
        bookRepository.save(book);
    }

    @Override
    public void delete(Long id) {
        Book book = bookRepository.getOne(id);
        bookRepository.delete(book);
    }

    @Override
    public void update(Book book) {
        bookRepository.save(book);
    }

    @Override
    public List<Book> getBooksVisibleForUser(String useranme) {
        List<Book> list = bookRepository.findAllByUser(useranme);
        List<Book> retBook = new ArrayList<>();
        for (Book l: list) {
            if(l.isVisible()){
                retBook.add(l);
            }
        } return retBook;
    }

    @Override
    public List<Book> getBooksVisibleForContractors(String username) {
        List<Book> list = bookRepository.findAllByUserWhereUsernameIsNot(username);
        List<Book> retBook = new ArrayList<>();
        for (Book l: list) {
            if(l.isVisible()){
                retBook.add(l);
            }
        } return retBook;
    }
}