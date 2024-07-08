package com.group.studycafe.controller;

import com.group.studycafe.domain.Ticket;
import com.group.studycafe.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("/reservation")
@Controller
public class TicketController {

    @Autowired
    private TicketService ticketService;

    @GetMapping("/buy")
    public String showBuyPage(Model model) {
        // Fetch the ticket lists
        List<Ticket> ticketList1 = ticketService.getTicketsByCategory("1회 이용권");
        List<Ticket> ticketList2 = ticketService.getTicketsByCategory("기간 이용권");
        List<Ticket> ticketList3 = ticketService.getTicketsByCategory("시간 패키지");
        List<Ticket> ticketList4 = ticketService.getTicketsByCategory("사물함 이용권");

        // Add attributes to the model
        model.addAttribute("ticketList1", ticketList1);
        model.addAttribute("ticketList2", ticketList2);
        model.addAttribute("ticketList3", ticketList3);
        model.addAttribute("ticketList4", ticketList4);

        int userPoints = 1000; // Replace with actual logic to get user points
        model.addAttribute("point", userPoints);

        return "buy"; // JSP file to render
    }
}