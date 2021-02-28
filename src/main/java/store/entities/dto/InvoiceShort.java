package store.entities.dto;

import java.util.Date;

public interface InvoiceShort {
    Long getid();

    String getOrdernumber();

    String getComment();

    Long getTotalprice();

    String getDepartment();

    Date getDatacreate();

    Date getResolveddate();
}