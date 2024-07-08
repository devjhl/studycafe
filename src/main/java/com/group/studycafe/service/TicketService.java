package com.group.studycafe.service;

import com.group.studycafe.domain.Ticket;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class TicketService {

    public List<Ticket> getTicketsByCategory(String category) {
        // Mock data - replace with actual data fetching logic
        switch (category) {
            case "1회 이용권":
                return Arrays.asList(
                        new Ticket(1, "2시간", 50,2),
                        new Ticket(2, "3시간", 70,3),
                        new Ticket(3, "6시간", 100,6)
                );
            case "기간 이용권":
                return Arrays.asList(
                        new Ticket(4, "2주", 80,336),
                        new Ticket(5, "4주", 90,672)
                );
            case "시간 패키지":
                return Arrays.asList(
                        new Ticket(6, "30시간", 110,30),
                        new Ticket(7, "50시간", 120,50),
                        new Ticket(8, "100시간", 130,100)
                );
            case "사물함 이용권":
                return Arrays.asList(
                        new Ticket(9, "2주", 140,336),
                        new Ticket(10, "4주", 150,672)
                );
            default:
                return Arrays.asList();
        }
    }
}
