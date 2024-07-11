package com.group.studycafe.controller;

import com.group.studycafe.domain.Order;
import com.group.studycafe.domain.User;
import com.group.studycafe.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequiredArgsConstructor
@Controller
@RequestMapping("/reservation/book")
public class BookController {

    private final OrderService orderService;

    @GetMapping("")
    @Transactional(readOnly = true)
    public String book(@AuthenticationPrincipal User user, Model model) {

        Order order = orderService.findOrderByUsername(user.getUsername());
        boolean hasOrder = (order != null);
        model.addAttribute("hasOrder", hasOrder);
        model.addAttribute("order", order);
        model.addAttribute("user", user);
        return "book";
    }
}
