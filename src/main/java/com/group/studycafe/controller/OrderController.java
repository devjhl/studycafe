package com.group.studycafe.controller;

import com.group.studycafe.domain.Order;
import com.group.studycafe.domain.OrderTicketNames;
import com.group.studycafe.dto.OrderRequest;
import com.group.studycafe.service.OrderService;
import com.group.studycafe.service.OrderTicketNamesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/v1/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderTicketNamesService orderTicketNamesService;

    @PostMapping
    @ResponseBody
    public ResponseEntity<Map<String, String>> createOrder(@RequestBody OrderRequest orderRequest) {
        try {
            if (orderRequest.getCreatedAt() == null || orderRequest.getCreatedAt().isEmpty()) {
                orderRequest.setCreatedAt(LocalDateTime.now().toString());
            }

            Order order = orderRequest.toOrder(); // OrderRequest를 Order로 변환
            Order savedOrder = orderService.saveOrder(order); // Order 객체 저장

            System.out.println("Saved Order ID: " + savedOrder.getId()); // 디버깅 로그 추가

            Map<String, String> response = new HashMap<>();
            response.put("message", "Order saved successfully");
            response.put("id", savedOrder.getId().toString()); // 저장된 Order의 id 반환
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "주문 저장 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(errorResponse);
        }
    }

    @GetMapping("/orderConfirmation")
    public String getOrderConfirmation(@RequestParam Long orderId, Model model) {
        Order order = orderService.findById(orderId);
        List<OrderTicketNames> orderTicketNames = orderTicketNamesService.findByOrderId(orderId);

        if (order != null) {
            model.addAttribute("order", order);
            model.addAttribute("orderTicketNames", orderTicketNames);
        }
        return "orderConfirmation";
    }
}
