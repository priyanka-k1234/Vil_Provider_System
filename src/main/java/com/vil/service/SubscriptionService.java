package com.vil.service;

import com.vil.entities.Subscription;
import com.vil.dao.SubscriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class SubscriptionService {
    
    private final SubscriptionRepository subscriptionRepository;

    @Autowired
    public SubscriptionService(SubscriptionRepository subscriptionRepository) {
        this.subscriptionRepository = subscriptionRepository;
    }

    public Subscription createSubscription(Subscription subscription) {
        return subscriptionRepository.save(subscription);
    }

    public Optional<Subscription> getSubscriptionById(Long id) {
        return subscriptionRepository.findById(id);
    }

    public List<Subscription> getAllSubscriptions() {
        return subscriptionRepository.findAll();
    }

    public Subscription updateSubscriptionStatus(Long userId, String action) {
        Subscription subscription = subscriptionRepository.findOneByUserId(userId);
        if (subscription != null) {
            switch (action.toUpperCase()) {
                case "ACTIVATE":
                    subscription.setStatus("ACTIVE");
                    break;
                case "DEACTIVATE":
                    subscription.setStatus("INACTIVE");
                    break;
                case "UPGRADE":
                    subscription.setStatus("UPGRADED");
                    break;
                case "DOWNGRADE":
                    subscription.setStatus("DOWNGRADED");
                    break;
            }
            subscription.setUpdatedAt(new Date());
            return subscriptionRepository.save(subscription);
        }
        return null;
    }

    public void deleteSubscription(Long id) {
        subscriptionRepository.deleteById(id);
    }

    public Subscription getSubscriptionByUserId(Long userId) {
        return subscriptionRepository.findOneByUserId(userId);
    }
}