package com.vil.entities;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "compliance_reports")
public class Compliance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String name;
    
    @Column(nullable = false)
    private String status;
    
    @Column(length = 2000)
    private String description;
    
    @Column(name = "last_checked")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastChecked = new Date();

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Date getLastChecked() { return lastChecked; }
    public void setLastChecked(Date lastChecked) { this.lastChecked = lastChecked; }
}