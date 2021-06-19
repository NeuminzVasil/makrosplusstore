

create table steps
(
    id          bigint default nextval('steps_id_seq'::regclass) not null
        constraint steps_pkey
            primary key,
    name        varchar(50)                                      not null,
    description varchar(255)
);

INSERT INTO public.steps (id, name, description) VALUES (2, 'внутренний закуп: заказ оплачен производителю', 'Пункт доступен только Макрос+. На этом этапе Макрос покупает товар у производителя. Должна быть приложена платежка Макроса для ДНС');
INSERT INTO public.steps (id, name, description) VALUES (3, 'внутренний закуп: отгружен в Транспортную Компанию', 'Пункт доступен только Макрос+.  Приложить ТТНку доставки от производителя к Макросу.');
INSERT INTO public.steps (id, name, description) VALUES (1, 'заявка согласована', 'Генеральный заказчик (WFT) подтверждает согласование цены закупа. Нужно указать адрес достаки товара.');
INSERT INTO public.steps (id, name, description) VALUES (4, '(опционлално) Хранение на складе в Макросе', 'когда заказчик забирает товра самостоятельно из офиса Макрос +');
INSERT INTO public.steps (id, name, description) VALUES (5, '(опционально) Логистика до офиса заказчика', 'На тот случай если товар отправлен заказчику но он его не принял');
INSERT INTO public.steps (id, name, description) VALUES (6, 'отгружен заказчику', 'Дата отгрузки товара заказчику . Приложить скан отгрузочного документа.');
INSERT INTO public.steps (id, name, description) VALUES (7, 'СчетФактура сформирована', 'Бухгалтер прилагает №СФ номер и №накладной . с подписью Макроса');
INSERT INTO public.steps (id, name, description) VALUES (8, 'СчетФактура направлена заказчику', 'СФ отправлено заказчику - Номер почтового трекинга');
INSERT INTO public.steps (id, name, description) VALUES (9, 'СчетФактура принята заказчиком', 'Бухгалтерия Заказчика прилагает скан №СФ номер и №накладной  подписаную своей стороной');
INSERT INTO public.steps (id, name, description) VALUES (10, 'СчетФактура оплачена', 'СФ оплачена (сделать визуальный маркер грядущей даты оплаты) + скан документа Платежного поручения.');