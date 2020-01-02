package com.drdo.project.app.repository;

import com.drdo.project.app.entity.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ProjectRepository extends JpaRepository<Project, String> {

    public Project findByProjectNo(String projectNo);

    @Query("select project.projectNo from Project project")
    public List<String> findAllProjects();

}
