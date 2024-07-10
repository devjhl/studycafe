package com.group.studycafe.repository;

import com.group.studycafe.domain.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    @Query("SELECT c FROM Comment c WHERE c.gather.id = :gatherId")
    List<Comment> findByGatherId(Long gatherId);

    @Query(value = "SELECT * FROM Comment WHERE username = :username", nativeQuery = true)
    List<Comment> findByUsername(String username);

    @Query("SELECT COUNT(c) FROM Comment c WHERE c.gather.id = :gatherId")
    long countByGatherId(@Param("gatherId") Long gatherId);


}
