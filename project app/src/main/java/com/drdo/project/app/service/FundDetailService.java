package com.drdo.project.app.service;

import com.drdo.project.app.repository.FundDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FundDetailService {

    @Autowired
    private FundDetailRepository fundDetailRepository;
}
