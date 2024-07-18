package com.group.studycafe.repository;

import com.group.studycafe.domain.Like;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LikeRepository extends JpaRepository<Like, Long> {
    Optional<Like> findByGatherIdAndUsername(Long gatherId, String username);
    void deleteByGatherIdAndUsername(Long gatherId, String username);
}

