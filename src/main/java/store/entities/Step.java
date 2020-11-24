package store.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "steps")
@Data
public class Step {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column
    private String name;

    @Column
    private String description;

    public Step() {
    }

    public Step(String name, String description) {
        this.name = name;
        this.description = description;
    }

}
