package com.taraszka.bookexchange.controller;

import com.taraszka.bookexchange.entity.Book;
import com.taraszka.bookexchange.entity.Transactions;
import com.taraszka.bookexchange.entity.UserEntity;
import com.taraszka.bookexchange.repository.TransactionsRepository;
import com.taraszka.bookexchange.security.UserRepository;
import com.taraszka.bookexchange.services.BookService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("transaction")
public class TransactionController {

    private final BookService bookService;
    private final UserRepository userRepository;
    private final TransactionsRepository transactionsRepository;

    public TransactionController(BookService bookService, UserRepository userRepository, TransactionsRepository transactionsRepository) {
        this.bookService = bookService;
        this.userRepository = userRepository;
        this.transactionsRepository = transactionsRepository;
    }

    @RequestMapping(value = {"/{id}"}, method = RequestMethod.GET)
    public String Addtransaction(Model model, @PathVariable long id) {

        UserEntity contractor = bookService.get(id).get().getUser();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        UserEntity user = userRepository.findByUsername(username);
        Transactions transactions = new Transactions();
        Book book = bookService.get(id).get();
        List<Book> books = bookService.getBooksVisibleForUser(username);
        if (books.size() == 0) {
            model.addAttribute("newuser", true);
        }
        transactions.setBook(book);
        transactions.setOwner(user);
        transactions.setContractor(contractor);
        LocalDateTime localDate = LocalDateTime.now();
        transactions.setTransactionDate(localDate);
        transactions.setStatus(1);
        book.setVisible(false);
        transactionsRepository.save(transactions);
        return "redirect:/user/findbook";
    }

    @RequestMapping(value = {"/mytransations"}, method = RequestMethod.GET)
    public String MyTransactions(Model model) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        UserEntity user = userRepository.findByUsername(username);
        List<Transactions> list = transactionsRepository.findAllByContractor(user, 1);
        List<Transactions> prop = transactionsRepository.findAllByUser(user, 1);
        List<Book> books = bookService.getBooksVisibleForUser(username);
        if (books.size() == 0) {
            model.addAttribute("newuser", true);
        }
        model.addAttribute("username", username);
        model.addAttribute("transactions", list);
        model.addAttribute("propozitions", prop);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);

        return "logged/transactions";
    }

    @RequestMapping(value = {"/exchange/{id}"}, method = RequestMethod.GET)
    public String exchange(Model model, @PathVariable long id) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        UserEntity user = userRepository.findByUsername(username);
        Transactions transactions = transactionsRepository.getOne(id);
        model.addAttribute("username", username);
        UserEntity contactor = transactions.getOwner();
        String cName = contactor.getUsername();
        List<Book> books = bookService.getBooksVisibleForUser(cName);
        if (books.size() == 0) {
            model.addAttribute("newuser", true);
        }
        model.addAttribute("contractor", cName);
        model.addAttribute("username", username);
        model.addAttribute("book", books);
        model.addAttribute("transaction", transactions);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);

        return "logged/exchange";
    }

    @RequestMapping(value = {"/confirmation/{bookId}/{transactionId}"}, method = RequestMethod.GET)
    public String confirmation(Model model, @PathVariable long bookId, @PathVariable long transactionId) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        UserEntity user = userRepository.findByUsername(username);
        Transactions transactions = transactionsRepository.getOne(transactionId);
        model.addAttribute("username", username);
        UserEntity contactor = transactions.getOwner();
        String cName = contactor.getUsername();
        Book book = bookService.get(bookId).get();
        model.addAttribute("contractor", cName);
        model.addAttribute("username", username);
        model.addAttribute("book", book);
        model.addAttribute("transaction", transactions);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);

        return "logged/confirm";
    }

    @Transactional
    @PostMapping("/confirmation/{bookId}/{transactionId}")
    public String complited(Model model, @PathVariable long bookId, @PathVariable long transactionId) throws IOException {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        UserEntity user = userRepository.findByUsername(username);
        transactionsRepository.UpdateContractorBookIdWhereTransacionIdIs(transactionId, bookService.get(bookId).get());
        transactionsRepository.UpdateStatusWhereTransacionIdIs(transactionId, 2);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);
        model.addAttribute("username", username);
        Book book = bookService.get(bookId).get();
        book.setVisible(false);
        bookService.update(book);
        Transactions transactions = transactionsRepository.getOne(transactionId);
        Book book1contractor = bookService.get(transactions.getBook().getId()).get();
        UserEntity contactor = transactions.getOwner();
        String cName = contactor.getUsername();
        List<Book> books = bookService.getBooksVisibleForUser(cName);
        model.addAttribute("contractor", cName);
        model.addAttribute("book", book);
        model.addAttribute("transaction", transactions);
        model.addAttribute("cbook", book1contractor);
        if (books.size() == 0) {
            List<Transactions> transactions1 = transactionsRepository.findAllByUser(contactor, 1);
            transactions1.forEach(t -> {
                Book b = t.getBook();
                b.setVisible(true);
                transactionsRepository.delete(t);
            });

        }
        return "logged/complited";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {
        Transactions transactions = transactionsRepository.findById(id).get();
        Book book = transactions.getBook();
        book.setVisible(true);
        transactionsRepository.deleteById(id);
        return "redirect:../mytransations";
    }

    @GetMapping("/history")
    public String history(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        UserEntity user = userRepository.findByUsername(username);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);
        model.addAttribute("username", username);
        List<Transactions> userT = transactionsRepository.findAllByContractor(user, 2);
        model.addAttribute("userT", userT);
        List<Book> books = bookService.getBooksVisibleForUser(username);
        if (books.size() == 0) {
            model.addAttribute("newuser", true);
        }
        List<Transactions> userMy = transactionsRepository.findAllByUser(user, 2);
        model.addAttribute("userMy", userMy);
        return "logged/history";
    }
}
