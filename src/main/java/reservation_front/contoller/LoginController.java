package reservation_front.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;
import reservation_front.domain.Restaurant;
import reservation_front.domain.User;
import reservation_front.service.LoginServiceProxy;

import javax.validation.Valid;
@Controller
public class LoginController {
    //818417293537-qvh0ogiscij8pm49rk6ag3ajdb67le9r.apps.googleusercontent.com
    //B3C6FBxbV4U_oiMBDJlKtxii
    @Autowired
    LoginServiceProxy loginServiceProxy;
    @PostMapping(value = "/login")
    public ResponseEntity<String> post(@RequestBody User user){

         return loginServiceProxy.login(user);
    }
    @GetMapping("/login")
    public String login(@ModelAttribute("user")@RequestBody User user) {
        return "login";
    }
    @GetMapping("/logged")
    public String logged(@RequestParam String token,Model model) {
        model.addAttribute("token", token);
        return "logged";
    }
    @GetMapping("/face")
    public String login() {
        return "facebook";
    }
}
