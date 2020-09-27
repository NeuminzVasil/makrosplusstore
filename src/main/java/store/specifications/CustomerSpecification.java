package store.specifications;


import org.springframework.data.jpa.domain.Specification;
import store.entities.Customer;

public class CustomerSpecification {

    public static Specification<Customer> loginContains(String word) {
        return (Specification<Customer>) (root, criteriaQuery, criteriaBuilder) ->
                criteriaBuilder.like(root.get("login"), "%" + word + "%");
    }

    public static Specification<Customer> firstNameContains(String word) {
        return (Specification<Customer>) (root, criteriaQuery, criteriaBuilder) ->
                criteriaBuilder.like(root.get("firstName"), "%" + word + "%");
    }

    public static Specification<Customer> lastNameContains(String word) {
        return (Specification<Customer>) (root, criteriaQuery, criteriaBuilder) ->
                criteriaBuilder.like(root.get("lastName"), "%" + word + "%");
    }


}
