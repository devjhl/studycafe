package com.group.studycafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/gather")
@Controller
public class GatherController {

    @GetMapping("")
    public String gather() {
        return "list";
    }

    @GetMapping("/write")
    public String write() {
        return "writeGather";
    }

    @PostMapping("/write")
    public String writePost() {

        return "redirect:/gather";
    }
}
