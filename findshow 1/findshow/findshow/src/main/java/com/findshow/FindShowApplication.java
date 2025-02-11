package com.findshow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@EnableScheduling
@EnableWebSecurity
@EnableJpaRepositories
public class FindShowApplication {
    // Make the context accessible to stop the application
    private static ConfigurableApplicationContext context;

    public static void main(String[] args) {
        // Store the application context so that it can be accessed globally
    	context=SpringApplication.run(FindShowApplication.class, args);
    }


    
//    @Scheduled(initialDelay=100000)
//    public void shut() {
//    	SpringApplication.exit(context, () -> 0);
//    }
}