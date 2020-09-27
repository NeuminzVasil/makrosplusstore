package store.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "nomenclatures")
@Data
public class Nomenclature {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column
    private String comment;
    @Column
    private Float price;
    @Column
    private final Date submitDate;
    @Column
    private String nomenclature;
    @Column
    private String manufacturer;
    @Column
    private String code;
    @Column
    private Date expiredDate;
    @ManyToOne
    @JsonIgnore //todo удалить  - временная запись
    @JoinColumn(name = "categoryid")
    private Category category;

    public Nomenclature() {
        this.submitDate = new Date();
    }

    public Nomenclature(String nomenclature, Float price) {
        this.nomenclature = nomenclature;
        this.price = price;
        this.submitDate = new Date();
    }

    @Override
    public String toString() {
        return "Nomenclature{" +
                "id=" + id +
                ", comment='" + comment + '\'' +
                ", price=" + price +
                ", submitDate=" + submitDate +
                ", nomenclature='" + nomenclature + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", code='" + code + '\'' +
                ", expiredDate=" + expiredDate +
                ", category=" + category +
                '}';
    }
}
