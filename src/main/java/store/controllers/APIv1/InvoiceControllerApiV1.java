package store.controllers.APIv1;

import org.springframework.web.bind.annotation.*;
import store.entities.Invoice;
import store.services.InvoiceService;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/invoice")
public class InvoiceControllerApiV1 {

    private final InvoiceService invoiceService;

    public InvoiceControllerApiV1(InvoiceService invoiceService) {
        this.invoiceService = invoiceService;
    }

    /**
     * на страницу счетфактур
     *
     * @return invoice.html
     * @Model model - служебный параметр для передачи данных на форму
     * @RequestParam Map<String, String> params - пареметры получаемые от формы
     */
    @GetMapping
    public List<Invoice> getAllInvoices(@RequestParam Map<String, String> params) {
        return invoiceService.findAll();
    }

    @GetMapping("/{id}")
    public Invoice getInvoicesById(@PathVariable Long id) {
        return invoiceService.findById(id);
    }

    @PutMapping("/add")
    public Invoice putInvoiceToDB(@RequestBody Invoice invoice) {
        invoiceService.save(invoice);
        return invoice;
    }

    @PutMapping("/edit")
    public Invoice editInvoice(@RequestBody Invoice invoice) {
        invoiceService.edit(invoice);
        return invoice;
    }

    @PutMapping("/edit/deletePurchase/{id}")
    public void deleteInvoicePurchase(@PathVariable Long id) {
        invoiceService.deletePurchaseById(id);
    }

    @PostMapping("/delete")
    public Invoice deleteInvoice(@RequestBody Invoice invoice) {
        invoiceService.delete(invoice);
        return invoice;
    }

}
