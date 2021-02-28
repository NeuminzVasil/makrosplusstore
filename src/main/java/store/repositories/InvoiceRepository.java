package store.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import store.entities.Invoice;
import store.entities.dto.InvoiceShort;

import java.util.List;

public interface InvoiceRepository extends JpaRepository<Invoice, Long>, JpaSpecificationExecutor<Invoice> {
    List<InvoiceShort> findAllBy();


/*    @Query(value =  "select invoices.* from invoices", nativeQuery=true)
    List<InvoiceShort> getAll2();*/

    @Query(value = "select invoices.id, " +
            "invoices.comment, " +
            "invoices.totalprice, " +
            "invoices.datacreate, " +
            "invoices.department, " +
            "invoices.resolveddate, " +
            "invoices.ordernumber " +
            "from invoices " +
            "inner join purchases on invoices.id = purchases.invoiceid " +
            "inner join nomenclatures on nomenclatures.id = purchases.nomenclatureid " +
            "inner join customers on invoices.customerid = customers.id " +
            "where purchases.nomenclatureid = :nomenclatureID",
            nativeQuery=true)
    List<InvoiceShort> getInvoicesByNomenclatureID(@Param("nomenclatureID") Long nomenclatureID);

}
