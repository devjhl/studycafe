package com.group.studycafe.controller;

import com.group.studycafe.dto.CommentDto;
import com.group.studycafe.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/gather")
public class CommentApiController {

    @Autowired
    private CommentService commentService;

    // 1. 댓글 조회
    @GetMapping("/{gatherId}/comments")
    public ResponseEntity<List<CommentDto>> comments(@PathVariable Long gatherId) {
        List<CommentDto> dtos = commentService.comments(gatherId);
        return ResponseEntity.status(HttpStatus.OK).body(dtos);
    }

    // 2. 댓글 생성
    @PostMapping("/{gatherId}/comments")
    public ResponseEntity<?> create(@PathVariable Long gatherId, @RequestBody CommentDto dto) {
        try {
            CommentDto createdDto = commentService.create(gatherId, dto);
            return ResponseEntity.status(HttpStatus.OK).body(createdDto);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }


    // 3. 댓글 수정
    @PatchMapping("/comments/{id}")
    public ResponseEntity<CommentDto> update(@PathVariable Long id, @RequestBody CommentDto dto) {
        CommentDto updatedDto = commentService.update(id, dto);
        return ResponseEntity.status(HttpStatus.OK).body(updatedDto);
    }

    // 4. 댓글 삭제
    @DeleteMapping("/comments/{id}")
    public ResponseEntity<CommentDto> delete(@PathVariable Long id) {
        CommentDto deleteDto = commentService.delete(id);
        return ResponseEntity.status(HttpStatus.OK).body(deleteDto);
    }

    // 5. 댓글 수
    @GetMapping("/{gatherId}/commentCount")
    public long getCommentCount(@PathVariable Long gatherId) {
        return commentService.countCommentsByGatherId(gatherId);
    }
}
