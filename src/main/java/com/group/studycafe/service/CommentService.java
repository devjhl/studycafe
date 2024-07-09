package com.group.studycafe.service;

import com.group.studycafe.domain.Comment;
import com.group.studycafe.repository.CommentRepository;
import com.group.studycafe.repository.GatherRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class CommentService {

    private final CommentRepository commentRepository;
    private final GatherRepository gatherRepository;

    public Comment findById(Long id) {
        Optional<Comment> comment = commentRepository.findById(id);
        return comment.orElse(null);
    }

    public List<Comment> getCommentsByGatherId(Long gatherId) {
        return commentRepository.findByGatherId(gatherId);
    }

    public Comment addComment(Long gatherId, String content, String username) {
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setUsername(username);
        comment.setDate(LocalDateTime.now());
        comment.setGather(gatherRepository.findById(gatherId).orElseThrow(() -> new RuntimeException("Gather not found")));
        return commentRepository.save(comment);
    }

    public Comment updateComment(Long id, String content) {
        Comment comment = commentRepository.findById(id).orElseThrow(() -> new RuntimeException("Comment not found"));
        comment.setContent(content);
        return commentRepository.save(comment);
    }

    public void deleteComment(Long id) {
        commentRepository.deleteById(id);
    }
}

