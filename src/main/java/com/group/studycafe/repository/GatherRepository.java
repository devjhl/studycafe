package com.group.studycafe.repository;

import com.group.studycafe.domain.Gather;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface GatherRepository extends JpaRepository<Gather, Long> {
    Page<Gather> findAll(Pageable pageable);

    @Query("SELECT g FROM Gather g WHERE g.title LIKE %:keyword% OR g.content LIKE %:keyword%")
    Page<Gather> searchGather(@Param("keyword") String keyword, Pageable pageable);

    @Query("SELECT g FROM Gather g WHERE (g.title LIKE %:keyword% OR g.content LIKE %:keyword%) AND g.status = :status")
    Page<Gather> searchGatherByStatus(@Param("keyword") String keyword, @Param("status") String status, Pageable pageable);

    Page<Gather> findByStatus(String status, Pageable pageable);

    @Modifying
    @Transactional
    @Query("UPDATE Gather g SET g.status = '모집완료' WHERE g.id = :id")
    void updateStatusToComplete(@Param("id") Long id);

    @Modifying
    @Transactional
    @Query("UPDATE Gather g SET g.views = g.views + 1 WHERE g.id = :id")
    void incrementViewCount(@Param("id") Long id);

    List<Gather> findAllByOrderByCommentCountDesc();

    List<Gather> findByUsername(String username);


    List<Gather> findByUsernameAndStatus(String username, String status);
}
