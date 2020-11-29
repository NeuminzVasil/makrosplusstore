package store.entities.dto;

import java.util.Date;

public interface InvoiceShort {
    Long getid();

    Date getDatacreate();

    String getDepartment();

    String getComment();

    String getOrdernumber();

    Long getTotalprice();

    Date getResolveddate();
}