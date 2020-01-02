package com.drdo.project.app.service;

import com.drdo.project.app.entity.Project;
import com.drdo.project.app.entity.User;
import com.drdo.project.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public String registerUser(User user){
        User foundUser = userRepository.findByUsername(user.getUsername());
        if(foundUser==null){
            user.setEnabled(1);
            user.setPassword(new BCryptPasswordEncoder().encode(user.getPassword()));
            userRepository.save(user);
            return "success";
        }
        return "already exists";
    }
}
