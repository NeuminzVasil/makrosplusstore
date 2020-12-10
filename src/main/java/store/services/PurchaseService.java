package store.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import store.entities.Invoice;
import store.entities.Purchase;
import store.exceptions.SearchingNotFoundException;
import store.repositories.PurchaseRepository;

import java.util.List;


@Service
public class PurchaseService {

    private PurchaseRepository purchaseRepository;

    public PurchaseService() {
    }

    @Autowired
    public PurchaseService(PurchaseRepository purchaseRepository) {
        this.purchaseRepository = purchaseRepository;
    }

    /**
     * получить все товары
     *
     * @param spec     спецификация для фильтра
     * @param pageable - страница для фильтра
     * @return Page<Nomenclature>
     */
    public Page<Purchase> findAll(Specification<Purchase> spec, Pageable pageable) {
        return purchaseRepository.findAll(spec, pageable);
    }

    /**
     * получить все товары
     *
     * @return List<Purchase>
     */
    public List<Purchase> findAll() {
        return purchaseRepository.findAll();
    }

    /**
     * метод поиска покупки по ID purchase
     *
     * @param id - искомое ID
     * @return - ссылка на товар или исключение
     */
    public Purchase findById(Long id) {
        return purchaseRepository.findById(id).orElseThrow(() -> new SearchingNotFoundException("Не могу найти покупку с id =" + id));
    }

    /**
     * Сохранить Purchase и Invoice в BD
     * @param purchase purchase
     * @param invoice invoice
     * @return Invoice
     */
    public Invoice save(Purchase purchase, Invoice invoice) {
        purchase.setInvoice(invoice);
        purchaseRepository.save(purchase);
        return invoice;
    }

    /**
     * Сохранить элементы Purchase в BD
     *
     * @return
     */
    public Purchase save(Purchase purchase) {
        purchaseRepository.save(purchase);
        return purchase;
    }

    public void deleteById(long id) {
        purchaseRepository.deleteById(id);
    }

    public void deleteAll(List<Purchase> purchaseList) {
        purchaseRepository.deleteAll(purchaseList);
    }
}
