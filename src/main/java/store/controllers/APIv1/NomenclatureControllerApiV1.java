package store.controllers.APIv1;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import store.entities.Category;
import store.entities.Nomenclature;
import store.services.CategoryService;
import store.services.NomenclatureService;
import store.utils.NomenclatureFilter;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/nomenclature")
//@PropertySource("classpath:values.properties")
public class NomenclatureControllerApiV1 {

    private final NomenclatureService nomenclatureService;
    private final CategoryService categoryService;
    private Integer countElementsOnPage;

    public NomenclatureControllerApiV1(NomenclatureService nomenclatureService, CategoryService categoryService) {
        this.nomenclatureService = nomenclatureService;
        this.categoryService = categoryService;
    }

    /**
     * вернуть JSON со всеми номенклартурами
     * @return List<Nomenclature>
     */
    @GetMapping
    public Page<Nomenclature> findAllNomenclature(@RequestParam Map<String, String> params) {
        int pageIndex = 0;
        if (params.containsKey("pageNumber")) {
            pageIndex = Integer.parseInt(params.get("pageNumber")) - 1;
        }
        Pageable pageRequest = PageRequest.of(pageIndex, 500);  //fixme перестал видеть переменную countElementsOnPage

        NomenclatureFilter nomenclatureFilter = new NomenclatureFilter(params);
        Page<Nomenclature> page = nomenclatureService.findAll(
                nomenclatureFilter.getNomenclatureSpecification(),
                pageRequest);

        List<Category> categories = categoryService.findAll();
        return page;
    }

    /**
     * Добавление нового товара в БД
     * @param nomenclature
     * @return Nomenclature
     */
    @PutMapping("/add")
    public Nomenclature addNomenclatureToDB(@RequestBody Nomenclature nomenclature) {
        return nomenclatureService.save(nomenclature);
    }

    @PostMapping("/delete")
    public Nomenclature deleteNomenclatureFromDB(@RequestBody Nomenclature nomenclature) {
        nomenclatureService.delete(nomenclature);
        return nomenclature;
    }

}
