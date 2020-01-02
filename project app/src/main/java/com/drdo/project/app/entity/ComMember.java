package com.drdo.project.app.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "committee_member")
@Getter
@Setter
public class ComMember {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "native")
    private int id;

    private String designation;
    private String name;
    private String phone;

    @Column(name = "primary_email")
    private String primaryEmail;

    @Column(name = "secomdary_email")
    private String secondaryEmail;

    public ComMember(String designation, String name, String phone, String primaryEmail, String secondaryEmail) {
        this.designation = designation;
        this.name = name;
        this.phone = phone;
        this.primaryEmail = primaryEmail;
        this.secondaryEmail = secondaryEmail;
    }

    public ComMember(){}
}
