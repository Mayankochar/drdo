package com.drdo.project.app.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "contents")
public class Contents {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "native")
    private int id;
    @Column(name = "item_number", nullable = false)
    private int itemNumber;
    private String description;
    @Column(name = "page_no")
    private String pageNo;
    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

    public Contents(int itemNumber, String description, String pageNo) {
        this.itemNumber = itemNumber;
        this.description = description;
        this.pageNo = pageNo;
    }
}
