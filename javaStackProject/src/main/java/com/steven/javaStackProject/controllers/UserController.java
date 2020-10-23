package com.steven.javaStackProject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.steven.javaStackProject.models.User;
import com.steven.javaStackProject.services.UserService;


@Controller
public class UserController {

	private final UserService userService;
    
    public UserController (UserService userService) {
        this.userService = userService;
    }
    
    @GetMapping("/registration")
    public String registerForm(@ModelAttribute("user") User user) {
        return "registration.jsp";
    }
    @GetMapping("/login")
    public String login() {
        return "login.jsp";
    }
    
    @PostMapping("/registration")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        if(!user.getPassword().equals(user.getPasswordConfirmation())) {
			result.rejectValue("passwordConfirmation", "Match", "Confirm Password must match Password!");
		}
        if(userService.getUser(user.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Email already in use!");
		}
        if(result.hasErrors()) {
        	return "registration.jsp";
        } else {
        	User loggedInUser = userService.registerUser(user);
        	session.setAttribute("user", loggedInUser);
        	return "redirect:/dashboard";
        }
    }
    
    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
        boolean isAuthenticated = userService.authenticateUser(email, password);
        if (isAuthenticated) {
        	User loggedInUser = userService.getUser(email);
        	session.setAttribute("user", loggedInUser);
        	return "redirect:/dashboard";
        } else {
        	model.addAttribute("error", "Invalid credentials. Please try again.");
        	return "login.jsp";
        }
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
