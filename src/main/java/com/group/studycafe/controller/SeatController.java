package com.group.studycafe.controller;

import com.group.studycafe.config.CustomUserDetails;
import com.group.studycafe.domain.Seat;
import com.group.studycafe.domain.SeatReservationRequest;
import com.group.studycafe.domain.User;
import com.group.studycafe.dto.SeatDTO;
import com.group.studycafe.service.SeatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/seats")
public class SeatController {

    private final SeatService seatService;

    @Autowired
    public SeatController(SeatService seatService) {
        this.seatService = seatService;
    }

    @GetMapping
    public List<Map<String, Object>> getAllSeats() {
        return seatService.getAllSeats();
    }

    @PostMapping("/reserve")
    public void reserveSeat(@RequestBody Map<String, Long> reservationRequest) {
        Long seatId = reservationRequest.get("seatId");
        Long userId = reservationRequest.get("userId");
        seatService.reserveSeat(seatId, userId);
    }
}
