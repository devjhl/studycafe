package com.group.studycafe.controller;

import com.group.studycafe.domain.Gather;
import com.group.studycafe.service.GatherService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class GatherApiController {

    private static final Logger logger = LoggerFactory.getLogger(GatherController.class);
    private final GatherService gatherService;

    @PutMapping("/updateStatus/{id}")
    public ResponseEntity<String> updateStatus(@PathVariable Long id) {
        try {
            gatherService.updateStatus(id);
            return ResponseEntity.ok("Status updated successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating status");
        }
    }


    @PatchMapping("/updateGather/{id}")
    public ResponseEntity<Gather> updateGather(@PathVariable Long id, @RequestBody Gather gather) {
        try {
            Gather updatedGather = gatherService.updateGather(id, gather);
            return ResponseEntity.ok(updatedGather);
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }

    @DeleteMapping("/deleteGather/{id}")
    public ResponseEntity<String> deleteGather(@PathVariable Long id) {
        try {
            gatherService.deleteGather(id);
            return ResponseEntity.noContent().build();
        }catch (Exception e) {
            return ResponseEntity.status(500).build();
        }
    }

    @PostMapping("/likeGather")
    public ResponseEntity<Integer> likeGather(@RequestParam("id") Long gatherId) {
        try {
            int updatedLikes = gatherService.incrementLikes(gatherId);
            return ResponseEntity.ok(updatedLikes);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(-1);
        }
    }
}
