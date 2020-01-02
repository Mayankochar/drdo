package com.drdo.project.app.repository;

import com.drdo.project.app.entity.FundDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FundDetailRepository extends JpaRepository<FundDetail, Integer> {
}
