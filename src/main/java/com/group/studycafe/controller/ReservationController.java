package com.group.studycafe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/reservation")
@Controller
public class ReservationController {

    @GetMapping("")
    public String basic() {
        return "basic";
    }

   /* @GetMapping("/buy")
    public String buy() {
        return "buy";
    }*/

}
