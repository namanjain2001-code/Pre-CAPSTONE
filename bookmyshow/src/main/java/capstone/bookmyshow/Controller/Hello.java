package capstone.bookmyshow.Controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Hello{

    @RequestMapping("/hell")
    public String hello() {
        //return "Hello";  // This maps to /WEB-INF/jsp/helloWorld.jsp
    	System.out.println("Hellow2");
    	return "hello";
    }
}
