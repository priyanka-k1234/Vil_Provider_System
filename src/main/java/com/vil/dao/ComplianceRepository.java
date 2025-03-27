package com.vil.dao;

import com.vil.entities.Compliance;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ComplianceRepository extends JpaRepository<Compliance, Long> {
    List<Compliance> findByStatus(String status);
}