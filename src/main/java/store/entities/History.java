/**
 * сущность история выполнения заказа
 * submitdate - дата создания шага выполнения.
 * customer - кто создал.
 * invoice - к какому заказу относится шаг выполнения.
 * step - к какому заказу относится шаг выполнения.
 */

package store.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "histories")
@Data
public class History {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column
    private Date submitdate;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private Customer customer;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "invoiceid")
    private Invoice invoice;

    @ManyToOne
    @JoinColumn(name = "stepid")
    private Step step;

    @JsonManagedReference
    @OneToMany(mappedBy = "history", fetch = FetchType.LAZY)
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<StepComment> stepcomment; /// fixme когда подключаю сущность историй все пропало!

    public Date getSubmitdate() {
        return submitdate;
    }

    public History() {
        this.submitdate = new Date();
    }

}
