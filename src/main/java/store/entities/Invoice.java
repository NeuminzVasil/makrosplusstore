/**
 * сущность счетфактуры (заказа) для отображения рабочей информации по движению заказа через цепочку согласований
 * в счетфактуре содержаться ссылки на заказчика (Customer) и на таблицу элементов заказа (Purchase)
 * department - на какой отдел пойдут затраты
 * comment - допИнфо
 * ordernumber - номер заказа из 1с
 * invoicenumber - порядковый номер счетФактуры
 * senttoapprove - уже направлена на согласование?
 * senttopurchase - уже закупается?
 * senttoprice - уже направлена на расценку товара
 * totalprice - общая цена заказа
 * resolveddate - дата завершения всего заказа.
 */

package store.entities;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "invoices")
@Data
public class Invoice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column
    private Date datacreate;

    @Column
    private String department;

    @Column
    private String comment; // fixme Изменить называние поля на ShortInfo

    @Column
    private String ordernumber; // fixme изменить название поля на Code1C

    @Column
    private String invoicenumber;

    @Column
    private Boolean senttoapprove;

    @Column
    private Boolean senttopurchase;

    @Column
    private Boolean senttoprice;

    @Column
    private Long totalprice;

    @Column
    private Date resolveddate;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private Customer customer;

    @JsonManagedReference
    @OneToMany(mappedBy = "invoice", fetch = FetchType.LAZY)
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private List<Purchase> purchases;

    public Invoice() {
        this.datacreate = new Date();
    }

    public Invoice(String ordernumber, String department, String comment) {
        this.ordernumber = ordernumber;
        this.department = department;
        this.comment = comment;
        this.datacreate = new Date();
    }

    public Invoice(Long id, String invoicenumber, Boolean senttoapprove, Boolean senttopurchase, Boolean senttoprice, Long totalprice, Date resolveddate, Customer customer, List<Purchase> purchases) {
        this.id = id;
        this.invoicenumber = invoicenumber;
        this.senttoapprove = senttoapprove;
        this.senttopurchase = senttopurchase;
        this.senttoprice = senttoprice;
        this.totalprice = totalprice;
        this.resolveddate = resolveddate;
        this.customer = customer;
        this.purchases = purchases;
    }

    @Override
    public String toString() {
        return "Invoice{" +
                "id=" + id +
                ", datacreate=" + datacreate +
                ", department='" + department + '\'' +
                ", comment='" + comment + '\'' +
                ", ordernumber='" + ordernumber + '\'' +
                ", invoicenumber='" + invoicenumber + '\'' +
                ", senttoapprove=" + senttoapprove +
                ", senttopurchase=" + senttopurchase +
                ", senttoprice=" + senttoprice +
                ", totalprice=" + totalprice +
                ", resolveddate=" + resolveddate +
                ", customer=" + customer.getLogin() +
                '}';
    }
}
