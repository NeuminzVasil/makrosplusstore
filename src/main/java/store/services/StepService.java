package store.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import store.entities.Step;
import store.repositories.StepRepository;

import java.util.List;

@Service
public class StepService {

    private StepRepository stepRepository;

    @Autowired
    public StepService(StepRepository stepRepository) {
        this.stepRepository = stepRepository;
    }

    public StepService() {
    }

    /**
     * найти все Step
     *
     * @return Step
     * Long id - id Step
     */
    public List<Step> findAll() {
        return stepRepository.findAll();
    }

    /**
     * Сохранить Step в BD
     *
     * @param step - Step
     * @return - ссылка на сохраненный Step
     */
    public Step save(Step step) {
        return stepRepository.save(step);
    }

    /**
     * Изменить Step по ID
     *
     * @param step Step
     * @return - ссылка на сохраненный Step
     */
    // @Secured("ROLE_ADMIN")
    public Step edit(Step step) {
        return stepRepository.saveAndFlush(step);
    }

    /**
     * удалить step и все елементы
     *
     * @param step удаляемый stepComment
     */
//    @Secured("ROLE_ADMIN")
    public void delete(Step step) {
        stepRepository.delete(step);
    }

}
