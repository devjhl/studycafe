package com.group.studycafe.controller;

import com.group.studycafe.domain.Order;
import com.group.studycafe.dto.OrderRequest;
import com.group.studycafe.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/api/v1/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @PostMapping
    @ResponseBody
    public ResponseEntity<Map<String, String>> createOrder(@RequestBody OrderRequest orderRequest) {
        try {
            // createdAt 값이 null이 아닌지 확인하고 설정
            if (orderRequest.getCreatedAt() == null || orderRequest.getCreatedAt().isEmpty()) {
                orderRequest.setCreatedAt(String.valueOf(LocalDateTime.now()));
            }
            System.out.println("=================================orderRequest: " + orderRequest);
            orderService.saveOrder(orderRequest);

            Map<String, String> response = new HashMap<>();
            response.put("message", "Order saved successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "주문 저장 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(errorResponse);
        }
    }

   /* @GetMapping("/orderConfirmation/{orderId}")
    public String orderConfirm(@PathVariable Long orderId,Model model) {
        Order order = orderService.findOrderById(orderId);
        model.addAttribute("order", order);
       return "orderconfirm";
    }
*/

}
