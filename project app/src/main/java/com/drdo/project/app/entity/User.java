package com.drdo.project.app.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "employee")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "native")
    private int empId;
    @Column(name = "username", unique = true, nullable = false)
    private String username;
    private String password;
    private int enabled;

}
