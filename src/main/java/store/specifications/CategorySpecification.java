package store.specifications;

import org.springframework.data.jpa.domain.Specification;
import store.entities.Category;

public class CategorySpecification {

    public static Specification<Category> titleContains(String word) {
        return (Specification<Category>) (root, criteriaQuery, criteriaBuilder) ->
                criteriaBuilder.like(root.get("category"), "%" + word + "%");
    }


}
