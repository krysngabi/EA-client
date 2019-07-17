package reservation_front.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.client.RestTemplate;
import reservation_front.domain.User;

import java.net.URI;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class LoginServiceProxy implements LoginService {
    @Autowired
    private RestTemplate restTemplate;

    private final String loginUrl = "http://localhost:8080/login";
    private final String pplUrl = "http://localhost:8080/person/";

    @Override
    public ResponseEntity<String> login(User user) {
        ResponseEntity<String> responseEntity = new ResponseEntity<>(HttpStatus.OK);
        responseEntity = restTemplate.postForEntity(loginUrl, user, String.class);
        StringTokenizer tokenizer = new StringTokenizer(responseEntity.toString(), ",");
        String token = "";
        int i = -1;
        while (tokenizer.hasMoreElements()) {
            String statuscode = tokenizer.nextElement().toString();
            token = tokenizer.nextElement().toString();
            break;

        }
        return ResponseEntity.status(HttpStatus.OK)
                .body(token);

    }
}
