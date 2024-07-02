package com.group.studycafe.service;

import com.group.studycafe.domain.User;
import com.group.studycafe.dto.SignupUserDto;
import com.group.studycafe.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Transactional
    public void save(SignupUserDto userDto) {
        User user = convertToUser(userDto);
        userRepository.save(user);
    }

    private User convertToUser(SignupUserDto signupUserDto) {
        if (signupUserDto.getPassword() == null) {
            throw new IllegalArgumentException("패스워드는 NULL일수가 없다.");
        }

        User user = new User();
        user.setUsername(signupUserDto.getUsername());
        user.setPassword(passwordEncoder.encode(signupUserDto.getPassword()));
        user.setEmail(signupUserDto.getEmail());
        user.setPhone(signupUserDto.getPhone());
        return user;
    }
}
