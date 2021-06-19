create table warehouses
(
    id             bigint not null
        constraint warehouses_pkey
            primary key,
    nomenclatureid bigint not null,
    count          bigint,
    location       varchar(50)
);

