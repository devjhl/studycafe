package com.group.studycafe.controller;

import com.group.studycafe.domain.Order;
import com.group.studycafe.domain.OrderTicketNames;
import com.group.studycafe.domain.Seat;
import com.group.studycafe.domain.User;
import com.group.studycafe.dto.ModifyUserDto;
import com.group.studycafe.service.OrderService;
import com.group.studycafe.service.OrderTicketNamesService;
import com.group.studycafe.service.SeatService;
import com.group.studycafe.service.UserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@RequestMapping("/mypage")
@Controller
public class MypageController {

    private final UserService userService;
    private final OrderService orderService;
    private final OrderTicketNamesService orderTicketNamesService;
    private final SeatService seatService;

    @GetMapping("")
    public String mypage() {
        return "mypage";
    }

    @GetMapping("/posts")
    public String posts() {
        return "posts";
    }

    @GetMapping("/profile")
    public String profile(@AuthenticationPrincipal User user, Model model) {
        ModifyUserDto modifyUserDto = new ModifyUserDto();
        modifyUserDto.setEmail(user.getEmail());
        modifyUserDto.setPhone(user.getPhone());

        model.addAttribute("userDto", modifyUserDto);
        return "profile";
    }

    @PostMapping("/profile")
    public String updateProfile(@Valid ModifyUserDto modifyUserDto, BindingResult bindingResult, @AuthenticationPrincipal User user, Model model) {
        if (bindingResult.hasErrors()) {
            bindingResult.getFieldErrors().forEach(fieldError ->
                    model.addAttribute(fieldError.getField() + "Error", fieldError.getDefaultMessage())
            );
            return "profile";
        }

        userService.updateUser(modifyUserDto, user);

        return "redirect:/mypage/profile";
    }

    @GetMapping("/reservations")
    public String reservations(@AuthenticationPrincipal User user, Model model) {
        List<Order> orderList = orderService.findOrdersByUsername(user.getUsername());
        Map<Long, List<OrderTicketNames>> orderTicketNamesMap = new HashMap<>();
        for (Order order : orderList) {
            List<OrderTicketNames> tickets = orderTicketNamesService.findOrderTicketsByOrderId(order.getId());
            orderTicketNamesMap.put(order.getId(), tickets);
        }

        List<Seat> reservedSeats = seatService.findReservedSeatsByUser(user.getId());
        System.out.println("reserved seats: " + reservedSeats);

        model.addAttribute("orderList", orderList);
        model.addAttribute("orderTicketNamesMap", orderTicketNamesMap);
        model.addAttribute("reservedSeats", reservedSeats);

        return "reservations";
    }
}
