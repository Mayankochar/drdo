package com.drdo.project.app.utils;

import com.drdo.project.app.entity.User;
import com.drdo.project.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        org.springframework.security.core.userdetails.User.UserBuilder builder;
        if (user != null && user.getEnabled()==1) {
            builder = org.springframework.security.core.userdetails.User.withUsername(username);
            builder.password(user.getPassword());
            builder.roles("user");
        } else {
            throw new UsernameNotFoundException("User not found.");
        }

        return builder.build();
    }
}
