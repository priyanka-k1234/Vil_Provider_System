package com.vil.service;

import com.vil.entities.Compliance;
import com.vil.dao.ComplianceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComplianceService {
    
    private final ComplianceRepository complianceRepository;

    @Autowired
    public ComplianceService(ComplianceRepository complianceRepository) {
        this.complianceRepository = complianceRepository;
    }

    public Compliance generateReport(Compliance compliance) {
        return complianceRepository.save(compliance);
    }

    public List<Compliance> getAllReports() {
        return complianceRepository.findAll();
    }

    public List<Compliance> getReportsByStatus(String status) {
        return complianceRepository.findByStatus(status);
    }
}