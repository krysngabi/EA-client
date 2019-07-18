package reservation_front.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import reservation_front.domain.User;
import reservation_front.service.LoginServiceProxy;

@Controller
public class DefaultController {
    @Autowired
    LoginServiceProxy loginServiceProxy;

    @GetMapping("/error")
    public String mainPage() {
        return "error";
    }


}
