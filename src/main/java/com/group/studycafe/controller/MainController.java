package com.group.studycafe.controller;

import com.group.studycafe.config.UserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String main(Model model) {
        String username = UserInfo.getCurrentUsername();
        boolean isLogin = (username != null);

        model.addAttribute("isLogin", isLogin);
        model.addAttribute("username", username);

        return "main";
    }
}
