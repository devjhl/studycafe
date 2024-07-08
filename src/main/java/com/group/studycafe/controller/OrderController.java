package com.group.studycafe.controller;

import com.group.studycafe.domain.Order;
import com.group.studycafe.service.OrderService;
import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/order")
    public String createOrder(
            @RequestParam String username,
            @RequestParam String email,
            @RequestParam String addr,
            @RequestParam String phone,
            @RequestParam int totalPrice,
            Model model) {

        Order order = new Order();
        order.setUsername(username);
        order.setEmail(email);
        order.setAddr(addr);
        order.setPhone(phone);
        order.setTotalPrice(totalPrice);

        orderService.saveOrder(order);

        model.addAttribute("order", order);

        return "orderConfirmation";
    }
}

