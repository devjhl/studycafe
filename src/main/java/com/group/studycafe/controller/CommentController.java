package com.group.studycafe.controller;

import com.group.studycafe.dto.CommentDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import com.group.studycafe.domain.Comment;
import com.group.studycafe.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/comments")
public class CommentController {

    private final CommentService commentService;

    @GetMapping("/api/comments/{id}")
    public ResponseEntity<CommentDTO> getCommentById(@PathVariable Long id) {
        Comment comment = commentService.findById(id);
        CommentDTO commentDTO = new CommentDTO(comment.getId(), comment.getContent(), comment.getUsername(), comment.getDate());
        return ResponseEntity.ok(commentDTO);
    }


    @PostMapping("/{gatherId}")
    public Comment addComment(@PathVariable Long gatherId, @RequestBody Comment comment) {
        return commentService.addComment(gatherId, comment.getContent(), comment.getUsername());
    }

    @PutMapping("/{id}")
    public Comment updateComment(@PathVariable Long id, @RequestBody Comment comment) {
        return commentService.updateComment(id, comment.getContent());
    }

    @DeleteMapping("/{id}")
    public void deleteComment(@PathVariable Long id) {
        commentService.deleteComment(id);
    }
}
