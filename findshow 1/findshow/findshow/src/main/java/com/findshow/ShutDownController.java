package com.findshow;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ShutDownController {

    private final ConfigurableApplicationContext context;

    public ShutDownController(ConfigurableApplicationContext context) {
        this.context = context;
    }

    @GetMapping("/shutdown")
    public String shutdown() {
        SpringApplication.exit(context, () -> 0); // Exit the application
        return "Application is shutting down...";
    }
}
