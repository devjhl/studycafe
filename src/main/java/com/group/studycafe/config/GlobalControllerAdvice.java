package com.group.studycafe.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice //header.jsp
public class GlobalControllerAdvice {

    @ModelAttribute
    public void addAttributes(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        boolean isLogin = authentication != null && authentication.isAuthenticated() && !(authentication.getPrincipal() instanceof String);
        model.addAttribute("isLogin", isLogin);

        if (isLogin) {
            model.addAttribute("username", authentication.getName());
        }
    }
}