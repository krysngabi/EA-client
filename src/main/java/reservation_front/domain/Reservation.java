package reservation_front.domain;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class Reservation {
    @Id
    @GeneratedValue
    private Long id;
    private LocalDateTime reservationDate;
    private LocalDateTime reservationCancelDate;
    private int numberOfPeople;
    @ManyToOne
    private Time time;
    @OneToMany
    private List<Table> tables;
    @ManyToOne
    private User createdBy;
    @ManyToOne
    private Customer owner;

}
