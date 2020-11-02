package org.ruizhu.aiblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by Rui Zhu
 */
@Component
public class DataStatisticsComponent {
    @Autowired
    ArticleService articleService;

    //Statistics
    @Scheduled(cron = "1 0 0 * * ?")
    public void pvStatisticsPerDay() {
        articleService.pvStatisticsPerDay();
    }
}
