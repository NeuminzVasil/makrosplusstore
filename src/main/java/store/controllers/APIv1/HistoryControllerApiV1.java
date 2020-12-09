package store.controllers.APIv1;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import store.entities.History;
import store.exceptions.JulyMarketError;
import store.services.HistoryService;

@RestController
@RequestMapping("/api/v1/history")
public class HistoryControllerApiV1 {

    private final HistoryService historyService;

    public HistoryControllerApiV1(HistoryService historyService) {
        this.historyService = historyService;
    }

    /**
     * найти History по ID
     * @return History
     * @PathVariable Long id - id History
     */
    @GetMapping("/get/{id}")
//    @ResponseStatus(HttpStatus.FOUND)
    @CrossOrigin("*")
    public History findById(@PathVariable Long id) {
        return historyService.findById(id);
    }

    /**
     * Сохранить History в BD
     * @param history - History
     * @return - ссылка на сохраненный History
     */
    @PutMapping("/save")
    public ResponseEntity<?> save(@RequestBody History history) {

        // если история в заказе уже есть то добавлять не добавлять а бросить а бросить ошибку
        if (historyService.alreadyInInvoice(history)) {
            System.err.println("history: alreadyInInvoice");
            return new ResponseEntity<>(new JulyMarketError(HttpStatus.BAD_REQUEST.value(),
                    "Этап '" + history.getStep().getName() +"' добавлялся ранее."),
                    HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(historyService.save(history), HttpStatus.OK);
    }

    /**
     * Изменить History по ID
     * @param history - History
     * @return - ссылка на сохраненный History
     */
    @PutMapping("/edit")
    public History edit(@RequestBody History history) {
        return historyService.edit(history);
    }

    /**
     * удалить History
     * @param history - History
     */
    @DeleteMapping("/delete")
//    @ResponseStatus(HttpStatus.ACCEPTED)
    public void delete(@RequestBody History history) {
        historyService.delete(history);
    }

}
