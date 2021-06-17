package com.taraszka.bookexchange.controller;


import com.taraszka.bookexchange.entity.Book;
import com.taraszka.bookexchange.entity.UserEntity;
import com.taraszka.bookexchange.exeptions.UserAlreadyExistException;
import com.taraszka.bookexchange.exeptions.UserAlreadyExistExceptionEmail;
import com.taraszka.bookexchange.security.UserService;
import com.taraszka.bookexchange.services.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;
import java.util.List;


@Controller
public class UserController {

    private final BookService bookService;
    private final UserService userService;


    public UserController(BookService bookService, UserService userService) {
        this.bookService = bookService;
        this.userService = userService;
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String homepage() {
        return "homepage";
    }

    @RequestMapping(value = {"/howitsworks"}, method = RequestMethod.GET)
    public String howitsworks() {
        return "howitsworks";
    }

    @RequestMapping(value = {"/admin/login"}, method = RequestMethod.GET)
    public String homepageLogin() {
        return "admin/login";
    }

    @RequestMapping(value = {"/admin/usersbooks"}, method = RequestMethod.GET)
    public String usersBooks(Model model) {
        List<Book> books = bookService.getBooks();
        model.addAttribute("book", books);
        return "usersbooks";
    }

    @RequestMapping(value = {"/admin/register"}, method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("userEntity", new UserEntity());
        return "register";
    }

    @PostMapping("/admin/register")
    public String saveUser(@Valid UserEntity user, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "register";
        }
        try{
        userService.saveUser(user);
        }
        catch (UserAlreadyExistException e){
            model.addAttribute("login", true);
            return "register";
        } catch (UserAlreadyExistExceptionEmail e){
            model.addAttribute("email", true);
            return "register";
        }
        return "redirect:/admin/login?success=true";
    }


}
