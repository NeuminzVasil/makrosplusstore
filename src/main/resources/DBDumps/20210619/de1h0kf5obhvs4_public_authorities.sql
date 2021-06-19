create table authorities
(
    id         bigint      not null
        constraint authorities_pkey
            primary key,
    customerid bigint      not null
        constraint customerid_fkey
            references customers,
    authority  varchar(50) not null,
    constraint auni
        unique (customerid, authority)
);


INSERT INTO public.authorities (id, customerid, authority) VALUES (1, 1, 'ROLE_ADMIN');
INSERT INTO public.authorities (id, customerid, authority) VALUES (2, 2, 'ROLE_GUEST');
INSERT INTO public.authorities (id, customerid, authority) VALUES (3, 3, 'ROLE_GUEST');
INSERT INTO public.authorities (id, customerid, authority) VALUES (4, 4, 'ROLE_GUEST');
INSERT INTO public.authorities (id, customerid, authority) VALUES (5, 5, 'ROLE_GUEST');
INSERT INTO public.authorities (id, customerid, authority) VALUES (6, 1, 'ROLE_TEST');
INSERT INTO public.authorities (id, customerid, authority) VALUES (7, 17, 'ROLE_GUEST');
INSERT INTO public.authorities (id, customerid, authority) VALUES (8, 16, 'ROLE_GUEST');
INSERT INTO public.authorities (id, customerid, authority) VALUES (9, 18, 'ROLE_GUEST');