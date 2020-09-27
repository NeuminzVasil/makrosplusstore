package store.utils;


import org.springframework.data.jpa.domain.Specification;
import store.entities.Customer;
import store.specifications.CustomerSpecification;

import java.util.Map;

//import lombok.Getter;

//@Getter
public class CustomerFilter {
    private final StringBuilder filterDefinition;
    private Specification<Customer> customerSpecification;

    public CustomerFilter(Map<String, String> map) {

        this.customerSpecification = Specification.where(null);

        this.filterDefinition = new StringBuilder();

        if (map.containsKey("login") && !map.get("login").isEmpty()) {
            String login = map.get("login");
            customerSpecification = customerSpecification.and(CustomerSpecification.loginContains(login));
            filterDefinition.append("&login=").append(login);
        }

        if (map.containsKey("firstName") && !map.get("firstName").isEmpty()) {
            String firstName = map.get("firstName");
            customerSpecification = customerSpecification.and(CustomerSpecification.firstNameContains(firstName));
            filterDefinition.append("&firstName=").append(firstName);
        }

        if (map.containsKey("lastName") && !map.get("lastName").isEmpty()) {
            String lastName = map.get("lastName");
            customerSpecification = customerSpecification.and(CustomerSpecification.lastNameContains(lastName));
            filterDefinition.append("&lastName=").append(lastName);
        }
    }

    public Specification<Customer> getCustomerSpecification() {
        return customerSpecification;
    }

    public StringBuilder getFilterDefinition() {
        return filterDefinition;
    }


}
