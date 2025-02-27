package com.group.studycafe.service;

import com.group.studycafe.domain.Gather;
import com.group.studycafe.repository.CommentRepository;
import com.group.studycafe.repository.GatherRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class GatherService {

    private static final Logger logger = LoggerFactory.getLogger(GatherService.class);
    private final GatherRepository gatherRepository;
    private final CommentRepository commentRepository;

    @PersistenceContext
    private EntityManager entityManager;

    public GatherService(GatherRepository gatherRepository, CommentRepository commentRepository) {
        this.gatherRepository = gatherRepository;
        this.commentRepository = commentRepository;
    }

    public Page<Gather> findAll(Pageable pageable) {
        return gatherRepository.findAll(pageable);
    }

    @Transactional
    public Gather findById(Long id) {
        gatherRepository.incrementViewCount(id); // 조회수 증가
        return gatherRepository.findById(id).orElse(null);
    }

    public List<Gather> userGather(String username) {
        return gatherRepository.findByUsername(username);
    }

    public Gather save(Gather gather) {
        return gatherRepository.save(gather);
    }

    public void delete(Gather gather) {
        gatherRepository.delete(gather);
    }

    public Page<Gather> searchGathers(String keyword, Pageable pageable) {
        return gatherRepository.searchGather(keyword, pageable);
    }

    public Page<Gather> searchGathersByStatus(String keyword, String status, Pageable pageable) {
        return gatherRepository.searchGatherByStatus(keyword, status, pageable);
    }

    public Page<Gather> findByStatus(String status, Pageable pageable) {
        return gatherRepository.findByStatus(status, pageable);
    }

    @Transactional
    public Gather updateStatus(Long gatherId) {
        Gather gather = gatherRepository.findById(gatherId).orElseThrow(() -> new IllegalArgumentException("Invalid gather Id:" + gatherId));
        if ("모집중".equals(gather.getStatus())) {
            gather.setStatus("모집완료");
        } else {
            gather.setStatus("모집중");
        }
        return gatherRepository.save(gather);
    }

    @Transactional
    public int incrementLikes(Long gatherId) {
        Gather gather = gatherRepository.findById(gatherId).orElseThrow(() -> new IllegalArgumentException("Invalid gather ID"));
        gather.setLikes(gather.getLikes() + 1);
        gatherRepository.save(gather);
        return gather.getLikes();
    }

    public Gather updateGather(Long id, Gather gather) {
        Gather existingGather = gatherRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid gather ID"));
        existingGather.setTitle(gather.getTitle());
        existingGather.setContent(gather.getContent());
        gatherRepository.save(existingGather);
        return existingGather;
    }

    @Transactional
    public void deleteGather(Long id) {
        gatherRepository.deleteById(id);
    }

    public long count(Long gatherId) {
        return commentRepository.countByGatherId(gatherId);
    }

    public List<Gather> findAllByCommentCountDesc() {
        return gatherRepository.findAllByOrderByCommentCountDesc();
    }

    public List<Gather> findByUsername(String username) {
        return gatherRepository.findByUsername(username);
    }

    public List<Gather> findByUsernameAndStatus(String username, String status) {
        return gatherRepository.findByUsernameAndStatus(username, status);
    }
}
