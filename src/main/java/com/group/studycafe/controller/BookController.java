package com.group.studycafe.controller;

import com.group.studycafe.domain.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reservation/book")
public class BookController {

    @GetMapping("")
    @Transactional(readOnly = true)
    public String book(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user", user);
        return "book";
    }
}
