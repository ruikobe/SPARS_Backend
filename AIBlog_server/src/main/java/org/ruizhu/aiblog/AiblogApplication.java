package org.ruizhu.aiblog;

import org.springframework.boot.SpringApplication;
        import org.springframework.boot.autoconfigure.SpringBootApplication;
        import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class AiblogApplication {

    public static void main(String[] args) {
        SpringApplication.run(AiblogApplication.class, args);
    }
}