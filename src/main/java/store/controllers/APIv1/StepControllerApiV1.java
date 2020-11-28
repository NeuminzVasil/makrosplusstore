package store.controllers.APIv1;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import store.entities.Step;
import store.services.StepService;

import java.util.List;

@RestController
@RequestMapping("/api/v1/step")
public class StepControllerApiV1 {

    private final StepService stepService;

    public StepControllerApiV1(StepService stepService) {
        this.stepService = stepService;
    }

    /**
     * найти Step по ID
     *
     * @return Step
     * @PathVariable Long id - id Step
     */
    @GetMapping()
    @ResponseStatus(HttpStatus.FOUND)
    @CrossOrigin("*")
    public List<Step> findAll() {
        return stepService.findAll();
    }

    /**
     * Сохранить Step в BD
     *
     * @param step Step
     * @return - ссылка на сохраненный Step
     */
    @PutMapping("/save")
    public ResponseEntity<?> save(@RequestBody Step step) {
        return new ResponseEntity<>(stepService.save(step), HttpStatus.ACCEPTED);
    }

    /**
     * Изменить Step по ID
     * @param step Step
     * @return - ссылка на сохраненный Step
     */
    @PutMapping("/edit")
    public Step edit(@RequestBody Step step) {
        return stepService.edit(step);
    }

    /**
     * удалить Step
     * @param step Step
     */
    @DeleteMapping("/delete")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public void delete(@RequestBody Step step) {
        stepService.delete(step);
    }
}
