package com.group.studycafe.service;

import com.group.studycafe.domain.Comment;
import com.group.studycafe.domain.Gather;
import com.group.studycafe.dto.CommentDto;
import com.group.studycafe.repository.CommentRepository;
import com.group.studycafe.repository.GatherRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private GatherRepository gatherRepository;

    public List<CommentDto> comments(Long gatherId) {
        return commentRepository.findByGatherId(gatherId)
                .stream()
                .map(CommentDto::createCommentDto)
                .collect(Collectors.toList());
    }

    @Transactional
    public CommentDto create(Long gatherId, CommentDto dto) {
        Gather gather = gatherRepository.findById(gatherId)
                .orElseThrow(() -> new IllegalArgumentException("댓글 생성 실패! 대상 게시글이 없습니다."));

        Comment comment = Comment.createComment(dto, gather);
        Comment created = commentRepository.save(comment);

        System.out.println("Created comment: " + created); // 로그 추가

        return CommentDto.createCommentDto(created);
    }

    @Transactional
    public CommentDto update(Long id, CommentDto dto) {
        Comment target = commentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("댓글 수정 실패! 대상 댓글이 없습니다."));

        target.patch(dto);
        Comment updated = commentRepository.save(target);

        return CommentDto.createCommentDto(updated);
    }

    public CommentDto delete(Long id) {
        Comment target = commentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("댓글 삭제 실패! 대상이 없습니다."));

        commentRepository.delete(target);
        return CommentDto.createCommentDto(target);
    }

    public long countCommentsByGatherId(Long gatherId) {
        return commentRepository.countByGatherId(gatherId);
    }
}
