package store.specifications;

import org.springframework.data.jpa.domain.Specification;
import store.entities.Invoice;

public class InvoiceSpecification {

    public static Specification<Invoice> titleContains(String word) {
        return (Specification<Invoice>) (root, criteriaQuery, criteriaBuilder) ->
                criteriaBuilder.like(root.get("invoice"), "%" + word + "%");
    }


}
