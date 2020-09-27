package store.utils;

import org.springframework.data.jpa.domain.Specification;
import store.entities.Invoice;
import store.specifications.InvoiceSpecification;

import java.util.Map;

public class InvoiceFilter {
    private final StringBuilder filterDefinition;
    private Specification<Invoice> invoiceSpecification;

    public InvoiceFilter(Map<String, String> map) {

        this.invoiceSpecification = Specification.where(null);

        this.filterDefinition = new StringBuilder();

        if (map.containsKey("invoice") && !map.get("invoice").isEmpty()) {
            String invoice = map.get("invoice");
            invoiceSpecification = invoiceSpecification.and(InvoiceSpecification.titleContains(invoice));
            filterDefinition.append("&invoice=").append(invoice);
        }
    }

    public Specification<Invoice> getInvoiceSpecification() {
        return invoiceSpecification;
    }

    public StringBuilder getFilterDefinition() {
        return filterDefinition;
    }

}
