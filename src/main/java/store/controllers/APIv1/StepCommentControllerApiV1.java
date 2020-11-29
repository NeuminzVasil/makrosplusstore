package store.controllers.APIv1;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import store.entities.StepComment;
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
/*
        // если история в заказе уже есть то добавлять не добавлять а бросить а бросить ошибку
        if (historyService.alreadyInInvoice(stepComment)) {
            return new ResponseEntity<>("Этап '" + stepComment.getStep().getName() + "' добавлялся ранее.", HttpStatus.BAD_REQUEST);
        }*/

        return new ResponseEntity<>(stepCommentService.save(stepComment), HttpStatus.ACCEPTED);
    }

    /**
     * Изменить StepComment по ID
     * @param stepComment StepComment
     * @return - ссылка на сохраненный StepComment
     */
    @PutMapping("/edit")
    public StepComment edit(@RequestBody StepComment stepComment) {
        return stepCommentService.edit(stepComment);
    }

    /**
     * удалить StepComment
     * @param stepComment StepComment
     */
    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void delete(@RequestBody StepComment stepComment) {
        stepCommentService.delete(stepComment);
    }


}
