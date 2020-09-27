package store.specifications;

import org.springframework.data.jpa.domain.Specification;
import store.entities.Purchase;

public class PurchaseSpecification {

    /**
     * спецификация для поиска по значению названия сущьности
     *
     * @param word - искомое значение
     * @return - спецификацию по значению названия сущьности
     * root.get("purchase") - реальное поле сущьности
     */
    public static Specification<Purchase> titleContains(String word) {
        return (Specification<Purchase>) (root, criteriaQuery, criteriaBuilder) ->
                criteriaBuilder.like(root.get("purchase"), "%" + word + "%");
    }

    /**
     * спецификация для поиска по ID
     *
     * @param purchaseId - id заказа
     * @return - спецификацию на id
     * root.get("id") - реальное поле сущьности
     */
    public static Specification<Purchase> purchaseIdEquals(Integer purchaseId) {
        return (Specification<Purchase>) (root, criteriaQuery, criteriaBuilder) ->
                criteriaBuilder.equal(root.get("id"), purchaseId);
    }


}
