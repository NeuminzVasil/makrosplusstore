package store.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.entities.StepComment;
import store.exceptions.SearchingNotFoundException;
import store.repositories.HistoryRepository;
import store.repositories.InvoiceRepository;
import store.repositories.StepCommentRepository;

import java.util.Date;

@Service
public class StepCommentService {

    private HistoryRepository historyRepository;
    private InvoiceRepository invoiceRepository;
    private StepCommentRepository stepCommentRepository;

    @Autowired
    public StepCommentService(HistoryRepository historyRepository,
                              InvoiceRepository invoiceRepository,
                              StepCommentRepository stepCommentRepository) {
        this.historyRepository = historyRepository;
        this.invoiceRepository = invoiceRepository;
        this.stepCommentRepository = stepCommentRepository;
    }

    public StepCommentService() {
    }

    /**
     * найти Stepcomment по ID
     *
     * @return Stepcomment
     * Long id - id StepComment
     */
    public StepComment findById(Long id) {
        return stepCommentRepository.findById(id).orElseThrow(() -> new SearchingNotFoundException("StepComment id: " + id + "не найден"));
    }

    /**
     * Сохранить StepComment в BD
     *
     * @param stepComment - StepComment
     * @return - ссылка на сохраненный History
     */
    public StepComment save(StepComment stepComment) {
        stepComment.setSubmitdate(new Date());
        return stepCommentRepository.save(stepComment);
    }

    /**
     * Изменить StepComment по ID
     *
     * @param stepComment StepComment
     * @return - ссылка на сохраненный StepComment
     */
    // @Secured("ROLE_ADMIN")
    public StepComment edit(StepComment stepComment) {
        return stepCommentRepository.saveAndFlush(stepComment);
    }

    /**
     * удалить stepComment и все елементы
     *
     * @param stepComment удаляемый stepComment
     */
//    @Secured("ROLE_ADMIN")
    public void delete(StepComment stepComment) {
        stepCommentRepository.delete(stepComment);
    }


}
