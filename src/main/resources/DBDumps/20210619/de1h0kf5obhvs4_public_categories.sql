create table categories
(
    id       bigint      not null
        constraint categories_pkey
            primary key,
    category varchar(50) not null,
    parentid bigint      not null
);

INSERT INTO public.categories (id, category, parentid) VALUES (1, 'без категории', 1);
INSERT INTO public.categories (id, category, parentid) VALUES (2, 'компьютеры', 1);
INSERT INTO public.categories (id, category, parentid) VALUES (3, 'сотовые телефоны', 1);
INSERT INTO public.categories (id, category, parentid) VALUES (4, 'переферийные устройства', 2);
INSERT INTO public.categories (id, category, parentid) VALUES (5, 'МФУ', 4);
INSERT INTO public.categories (id, category, parentid) VALUES (6, 'расходные материалы для МФУ', 5);