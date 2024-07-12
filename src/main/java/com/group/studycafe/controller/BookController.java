package com.group.studycafe.controller;

import com.group.studycafe.domain.Order;
import com.group.studycafe.domain.Seat;
import com.group.studycafe.domain.User;
import com.group.studycafe.service.OrderService;
import com.group.studycafe.service.SeatService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@RequestMapping("/reservation/book")
public class BookController {

    private final OrderService orderService;
    private final SeatService seatService;


    @GetMapping("")
    @Transactional(readOnly = true)
    public String book(@AuthenticationPrincipal User user, Model model) {
        List<Order> orders = orderService.findOrdersByUsername(user.getUsername());
        //
        System.out.println("===================================orders: " + orders);
        boolean hasOrders = !orders.isEmpty();
        System.out.println("==========과연============================" +hasOrders);

        // Seat 데이터 가져오기
        List<Map<String, Object>> seatDataList = seatService.getAllSeats();


        model.addAttribute("hasOrders", hasOrders);
        model.addAttribute("orders", orders);
        model.addAttribute("user", user);
        model.addAttribute("seats", seatDataList); // seatDataList를 모델에 추가

        return "book";
    }
}
