package store.utils;

import org.springframework.data.jpa.domain.Specification;
import store.entities.Nomenclature;
import store.specifications.NomenclatureSpecification;

import java.util.Map;

//import lombok.Getter;

//@Getter
public class NomenclatureFilter {
    private final StringBuilder filterDefinition;
    private Specification<Nomenclature> nomenclatureSpecification;

    public NomenclatureFilter(Map<String, String> map) {

        this.nomenclatureSpecification = Specification.where(null);

        this.filterDefinition = new StringBuilder();

        if (map.containsKey("nomenclature") && !map.get("nomenclature").isEmpty()) {
            String nomenclature = map.get("nomenclature");
            nomenclatureSpecification = nomenclatureSpecification.and(NomenclatureSpecification.titleContains(nomenclature));
            filterDefinition.append("&nomenclature=").append(nomenclature);
        }
        if (map.containsKey("minPrice") && !map.get("minPrice").isEmpty()) {
            int minPrice = Integer.parseInt(map.get("minPrice"));
            nomenclatureSpecification = nomenclatureSpecification.and(NomenclatureSpecification.priceGreaterThanOrEq(minPrice));
            filterDefinition.append("&minPrice=").append(minPrice);
        }
        if (map.containsKey("maxPrice") && !map.get("maxPrice").isEmpty()) {
            int maxPrice = Integer.parseInt(map.get("maxPrice"));
            nomenclatureSpecification = nomenclatureSpecification.and(NomenclatureSpecification.priceLesserThanOrEq(maxPrice));
            filterDefinition.append("&maxPrice=").append(maxPrice);
        }
        if (map.containsKey("categoryid") && !map.get("categoryid").isEmpty()) {
            Integer categoryid = Integer.parseInt(map.get("categoryid"));
            nomenclatureSpecification = nomenclatureSpecification.and(NomenclatureSpecification.categoryIdEquals(categoryid));
            filterDefinition.append("&maxPrice=").append(categoryid);
        }

    }

    public Specification<Nomenclature> getNomenclatureSpecification() {
        return nomenclatureSpecification;
    }

    public StringBuilder getFilterDefinition() {
        return filterDefinition;
    }

}
