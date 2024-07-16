package com.group.studycafe.repository;

import com.group.studycafe.domain.Seat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SeatRepository extends JpaRepository<Seat, Long> {
    List<Seat> findByReserved(boolean reserved);

    List<Seat> findByUser_IdAndReserved(Long userId, boolean reserved);
}
