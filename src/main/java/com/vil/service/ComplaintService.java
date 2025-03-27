package com.vil.service;

import com.vil.entities.Complaint;
import com.vil.dao.ComplaintRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ComplaintService {
    
    private final ComplaintRepository complaintRepository;

    @Autowired
    public ComplaintService(ComplaintRepository complaintRepository) {
        this.complaintRepository = complaintRepository;
    }

    public Complaint logComplaint(Complaint complaint) {
        return complaintRepository.save(complaint);
    }

    public Optional<Complaint> getComplaintById(Long id) {
        return complaintRepository.findById(id);
    }

    public List<Complaint> getAllComplaints() {
        return complaintRepository.findAll();
    }

    public void deleteComplaint(Long id) {
        complaintRepository.deleteById(id);
    }

    public List<Complaint> getComplaintsByUserId(Long userId) {
        return complaintRepository.findByUserId(userId);
    }
}