package store.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import store.entities.Invoice;
import store.entities.dto.InvoiceShort;
import store.exceptions.SearchingNotFoundException;
import store.repositories.InvoiceRepository;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;


@Service
public class InvoiceService {

    private InvoiceRepository invoiceRepository;
    private PurchaseService purchaseService;

    @Autowired
    public InvoiceService(InvoiceRepository invoiceRepository, PurchaseService purchaseService) {
        this.invoiceRepository = invoiceRepository;
        this.purchaseService = purchaseService;
    }

    public InvoiceService() {
    }

    /**
     * получить все СФ широкий формат в виде страницы
     *
     * @param spec     - спецификация для фильтра
     * @param pageable - страница для фильтра
     * @return Page<Invoice>
     */
    public Page<Invoice> findAll(Specification<Invoice> spec, Pageable pageable) {
        return invoiceRepository.findAll(spec, pageable);
    }

    /**
     * получить все СФ широкий формат в виде листа
     *
     * @return Page<Nomenclature>
     */
    public List<Invoice> findAll() {
        return invoiceRepository.findAll().
                stream()
                .sorted(Comparator.comparing(Invoice::getDatacreate).reversed())
                .collect(Collectors.toList());
    }

    /**
     * найти СФ по ID
     *
     * @param id - искомое ID
     * @return - ссылка на СФ или исключение
     */
    public Invoice findById(Long id) {
        return invoiceRepository.findById(id).orElseThrow(() -> new SearchingNotFoundException("Не могу найти заказ с id =" + id));
    }

    private Invoice getCopy(Invoice invoice) {
        Invoice invoiceToSave = new Invoice();
        invoiceToSave.setOrdernumber(invoice.getOrdernumber());
        invoiceToSave.setDatacreate(invoice.getDatacreate());
        invoiceToSave.setDepartment(invoice.getDepartment());
        invoiceToSave.setComment(invoice.getComment());
        invoiceToSave.setInvoicenumber(invoice.getInvoicenumber());
        invoiceToSave.setTotalprice(invoice.getTotalprice());
        invoiceToSave.setResolveddate(invoice.getResolveddate());
        invoiceToSave.setCustomer(invoice.getCustomer());

        return invoiceToSave;
    }

    /**
     * Сохранить СФ и его элементы в BD
     *
     * @param invoice - Invoice
     * @return - ссылка на сохраненный СФ
     */
//    @Secured("ROLE_ADMIN")
    public Invoice save(Invoice invoice) {

        // сохраняем invoice без элементов чтобы получить invoice.ID
        Invoice invoiceTemp = invoiceRepository.save(getCopy(invoice));

        // сохраняем все товары в новый invoice
        invoice.getPurchases().forEach(purchase ->
                purchaseService.save(purchase, invoiceRepository.getOne(invoiceTemp.getId())));

        return invoiceRepository.findById(invoiceTemp.getId()).orElseThrow(() ->
                new SearchingNotFoundException("Не могу найти invoice с id =" + invoiceTemp.getId()));
    }

    /**
     * Изменить СФ
     *
     * @param invoice - Invoice
     * @return - ссылка на сохраненный СФ
     */
//    @Secured("ROLE_ADMIN")
    public Invoice edit(Invoice invoice) {
        return invoiceRepository.saveAndFlush(invoice);
    }

    /**
     * удалить Invoice и все елементы
     *
     * @param invoice - удаляемый invoice
     */
    @Secured("ROLE_ADMIN")
    public void delete(Invoice invoice) {
        // сначала удаляем все товары в заказе из БД.
        purchaseService.deleteAll(invoice.getPurchases());
        invoiceRepository.delete(invoice);
    }

    /**
     * Удалить Purchase из Invoice по ID
     *
     * @param id удаляемого Purchase
     */
    @Secured("ROLE_ADMIN")
    public void deletePurchaseById(Long id) {
        purchaseService.deleteById(id);
    }

    public List<InvoiceShort> getDtoData() {
        return invoiceRepository.findAllBy();
    }

    @Secured("ROLE_ADMIN")
    public List<InvoiceShort> getInvoicesByNomenclatureID(Long nomenclatureID) {
        return invoiceRepository.getInvoicesByNomenclatureID(nomenclatureID);
    }
}
