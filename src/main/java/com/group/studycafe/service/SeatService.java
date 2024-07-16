package com.group.studycafe.service;

import com.group.studycafe.domain.Seat;
import com.group.studycafe.domain.User;
import com.group.studycafe.repository.SeatRepository;
import com.group.studycafe.repository.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class SeatService {

    private final SeatRepository seatRepository;
    private final UserRepository userRepository;

    @Autowired
    public SeatService(SeatRepository seatRepository, UserRepository userRepository) {
        this.seatRepository = seatRepository;
        this.userRepository = userRepository;
    }

    public List<Map<String, Object>> getAllSeats() {
        List<Seat> seats = seatRepository.findAll();
        return seats.stream().map(seat -> {
            Map<String, Object> seatMap = new HashMap<>();
            seatMap.put("id", seat.getId());
            seatMap.put("reserved", seat.isReserved());
            seatMap.put("reservedAt", seat.getReservedAt());
            seatMap.put("userId", seat.getUser() != null ? seat.getUser().getId() : null);
            return seatMap;
        }).collect(Collectors.toList());
    }

    public void reserveSeat(Long seatId, Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
        Seat seat = seatRepository.findById(seatId)
                .orElseThrow(() -> new EntityNotFoundException("Seat not found"));

        if (seat.isReserved()) {
            throw new IllegalStateException("Seat is already reserved");
        }

        seat.setReserved(true);
        seat.setUser(user);
        seatRepository.save(seat);
    }

    public List<Seat> findReservedSeatsByUser(Long userId) {
        return seatRepository.findByUser_IdAndReserved(userId, true);
    }
}
