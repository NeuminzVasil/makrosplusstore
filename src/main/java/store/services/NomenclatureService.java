package store.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import store.entities.Nomenclature;
import store.exceptions.SearchingNotFoundException;
import store.repositories.NomenclatureRepository;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class NomenclatureService {
    @Autowired
    private NomenclatureRepository nomenclatureRepository;

    public NomenclatureService() {
    }

    public NomenclatureService(NomenclatureRepository nomenclatureRepository) {
        this.nomenclatureRepository = nomenclatureRepository;
    }

    @Autowired
    public void setNomenclatureRepository(NomenclatureRepository nomenclatureRepositoryDB) {
        this.nomenclatureRepository = nomenclatureRepositoryDB;
    }

    /**
     * получить все товары
     *
     * @return Page<Nomenclature>
     */
    public List<Nomenclature> findAll() {
        return nomenclatureRepository.findAll()
                .stream()
                .sorted(Comparator.comparing(Nomenclature::getNomenclature))
                        .collect(Collectors.toList());
    }

    /**
     * найти все товары по спецификации
     * @param spec     спецификация для фильтра
     * @param pageable - страница для фильтра
     * @return Page<Nomenclature>
     */
    public Page<Nomenclature> findAll(Specification<Nomenclature> spec, Pageable pageable) {
        return nomenclatureRepository.findAll(spec, pageable);
    }

    /**
     * найти товар по ID
     * @param id - искомое ID
     * @return - ссылка на товар или исключение
     */
    public Nomenclature findById(Long id) {
        return nomenclatureRepository.findById(id).orElseThrow(() -> new SearchingNotFoundException("Не могу найти товар с id = " + id));
    }

    /**
     * Сохранить новый товар в БД
     * @param nomenclature - добавляемый товар
     * @return - Nomenclature
     */
    public Nomenclature save(Nomenclature nomenclature){
        return nomenclatureRepository.saveAndFlush(nomenclature);
    }

    public void delete(Nomenclature nomenclature) {
        nomenclatureRepository.delete(nomenclature);
    }
}
