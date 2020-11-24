/**
 * сущность комментария к шагу выполнения заказа
 * customer - ссылка на создавшего комментарий
 * comment - текст комментария
 * attachedfileid - прикрепленный файл если есть.
 * step - ссылка на шаг к которому прикрепляется комментарий.
 */

package store.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "stepcomments")
@Data
public class StepComment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "customerid")
    private Customer customer;

    @Column
    private String comment;

    @Column
    private Long attachedfileid; //todo после создания таблицы с файлами изменить привязку "вантумени"

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "historyid")
    private History history;

    @Column
    private Date submitdate;


    public StepComment() {
        this.submitdate = new Date();
    }


    @Override
    public String toString() {
        return "StepComment{" +
                "id=" + id +
                ", customer=" + customer +
                ", comment='" + comment + '\'' +
                ", attachedfileid=" + attachedfileid +
                ", history=" + history +
                ", submitdate=" + submitdate +
                '}';
    }
}
