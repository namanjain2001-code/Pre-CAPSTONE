package capstone.bookmyshow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@SpringBootApplication
@ComponentScan(basePackages = "capstone.bookmyshow.Controller") 

public class BookmyshowApplication {
	private static ConfigurableApplicationContext context;
	public static void main(String[] args) {
		System.out.print("hdgjd");
		context=SpringApplication.run(BookmyshowApplication.class, args);
		
	}
	}
