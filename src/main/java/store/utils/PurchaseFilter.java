package store.utils;

import org.springframework.data.jpa.domain.Specification;
import store.entities.Purchase;
import store.specifications.PurchaseSpecification;

import java.util.Map;

public class PurchaseFilter {
    private final StringBuilder filterDefinition;
    private Specification<Purchase> purchaseSpecification;

    public PurchaseFilter(Map<String, String> map) {

        this.purchaseSpecification = Specification.where(null);

        this.filterDefinition = new StringBuilder();

        if (map.containsKey("purchase") && !map.get("purchase").isEmpty()) {
            String purchase = map.get("purchase");
            purchaseSpecification = purchaseSpecification.and(PurchaseSpecification.titleContains(purchase));
            filterDefinition.append("&purchase=").append(purchase);
        }
        if (map.containsKey("purchaseid") && !map.get("purchaseid").isEmpty()) {
            Integer purchaseId = Integer.parseInt(map.get("purchaseid"));
            purchaseSpecification = purchaseSpecification.and(PurchaseSpecification.purchaseIdEquals(purchaseId));
            filterDefinition.append("&purchaseid=").append(purchaseId);
        }

    }

    public Specification<Purchase> getPurchaseSpecification() {
        return purchaseSpecification;
    }

    public StringBuilder getFilterDefinition() {
        return filterDefinition;
    }

}
