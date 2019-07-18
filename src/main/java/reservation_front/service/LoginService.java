package reservation_front.service;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import reservation_front.domain.Restaurant;
import reservation_front.domain.User;

import java.util.List;

public interface LoginService {

    public ResponseEntity<String> login(@RequestBody User user);
    boolean accessPage(String token);
}
