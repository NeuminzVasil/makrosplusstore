/**
 * сущность элементов заказа.
 * invoice - ссылка на Счетфактуры (Invoice) к которой он пренадлежит
 * nomenclature - ссылка на Товары включенные в данный заказ
 * count - колличество товара, цену товара в момент оформления заказа,
 * approver - // fixme Поправить называние поля на Customer . прописать правильные ссылки в базе. смысл поля - показать для кого закупался товар.
 * resolvingdate - дата получения товара
 * comment - для допИнфо.
 */
package store.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "purchases")
@Data
public class Purchase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "invoiceid")
    private Invoice invoice;

    @ManyToOne
    @JoinColumn(name = "nomenclatureid")
    private Nomenclature nomenclature;

    @Column
    private Long count;

    @Column
    private String approver; // fixme Поправить называние поля на Customer . прописать правильные ссылки в базе. смысл поля - показать для кого закупался товар.

    @Column
    private Date resolvingdate;

    @Column
    private String comment;

    @Column
    private Float buyingPrice;

    public Purchase() {
    }

    public Purchase(Nomenclature nomenclature,
                    Long count,
                    String approver,
                    String comment,
                    Float buyingPrice) {
        this.nomenclature = nomenclature;
        this.count = count;
        this.approver = approver;
        this.comment = comment;
        this.buyingPrice = buyingPrice;
    }

    @Override
    public String toString() {
        return "Purchase{" +
                "id=" + id +
                ", invoice=" + invoice +
                ", nomenclature=" + nomenclature +
                ", count=" + count +
                ", approver='" + approver + '\'' +
                ", resolvingdate=" + resolvingdate +
                ", comment='" + comment + '\'' +
                ", buyingPrice=" + buyingPrice +
                '}';
    }
}
