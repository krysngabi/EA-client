package reservation_front.domain;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.constraints.Email;
import java.util.List;

@Entity
public class Customer extends User {
    @Email
    private String email;
    @OneToMany
    private List<Reservation> reservations;
}
