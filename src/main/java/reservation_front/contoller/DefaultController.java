package reservation_front.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import reservation_front.domain.User;

@Controller
public class DefaultController {

    @GetMapping("/")
    public String mainPage() {
        return "index";
    }

}
