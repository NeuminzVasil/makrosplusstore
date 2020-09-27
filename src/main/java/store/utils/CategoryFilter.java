package store.utils;

import org.springframework.data.jpa.domain.Specification;
import store.entities.Category;
import store.specifications.CategorySpecification;

import java.util.Map;

//import lombok.Getter;

//@Getter
public class CategoryFilter {
    private final StringBuilder filterDefinition;
    private Specification<Category> categorySpecification;

    public CategoryFilter(Map<String, String> map) {

        this.categorySpecification = Specification.where(null);

        this.filterDefinition = new StringBuilder();

        if (map.containsKey("category") && !map.get("category").isEmpty()) {
            String nomenclature = map.get("category");
            categorySpecification = categorySpecification.and(CategorySpecification.titleContains(nomenclature));
            filterDefinition.append("&nomenclature=").append(nomenclature);
        }

    }

    public Specification<Category> getCategorySpecification() {
        return categorySpecification;
    }

    public StringBuilder getFilterDefinition() {
        return filterDefinition;
    }

}
