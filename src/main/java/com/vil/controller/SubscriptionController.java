package com.vil.controller;

import com.vil.entities.Subscription;
import com.vil.service.SubscriptionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/subscriptions")
public class SubscriptionController {
    
    private final SubscriptionService subscriptionService;

    @Autowired
    public SubscriptionController(SubscriptionService subscriptionService) {
        this.subscriptionService = subscriptionService;
    }

    @PostMapping("/create")
    public ResponseEntity<Subscription> createSubscription(@RequestBody Subscription subscription) {
        Subscription created = subscriptionService.createSubscription(subscription);
        return ResponseEntity.ok(created);
    }

    @GetMapping
    public ResponseEntity<List<Subscription>> getAllSubscriptions() {
        return ResponseEntity.ok(subscriptionService.getAllSubscriptions());
    }

    @PutMapping("/update/{action}/{userId}")
    public ResponseEntity<Subscription> updateSubscription(
            @PathVariable String action, 
            @PathVariable Long userId) {
        try {
            Subscription updated = subscriptionService.updateSubscriptionStatus(userId, action);
            return ResponseEntity.ok(updated);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSubscription(@PathVariable Long id) {
        subscriptionService.deleteSubscription(id);
        return ResponseEntity.noContent().build();
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<Subscription> getSubscriptionByUser(@PathVariable Long userId) {
        Subscription subscription = subscriptionService.getSubscriptionByUserId(userId);
        if (subscription == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(subscription);
    }
}