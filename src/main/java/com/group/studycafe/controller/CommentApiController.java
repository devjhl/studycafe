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
    public ResponseEntity<CommentDto> create(@PathVariable Long gatherId, @RequestBody CommentDto dto) {
        System.out.println("Received comment: " + dto); // 로그 추가
        CommentDto createdDto = commentService.create(gatherId, dto);
        return ResponseEntity.status(HttpStatus.OK).body(createdDto);
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
}
