package store.controllers.APIv1;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import store.entities.StepComment;
import store.exceptions.JulyMarketError;
import store.services.StepCommentService;

@RestController
@RequestMapping("/api/v1/stepcomment")
public class StepCommentControllerApiV1 {

    private final StepCommentService stepCommentService;

    public StepCommentControllerApiV1(StepCommentService stepCommentService) {
        this.stepCommentService = stepCommentService;
    }

    /**
     * найти Stepcomment по ID
     *
     * @return Stepcomment
     * @PathVariable Long id - id Stepcomment
     */
    @GetMapping("/get/{id}")
//    @ResponseStatus(HttpStatus.FOUND)
    @CrossOrigin("*")
    public StepComment findById(@PathVariable Long id) {
        return stepCommentService.findById(id);
    }

    /**
     * Сохранить StepComment в BD
     *
     * @param stepComment StepComment
     * @return - ссылка на сохраненный History
     */
    @PutMapping("/save")
    public ResponseEntity<?> save(@RequestBody StepComment stepComment) {
        try {
            return new ResponseEntity<>(stepCommentService.save(stepComment), HttpStatus.ACCEPTED);
        } catch (Exception e) {
            System.err.println("Невозможно добавить сообщение");
            return new ResponseEntity<>(new JulyMarketError(HttpStatus.BAD_REQUEST.value(),
                    "Невозможно добавить сообщение"),
                    HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * Изменить StepComment по ID
     *
     * @param stepComment StepComment
     * @return - ссылка на сохраненный StepComment
     */
    @PutMapping("/edit")
    public StepComment edit(@RequestBody StepComment stepComment) {
        return stepCommentService.edit(stepComment);
    }

    /**
     * удалить StepComment
     *
     * @param stepComment StepComment
     */
    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void delete(@RequestBody StepComment stepComment) {
        stepCommentService.delete(stepComment);
    }

/*    @ExceptionHandler
    public ResponseEntity<?> handleException(ex)*/

}
