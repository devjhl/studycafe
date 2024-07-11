package com.group.studycafe.controller;

import com.group.studycafe.domain.OrderTicketNames;
import com.group.studycafe.service.OrderTicketNamesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/orderTickets")
public class OrderTicketNamesController {

    @Autowired
    private OrderTicketNamesService orderTicketNamesService;

    @GetMapping("/{order_id}")
    public ResponseEntity<List<OrderTicketNames>> getOrderTicketsByOrderId(@PathVariable Long order_id) {
        List<OrderTicketNames> orderTicketNames = orderTicketNamesService.findOrderTicketsByOrderId(order_id);
        if (orderTicketNames.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(orderTicketNames, HttpStatus.OK);
    }
}
