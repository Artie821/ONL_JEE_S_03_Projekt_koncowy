package com.taraszka.bookexchange.controller;


import com.taraszka.bookexchange.entity.Book;
import com.taraszka.bookexchange.entity.UserEntity;
import com.taraszka.bookexchange.repository.TransactionsRepository;
import com.taraszka.bookexchange.security.UserRepository;
import com.taraszka.bookexchange.services.BookService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;


@Controller
@RequestMapping("user/")
public class BookController {

    private final UserRepository userRepository;
    private final BookService bookService;
    private final TransactionsRepository transactionsRepository;


    public BookController(UserRepository userRepository, BookService bookService, TransactionsRepository transactionsRepository) {
        this.userRepository = userRepository;
        this.bookService = bookService;
        this.transactionsRepository = transactionsRepository;
    }

    @GetMapping("/dashboard")
    public String dashbard(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        List<Book> books = bookService.getBooksVisibleForUser(username);
        if(books.size()==0){
            model.addAttribute("newuser", true);
        }
        model.addAttribute("book", books);
        model.addAttribute("username", username);
        UserEntity user = userRepository.findByUsername(username);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);
        return "logged/dashboard";
    }

    @GetMapping("/addbook")
    public String addBook(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        model.addAttribute("book", new Book());
        model.addAttribute("username", username);
        List<Book> books = bookService.getBooksVisibleForUser(username);
        if(books.size()==0){
            model.addAttribute("newuser", true);
        }
        UserEntity user = userRepository.findByUsername(username);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);
        return "logged/addbook";
    }

    @GetMapping("/edit")
    public String addBookByISBN(Model model, HttpServletRequest request) throws IOException {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        model.addAttribute("book", new Book());
        model.addAttribute("username", username);
        List<Book> books = bookService.getBooksVisibleForUser(username);
        if(books.size()==0){
            model.addAttribute("newuser", true);
        }
        UserEntity user = userRepository.findByUsername(username);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);

        String command = "curl -X GET http://data.bn.org.pl/api/bibs.json?isbnIssn=" + request.getParameter("isbn") + "&amp;limit=1";
        Runtime rt = Runtime.getRuntime();
        Process proc = rt.exec(command);

        BufferedReader stdInput = new BufferedReader(new
                InputStreamReader(proc.getInputStream()));

        String s = null;
        StringBuilder sb = new StringBuilder();
        while ((s = stdInput.readLine()) != null) {
            sb.append(s);
        }
        int counter = 0;
        try {
            JSONObject json = new JSONObject(sb.toString());
            JSONArray arr = json.getJSONArray("bibs");

            for (int i = 0; i < arr.length(); i++) {
                model.addAttribute("aut", arr.getJSONObject(i).get("author"));
                model.addAttribute("cat", arr.getJSONObject(i).get("genre"));
                model.addAttribute("tit", arr.getJSONObject(i).get("title"));
                model.addAttribute("pub", arr.getJSONObject(i).get("publisher"));
                model.addAttribute("dis", arr.getJSONObject(i).get("subject"));
                model.addAttribute("isb", arr.getJSONObject(i).get("isbnIssn"));
                counter = 1;
            }

        } catch (JSONException e) {
        }
        if (counter == 0) {
            model.addAttribute("brak", true);
        }

        return "logged/addbook";
    }

    @GetMapping("/findbook")
    public String findBook(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        List<Book> books = bookService.getBooksVisibleForContractors(username);
        model.addAttribute("book", books);
        model.addAttribute("username", username);
        List<Book> booklist = bookService.getBooksVisibleForUser(username);
        if(booklist.size()==0){
            model.addAttribute("newuser", true);
        }
        UserEntity user = userRepository.findByUsername(username);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);
        return "logged/findbook";
    }

    @PostMapping("/addbook")
    public String save(@Valid Book book, BindingResult result, Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        UserEntity user = userRepository.findByUsername(username);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);
        model.addAttribute("username", username);
        List<Book> books = bookService.getBooksVisibleForUser(username);
        if(books.size()==0){
            model.addAttribute("newuser", true);
        }
        if (result.hasErrors()) {
            return "logged/addbook";
        }
        book.setVisible(true);
        book.setUser(user);
        bookService.add(book);
        return "redirect:dashboard";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable long id) {

        bookService.delete(id);
        return "redirect:../dashboard";
    }

    @GetMapping("/details/{id}")
    public String details(Model model, @PathVariable long id) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails) principal).getUsername();
        List<Book> books = bookService.getBooksVisibleForUser(username);
        if(books.size()==0){
            model.addAttribute("newuser", true);
        }
        model.addAttribute("Onebook", bookService.get(id).get());
        model.addAttribute("username", username);
        UserEntity user = userRepository.findByUsername(username);
        int transNumber = transactionsRepository.findAllByContractor(user, 1).size();
        model.addAttribute("number", transNumber);
        return "logged/bookdetails";
    }
}
