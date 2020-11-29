package store.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.entities.History;
import store.exceptions.SearchingNotFoundException;
import store.repositories.HistoryRepository;
import store.repositories.InvoiceRepository;
import store.repositories.StepCommentRepository;

import java.util.Date;
import java.util.concurrent.atomic.AtomicBoolean;

@Service
public class HistoryService {

    private HistoryRepository historyRepository;
    private InvoiceRepository invoiceRepository;
    private StepCommentRepository stepCommentRepository;

    @Autowired
    public HistoryService(HistoryRepository historyRepository,
                          InvoiceRepository invoiceRepository,
                          StepCommentRepository stepCommentRepository) {
        this.historyRepository = historyRepository;
        this.invoiceRepository = invoiceRepository;
        this.stepCommentRepository = stepCommentRepository;
    }

    public HistoryService() {
    }

    /**
     * найти History по ID
     *
     * @param id - искомое ID
     * @return - ссылка на СФ или исключение
     */
    public History findById(Long id) {
        return historyRepository.findById(id).orElseThrow(() -> new SearchingNotFoundException("History id: " + id + "не найден"));
    }

    /**
     * Сохранить History в BD
     *
     * @param history - History
     * @return - ссылка на сохраненный History
     */
    public History save(History history) {
        history.setSubmitdate(new Date());
        return historyRepository.save(history);
    }

    /**
     * Изменить History
     *
     * @param history - History
     * @return - ссылка на сохраненный History
     */
//    @Secured("ROLE_ADMIN")
    public History edit(History history) {
        return historyRepository.saveAndFlush(history);
    }

    /**
     * удалить history и все елементы
     *
     * @param history - удаляемый invoice
     */
//    @Secured("ROLE_ADMIN")
    public void delete(History history) {
        historyRepository.delete(history);
    }

    /**
     * проверяем наличия history в invoice
     *
     * @return
     */
    public boolean alreadyInInvoice(History history) {
/*
        System.err.println(invoiceRepository.findById(history.getInvoice().getId()).get().getHistories()
                .stream().map(h -> h.getStep()).collect(Collectors.toList()).contains(history.getStep()));
        System.err.println(invoiceRepository.findById(history.getInvoice().getId()).get().getHistories()
                .stream().map(h -> h.getStep()).collect(Collectors.toList()));
        System.err.println(invoiceRepository.findById(history.getInvoice().getId()).get().getHistories()
                .stream().map(h -> h.getStep()));*/

        AtomicBoolean found = new AtomicBoolean(false);

        invoiceRepository.findById(history.getInvoice().getId()).get().getHistories()
                .forEach(h -> {
                    if (h.getStep().getId().equals(history.getStep().getId())) found.set(true);
                });


        return found.get();


    }

}
