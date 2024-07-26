package com.group.studycafe.service;

import com.group.studycafe.domain.User;
import com.group.studycafe.dto.ModifyUserDto;
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

    private <T> User convertToUser(T dto) {
        if (dto instanceof SignupUserDto || dto instanceof ModifyUserDto) {
            String password = null;
            String username = null;
            String email = null;
            String phone = null;

            if (dto instanceof SignupUserDto) {
                SignupUserDto signupUserDto = (SignupUserDto) dto;
                password = signupUserDto.getPassword();
                username = signupUserDto.getUsername();
                email = signupUserDto.getEmail();
                phone = signupUserDto.getPhone();
            } else if (dto instanceof ModifyUserDto) {
                ModifyUserDto modifyUserDto = (ModifyUserDto) dto;
                password = modifyUserDto.getPassword();
                email = modifyUserDto.getEmail();
                phone = modifyUserDto.getPhone();
            }

            if (password == null) {
                throw new IllegalArgumentException("패스워드는 NULL일 수 없다.");
            }

            User user = new User();
            user.setUsername(username);
            user.setPassword(passwordEncoder.encode(password));
            user.setEmail(email);
            user.setPhone(phone);
            return user;
        } else {
            throw new IllegalArgumentException("지원하지 않는 DTO 타입입니다.");
        }
    }

    @Transactional
    public void updateUser(ModifyUserDto modifyUserDto, User currentUser) {
        if (modifyUserDto.getPassword() != null && !modifyUserDto.getPassword().isEmpty()) {
            currentUser.setPassword(passwordEncoder.encode(modifyUserDto.getPassword()));
        }
        currentUser.setEmail(modifyUserDto.getEmail());
        currentUser.setPhone(modifyUserDto.getPhone());
        userRepository.save(currentUser);
    }

    public boolean isUsernameTaken(String username) {
        return userRepository.existsByUsername(username);
    }

    public boolean isEmailTaken(String email) {
        return userRepository.existsByEmail(email);
    }

    public boolean isPhoneTaken(String phone) {
        return userRepository.existsByPhone(phone);
    }
}
