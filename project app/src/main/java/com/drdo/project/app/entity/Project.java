package com.drdo.project.app.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "project_mst")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "native")
    private int id;
    @Column(name = "project_no", unique = true, nullable = false)
    @NotNull
    private String projectNo;
    @Column(name = "project_no_status")
    private char temporary;
    @Column(name = "title_of_project", nullable = false)
    @NotNull
    private String titleOfProject;
    @Column(name = "project_category", nullable = false)
    @NotNull
    private String projectCategory;
    private String gsqr;
    @Column(name = "nodal_lab_name", nullable = false)
    @NotNull
    private String nodalLabName;
    @ElementCollection
    @JoinTable(name = "project_lab_mapping")
    private List<String> otherLabs;
    @Column(name = "planning_status", nullable = false)
    @NotNull
    private String planningStatus;
    @Column(name = "planning_fyp")
    private String planningFYP;
    @Column(name = "security_level", nullable = false)
    @NotNull
    private String projectSecurityLevel;
    @Column(name = "total_cost_cr", nullable = false)
    @NotNull
    private double totalCost;
    @Column(name = "foreign_exchange")
    private double foreignExchange;
    @Column(name = "date_of_sanction")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sanctionDate;
    @Column(name = "pdc")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pdc;
    private String duration;
    @Column(name = "govt_letter_no")
    private String govtLetterNo;
    @Column(name = "govt_letter_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date govtLetterDate;
    @ElementCollection
    @JoinTable(name = "project_objectives")
    private List<String> objectives = new ArrayList<>();
    @ElementCollection
    @JoinTable(name = "project_scopes")
    private List<String> scopes = new ArrayList<>();
    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "project_fund_details")
    private List<FundDetail> fundDetails = new ArrayList<>();
    @ElementCollection
    @JoinTable(name = "project_deliverables")
    private List<String> deliverables = new ArrayList<>();
    @Column(name = "project_director")
    private String director;
    @OneToMany(mappedBy = "project", cascade = CascadeType.ALL)
    private List<Contents> macroDetails = new ArrayList<>();
    @OneToMany(mappedBy = "project", cascade = CascadeType.ALL)
    private List<Contents> microDetails = new ArrayList<>();
    @ElementCollection
    @JoinTable(name = "pdc_list")
    private List<Date> pdcList = new ArrayList<>();
    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "project_committee_pmrc")
    private List<ComMember> pmrc = new ArrayList<>();
    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "project_committee_eb")
    private List<ComMember> eb = new ArrayList<>();
    @ElementCollection
    @JoinTable(name = "pmrc_meetings")
    private List<Date> pmrcMeetings = new ArrayList<>();
    @ElementCollection
    @JoinTable(name = "eb_meetings")
    private List<Date> ebMeetings = new ArrayList<>();


    public void update(HttpServletRequest request) throws ParseException {
        if (this.getTemporary()=='y'){
            this.setProjectNo(request.getParameter("PROJECTNO"));
            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("GOVTLETTERDATE").substring(0, 9));
            this.setGovtLetterDate(date);
            this.setGovtLetterNo(request.getParameter("GOVTLETTERNO"));
            Date sanction = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("SANCTIONDATE").substring(0, 9));
            this.setSanctionDate(sanction);

        }
        this.setProjectCategory(request.getParameter("PROJECTCATEGORY"));
        this.setProjectSecurityLevel(request.getParameter("PROJECTSECURITY"));
        if (!this.getDuration().equals(request.getParameter("PDC"))){
            this.setDuration(request.getParameter("PDC"));
        }
        this.setTotalCost(Double.parseDouble(request.getParameter("TOTALCOST")));
    }
}
