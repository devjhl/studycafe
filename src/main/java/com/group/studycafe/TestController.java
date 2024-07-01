package com.group.studycafe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("/")
    public String home() {
        System.out.println("TestController");
        return "index";
    }
}
