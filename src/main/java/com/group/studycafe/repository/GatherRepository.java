package com.group.studycafe.repository;

import com.group.studycafe.domain.Gather;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GatherRepository extends JpaRepository<Gather, Long> {
    Page<Gather> findAll(Pageable pageable);

    @Query("SELECT g FROM Gather g WHERE g.title LIKE %:keyword% OR g.content LIKE %:keyword%")
    Page<Gather> searchGather(String keyword, Pageable pageable);

    Gather findById(long id);

    @Modifying
    @Transactional
    @Query("UPDATE Gather g SET g.views = g.views + 1 WHERE g.id = :id")
    void incrementViewCount(@Param("id") Long id);
}
