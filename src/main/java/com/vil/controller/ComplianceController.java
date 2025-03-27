package com.vil.controller;

import com.vil.entities.Compliance;
import com.vil.service.ComplianceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/compliance")
public class ComplianceController {
    
    private final ComplianceService complianceService;

    @Autowired
    public ComplianceController(ComplianceService complianceService) {
        this.complianceService = complianceService;
    }

    @PostMapping
    public ResponseEntity<Compliance> generateReport(@RequestBody Compliance compliance) {
        Compliance report = complianceService.generateReport(compliance);
        return ResponseEntity.ok(report);
    }

    @GetMapping
    public ResponseEntity<List<Compliance>> getAllReports() {
        return ResponseEntity.ok(complianceService.getAllReports());
    }

    @GetMapping("/status/{status}")
    public ResponseEntity<List<Compliance>> getReportsByStatus(@PathVariable String status) {
        return ResponseEntity.ok(complianceService.getReportsByStatus(status));
    }
}