package com.drdo.project.app.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "fund_details")
public class FundDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "native")
    private int id;
    @Column(name = "minor_head", nullable = false)
    private int minorHead;
    private String type;
    private String item;
    private double ic;
    private double fe;

    public FundDetail(int minorHead, String type, String item, double ic, double fe) {
        this.minorHead = minorHead;
        this.type = type;
        this.item = item;
        this.ic = ic;
        this.fe = fe;
    }
}
