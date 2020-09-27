package store.specifications;

import org.springframework.data.jpa.domain.Specification;
import store.entities.Nomenclature;

public class NomenclatureSpecification {

    /**
     * спецификация для поиска по значению названия сущьности
     *
     * @param word - искомое значение
     * @return - спецификацию по значению названия сущьности
     * root.get("nomenclature") - реальное поле сущьности
     */
    public static Specification<Nomenclature> titleContains(String word) {
        return (Specification<Nomenclature>) (root, criteriaQuery, criteriaBuilder) ->
                criteriaBuilder.like(root.get("nomenclature"), "%" + word + "%");
    }

    public static Specification<Nomenclature> priceGreaterThanOrEq(Integer value) {
        return (Specification<Nomenclature>) (root, criteriaQuery, criteriaBuilder) -> {
            return criteriaBuilder.greaterThanOrEqualTo(root.get("price"), value);
        };
    }

    public static Specification<Nomenclature> priceLesserThanOrEq(Integer value) {
        return (Specification<Nomenclature>) (root, criteriaQuery, criteriaBuilder) -> {
            return criteriaBuilder.lessThanOrEqualTo(root.get("price"), value);
        };
    }

    /**
     * спецификация для поиска по ID
     *
     * @param categoryid - id категории
     * @return - спецификацию на id
     * root.get("category") - реальное поле сущьности
     */
    public static Specification<Nomenclature> categoryIdEquals(Integer categoryid) {
        return (Specification<Nomenclature>) (root, criteriaQuery, criteriaBuilder) -> {
            return criteriaBuilder.equal(root.get("category"), categoryid);
        };
    }


}
