create sequence stepcomments_id_seq;
alter sequence stepcomments_id_seq owner to postgres;

create table stepcomments
(
    id             bigint default nextval('stepcomments_id_seq'::regclass) not null
        constraint stepcomments_pkey
            primary key,
    customerid     bigint                                                  not null
        constraint customer_fkey
            references customers,
    comment        text                                                    not null,
    attachedfileid bigint,
    historyid      bigint                                                  not null
        constraint history_fkey
            references histories,
    submitdate     timestamp with time zone
);


INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (32, 1, 'Док станция HP 3005pr - невозможна к поставке', null, 57, '2020-12-09 23:20:51.802000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (15, 1, 'Принять решение о получени докстанций. Обсуждалось с Глуховой Е.А. Ожидаю решение. ', null, 8, '2020-12-01 07:28:06.913000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (13, 1, 'Не получены только клавиатуры', null, 4, '2020-12-01 07:26:42.834000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (14, 1, 'Не получены только переходники. закупка переходников обсуждалась с Макарусь Митей. Модель описана в заказе', null, 5, '2020-12-01 07:27:09.350000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (17, 1, 'Предлагаю скорректировать приобретение батареек следующим образом: 
DELL Latitude 5480 - 1 шт (2 из 3 уже получил. жду ещё одну)
Latitude 6430\6420 заменить на DELL Latitude 5480  - 7 шт', null, 10, '2020-12-01 07:32:51.835000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (20, 1, 'Не получены только мониторы', null, 13, '2020-12-01 08:04:39.000000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (21, 1, 'Обратить внимание на мониторы Необходимы именно тачскрин мониторы. Модель указана в теле заказа. В случае проблем с закупом - предварительно обсудить с Никититиным', null, 15, '2020-12-01 08:06:53.012000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (22, 1, 'Модель закаупаемого принтера HP 8730', null, 20, '2020-12-01 08:12:16.978000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (23, 1, 'Прошу уточнить адрес доставки?', null, 20, '2020-12-01 12:49:12.769000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (24, 18, 'Какие сроки поставки?', null, 20, '2020-12-01 12:50:30.792000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (25, 1, 'Срок поставки обычный (не строчный). Адрес доставки Ноябрьск', null, 20, '2020-12-01 12:51:21.590000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (26, 18, 'Ждем отгрузку поставщиком', null, 22, '2020-12-01 13:01:26.035000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (27, 1, 'Товар на складе? могу забрать?', null, 26, '2020-12-04 20:15:36.887000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (28, 1, 'не отгружены только батарейки для ноутбуков', null, 3, '2020-12-05 12:52:05.083000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (29, 1, 'не отгружены только батарейки для ноутбуков', null, 9, '2020-12-05 12:52:28.225000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (18, 1, 'Предлагаю скорректировать приобретение батареек следующим образом: 
DELL Latitude 6430\6420 - 4 шт.
DELL Latitude 6230 \ 6230S - 2 шт.
DELL Latitude 5470 - 1 шт. (получено 08 12 2020 в офисе постащика Никитиным П.)', null, 11, '2020-12-01 07:44:24.521000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (30, 1, 'получена одна батарейка для 5470 вместо  E6220. Ожидаю ещё две батарейки e6220 и четыре e6430', null, 11, '2020-12-08 13:28:29.423000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (31, 1, 'Док станция HP UltraSlim 2013 - прибыло на склад', null, 57, '2020-12-09 23:20:28.430000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (37, 1, 'просим предоставить товар', null, 72, '2020-12-10 19:58:38.265000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (38, 1, 'Просим предоставить товар', null, 73, '2020-12-10 20:23:45.551000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (39, 1, 'Просим предоставить товар', null, 74, '2020-12-10 20:29:22.670000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (40, 1, 'Принято 2 монитора HP 24y 23.8 HP [2YV10AA]', null, 75, '2020-12-17 05:17:41.616000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (42, 1, 'оставил в Ноябрьске на складе для отправки в Радужный.', null, 75, '2020-12-17 06:19:18.227000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (43, 1, 'Мониторы получены. заявка закрыта', null, 13, '2020-12-17 06:43:34.125000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (47, 1, 'Получены 4 картиджа из 10.', null, 81, '2020-12-17 07:01:08.882000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (48, 1, '4 картриджа переданы в FF2 флот с принтером.', null, 81, '2020-12-17 07:01:34.988000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (49, 1, 'СФ №167', null, 80, '2020-12-17 07:01:58.014000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (50, 1, 'Получено в полном объеме', null, 82, '2020-12-17 07:36:00.312000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (54, 1, 'SSD Диски реализованы', null, 82, '2020-12-17 07:43:18.539000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (53, 1, 'Три монитора оставлены в Ноябрьске для передачи в Уренгой  RMM Костылеву Александру', null, 82, '2020-12-17 07:43:02.348000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (55, 1, 'СФ №125', null, 84, '2020-12-17 08:07:05.835000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (56, 1, 'Принято в полном объеме', null, 85, '2020-12-17 08:07:19.850000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (52, 1, 'СФ №168', null, 83, '2020-12-17 07:42:39.706000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (57, 1, 'Клавиатуры получены. Оставил на хранение в Ноябрьске. Думаю выдавать или нет.', null, 4, '2020-12-17 08:10:17.299000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (58, 1, 'Счет-фактура №130 от 28.09.2020', null, 87, '2020-12-17 08:14:26.352000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (60, 1, 'Счет-фактура №172 от 11.12.2020', null, 89, '2020-12-17 08:21:48.858000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (61, 1, 'Получено в полном объеме', null, 90, '2020-12-17 08:23:33.180000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (62, 1, 'Счет-фактура №171 от 11.12.2020', null, 91, '2020-12-17 08:23:49.947000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (63, 1, 'один комплект передан в FF4 Через Макарова Константина', null, 90, '2020-12-17 08:30:36.128000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (46, 1, 'Получен принтер. HP 8730 S\N CN99BD604X', null, 81, '2020-12-17 07:00:45.846000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (64, 1, 'Получена одна Док станция HP UltraSlim 2013', null, 92, '2020-12-17 09:05:25.834000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (65, 1, 'Внимание! по данной заявке докстанции получены. Закрытие заявки будет выполнено по согласованию с Никитиным И Глуховой', null, 8, '2020-12-17 09:07:35.140000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (136, 1, '№79 от 17.06.2020', null, 59, '2021-04-07 05:56:54.812000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (59, 1, 'получено: Усилитель Titan-5B (LED) - 1 шт
и антенна GSM/3G/4G BRIG (Круговая, 8 дБ) получены. - 1 шт', null, 88, '2020-12-17 08:21:38.299000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (137, 1, '№79 от 17.06.2020', null, 60, '2021-04-07 05:56:59.416000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (66, 1, 'Внимание! по данной заявке докстанции получены. Закрытие заявки будет выполнено по согласованию с Никитиным И Глуховой', null, 6, '2020-12-17 09:08:04.574000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (67, 1, 'Внимание! по данной заявке докстанции получены. Закрытие заявки будет выполнено по согласованию с Никитиным И Глуховой', null, 7, '2020-12-17 09:08:08.729000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (68, 1, 'Внимание! по данной заявке докстанции получены. Закрытие заявки будет выполнено по согласованию с Никитиным И Глуховой', null, 57, '2020-12-17 09:08:13.832000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (70, 1, 'Получена батарейка батарейка для 5470 - 1 шт. (для никитина)', null, 10, '2020-12-17 09:48:17.191000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (72, 1, 'второй комплект передал Костылеву для FF3 арктикгаз', null, 90, '2021-01-01 09:52:50.506000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (74, 1, 'TK-5150K Черный - прошу закупить как можно скорее', null, 72, '2021-01-31 08:23:55.842000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (75, 1, '953XL \ 957XL (F6U19AN) Черный - прошу закупить как можно скорее', null, 20, '2021-01-31 08:24:40.161000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (76, 1, 'GSM/3G/4G BRIG (Круговая, 8 дБ) - 1 шт получено. Получал Никитин. Выдавал Неделько', null, 95, '2021-01-31 08:25:48.833000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (77, 1, 'itan-5B (LED) - 1 шт получено. Получал Никитин. Выдавал Неделько', null, 95, '2021-01-31 08:25:57.354000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (78, 1, 'Ожидаю ещё три комплекта', null, 95, '2021-01-31 08:31:30.102000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (79, 1, 'Прошу не перепутать с картриджами серии TK-5280', null, 17, '2021-01-31 08:37:17.670000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (80, 1, 'Получена батарейка батарейка для 5480 - 3 шт.', null, 10, '2021-01-31 08:49:43.040000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (81, 1, 'Касательно последней позиции по данной заявке. Модель батарейки замена на DELL 5480. Получил 3 шт. Жду от Мити решения можм ли получить ещё 4 шт.', null, 10, '2021-01-31 08:59:32.193000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (82, 1, 'Получил все позиции, кроме переходника. Отсутствует возможность поставки данного товара.', null, 96, '2021-01-31 09:05:16.130000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (83, 1, 'СФ №107 от 2019 года оплачена', null, 7, '2021-02-01 09:30:24.327000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (84, 1, 'СФ 175 от 12.2020 выставлена ошибочно. Просим аннулировать ее и не учитывать ее в актах сверки', null, 7, '2021-02-01 09:31:58.065000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (85, 1, 'Монитор закупаем вот такой https://www.dns-shop.ru/product/6fa526623f283332/238-monitor-hp-24m-3wl46aa/', null, 74, '2021-02-01 10:00:14.721000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (86, 1, 'Док станция HP UltraSlim 2013 - Получил Никитин 2020.12.15', null, 97, '2021-02-01 10:19:10.403000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (87, 1, 'Заявка согласована. Прошу срочно заказать  Термотрмоэтикетки и  TK-8115K Черный', null, 98, '2021-02-03 06:33:45.392000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (88, 1, 'Док станция HP UltraSlim 2013 - поставлена ранее. (возвращаю мой долг) закупка уже проведена', null, 98, '2021-02-03 06:34:14.021000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (89, 18, 'картридж TK-5150 закупаем один оригинальный второй любой аналог например https://www.xcom-shop.ru/nvp_tk5150y_576677.html  или  https://www.xcom-shop.ru/nvp_tk5150bk_576675.html', null, 72, '2021-02-05 05:38:49.335000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (90, 1, 'Получено черных -8, красных -4 шт, синий - 6 шт, желтый - 6шт', null, 99, '2021-02-15 13:10:23.858000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (91, 1, 'Ожидаю черных -2 шт и красных - 2 шт', null, 99, '2021-02-15 14:18:13.058000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (92, 1, 'Получены еще 6 картиджей из 10. выполнено в полном объеме.', null, 81, '2021-02-15 14:21:15.459000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (93, 1, 'Получено в полном объеме', null, 100, '2021-02-15 14:34:33.391000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (98, 1, 'получено: Back-UPS 500VA - 3 шт', null, 88, '2021-03-24 16:20:43.385000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (96, 1, 'получено: Устройство громкой связи', null, 88, '2021-03-24 16:20:09.111000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (111, 1, 'Получно: TK-8115C Голубой - 1 шт', null, 97, '2021-03-24 18:19:34.535000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (97, 1, 'получено: DisplayPort - HDMI 1.8 - 6 шт (получены переходники DisplayPort-DVI)', null, 88, '2021-03-24 16:20:17.628000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (99, 1, 'Получено TK-5270 - комплект картриджей получен. Заявка закрыта', null, 101, '2021-03-24 18:00:45.662000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (100, 1, 'Получено черных 2 шт. Красных - 2 шт. Заявка закрыта', null, 99, '2021-03-24 18:06:08.411000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (101, 1, 'Получено GSM/3G/4G BRIG (Круговая, 8 дБ) - 3 шт', null, 95, '2021-03-24 18:10:41.324000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (102, 1, 'Получено: Titan-5B (LED) - 3 шт', null, 95, '2021-03-24 18:10:55.140000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (103, 1, 'Получено: DYMO S0721510 - 10 шт', null, 102, '2021-03-24 18:14:39.275000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (104, 1, 'Получено DYMO S0721610 - 10 шт', null, 102, '2021-03-24 18:14:50.674000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (105, 1, 'Получено: TK-5150K Черный - 1 шт', null, 102, '2021-03-24 18:15:36.664000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (110, 1, 'Получено: TK-8115K Черный - 2шт', null, 97, '2021-03-24 18:19:34.535000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (112, 1, 'Получено: TK-8115M Пурпурный - 1 шт.', null, 97, '2021-03-24 18:19:34.535000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (113, 1, 'Получено: TK-8115Y Желтый - 1 шт', null, 97, '2021-03-24 18:19:34.535000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (115, 1, 'Получено 953XL \ 957XL (F6U19AN) Черный - 6', null, 97, '2021-04-06 08:55:53.721000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (116, 1, 'Заявка закрыта', null, 97, '2021-04-06 08:56:00.504000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (117, 1, '27-п от 19 марта 2021', null, 105, '2021-04-06 09:00:43.188000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (118, 1, '27-п от 19 марта 2021', null, 104, '2021-04-06 09:00:51.263000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (125, 1, '28-п 06 апреля 2021', null, 106, '2021-04-06 09:11:54.619000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (126, 1, '28-п 06 апреля 2021', null, 107, '2021-04-06 09:12:06.958000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (128, 1, '26-п 19 марта 2021', null, 108, '2021-04-06 10:43:15.614000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (129, 1, '26-п 19 марта 2021', null, 109, '2021-04-06 10:43:22.472000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (114, 1, 'Получено: Термотрмоэтикетки - 50 шт', null, 97, '2021-04-06 08:55:43.443000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (119, 1, 'Получено: 131A (CF210A) - один комплект', null, 102, '2021-04-06 09:07:00.471000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (124, 1, 'Получено: 312A (CF380A) - два комплекта', null, 102, '2021-04-06 09:08:38.581000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (127, 1, 'Получено: 305A (CE410A) Черный - 2 шт.', null, 102, '2021-04-06 09:16:48.528000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (130, 1, 'По общей договоренности все товары по данной заявке считаем полученными.', null, 10, '2021-04-07 05:28:39.876000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (131, 1, 'Заявка закрыта', null, 10, '2021-04-07 05:28:49.405000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (132, 1, '№81 от 17.06.2020', null, 67, '2021-04-07 05:47:21.864000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (133, 1, '№81 от 17.06.2020', null, 68, '2021-04-07 05:47:38.137000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (134, 1, '№81 от 17.06.2020', null, 69, '2021-04-07 05:47:42.237000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (135, 1, '№79 от 17.06.2020', null, 58, '2021-04-07 05:56:49.969000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (138, 1, '№79 от 17.06.2020', null, 61, '2021-04-07 05:57:03.923000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (19, 1, 'Варианты батареек которые меня устроят:
DELL Latitude 5480 - https://www.komus.ru/katalog/tekhnika/kompyutery-i-periferiya/aksessuary-dlya-elektronnykh-i-mobilnykh-ustrojstv/akkumulyatory-dlya-noutbukov/akkumulyator-dlya-noutbuka-li-ion-dell-battery-4-cell-68w-hr-451-bbzg-/p/1245825/?from=block-123-7 

DELL Latitude 5470 - https://www.batterika.ru/catalog/show/4849/

DELL Latitude 6430\6420 - https://www.batterika.ru/catalog/show/5689/ 

DELL Latitude 6230 \ 6230S https://www.batterika.ru/catalog/show/5607/ ', null, 11, '2020-12-01 07:58:08.944000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (94, 1, 'Общим решением принято: заказываем батарейки на DELL Latitude 5480 - 3 шт.  Обсуждалось и с Дмитрием Николаевичем и в общем чате. Получаем три батарейки на 5480 и закрываем заявку', null, 11, '2021-04-07 00:00:00.000000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (139, 1, 'Товар получен', null, 111, '2021-04-07 11:40:09.681000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (140, 1, '295 от 11.11.2019', null, 112, '2021-04-07 11:41:38.998000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (142, 1, '228 - 3 сентября 2019', null, 116, '2021-04-07 14:41:17.123000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (143, 1, '228 - 3 сентября 2019', null, 117, '2021-04-07 14:41:25.367000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (144, 1, '228 - 3 сентября 2019', null, 118, '2021-04-07 14:41:31.626000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (145, 1, '228 - 3 сентября 2019', null, 119, '2021-04-07 14:41:37.139000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (146, 1, 'Передано Деженину в Уренгой', null, 100, '2021-04-08 08:45:40.942000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (147, 1, 'DYMO S0721510 , DYMO S0721610 Передано на склад ноябрьск через Сиренко Татьяну', null, 102, '2021-04-08 08:46:22.847000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (148, 1, 'Малых -7 шт Все выданы.', null, 120, '2021-04-17 12:05:10.078000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (149, 1, 'больших 10 шт. Все выданы.', null, 120, '2021-04-17 12:05:30.691000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (150, 1, 'диски вставлены в компы при монтаже', null, 120, '2021-04-17 12:05:46.487000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (151, 1, 'Заявка согласована.', null, 122, '2021-05-25 14:27:14.907000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (152, 1, 'Заявка согласована', null, 123, '2021-05-25 14:35:04.278000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (153, 1, 'Просим предоставить товар', null, 126, '2021-05-30 17:32:57.389000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (154, 1, 'Просим предоставить товар', null, 124, '2021-05-30 17:36:21.220000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (155, 1, 'Заявка срочная. Прошу ускориться на сколько это возможно.', null, 124, '2021-05-30 17:36:56.400000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (156, 1, 'Yaroshenko, Sergey Y - ГНКТ2 - передать один комплект', null, 124, '2021-06-02 10:54:25.420000');
INSERT INTO public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) VALUES (157, 1, 'Товар получен. Прошу педоставить СФ', null, 128, '2021-06-17 04:43:09.007000');