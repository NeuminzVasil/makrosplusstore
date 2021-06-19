create sequence histories_id_seq;
alter sequence histories_id_seq owner to postgres;

create table histories
(
    id         bigint default nextval('histories_id_seq'::regclass) not null
        constraint history_pkey
            primary key,
    submitdate timestamp with time zone                             not null,
    customerid bigint                                               not null,
    invoiceid  bigint                                               not null
        constraint invoiceid_fkey
            references invoices,
    stepid     bigint
);

comment on table histories is 'история выполнения заказа';


INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (1, '2020-11-20 11:03:45.065000', 1, 1554, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (3, '2020-12-01 07:25:14.855000', 1, 1538, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (4, '2020-12-01 07:26:16.769000', 1, 15, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (5, '2020-12-01 07:26:55.309000', 1, 1513, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (6, '2020-12-01 07:27:40.405000', 1, 1511, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (7, '2020-12-01 07:27:47.191000', 1, 1511, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (8, '2020-12-01 07:27:55.397000', 1, 1511, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (9, '2020-12-01 07:28:50.903000', 1, 1534, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (10, '2020-12-01 07:28:59.089000', 1, 1534, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (11, '2020-12-01 07:43:06.362000', 1, 1538, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (12, '2020-12-01 08:04:09.759000', 1, 1537, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (13, '2020-12-01 08:04:19.862000', 1, 1537, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (14, '2020-12-01 08:04:57.600000', 1, 1545, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (15, '2020-12-01 08:05:49.643000', 1, 1547, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (16, '2020-12-01 08:08:26.122000', 1, 1549, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (17, '2020-12-01 08:09:21.005000', 1, 1550, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (18, '2020-12-01 08:09:38.041000', 1, 1551, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (19, '2020-12-01 08:10:26.231000', 1, 1552, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (20, '2020-12-01 08:11:39.267000', 1, 1553, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (21, '2020-12-01 12:53:42.723000', 18, 1553, 2);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (22, '2020-12-01 13:00:07.396000', 18, 1552, 2);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (23, '2020-12-03 09:44:36.485000', 17, 1547, 3);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (24, '2020-12-03 10:24:27.767000', 17, 1537, 4);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (25, '2020-12-03 10:25:25.496000', 17, 1553, 4);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (26, '2020-12-03 10:25:31.962000', 17, 1554, 4);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (57, '2020-12-08 09:07:02.534000', 17, 1511, 4);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (58, '2020-12-09 23:24:41.438000', 1, 1538, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (59, '2020-12-09 23:25:46.377000', 1, 1538, 8);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (60, '2020-12-09 23:25:48.776000', 1, 1538, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (61, '2020-12-09 23:25:51.029000', 1, 1538, 10);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (62, '2020-12-09 23:27:11.943000', 1, 1513, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (63, '2020-12-09 23:27:17.758000', 1, 1513, 8);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (64, '2020-12-09 23:27:21.051000', 1, 1513, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (65, '2020-12-09 23:27:23.632000', 1, 1513, 10);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (66, '2020-12-09 23:28:04.552000', 1, 1534, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (67, '2020-12-09 23:28:07.418000', 1, 1534, 8);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (68, '2020-12-09 23:28:09.977000', 1, 1534, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (69, '2020-12-09 23:28:12.845000', 1, 1534, 10);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (72, '2020-12-10 19:57:56.656000', 1, 1556, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (73, '2020-12-10 20:23:36.124000', 1, 1557, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (74, '2020-12-10 20:29:14.915000', 1, 1558, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (75, '2020-12-17 05:17:27.216000', 1, 1554, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (76, '2020-12-17 06:43:43.106000', 1, 1537, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (77, '2020-12-17 06:47:03.340000', 1, 1537, 8);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (78, '2020-12-17 06:47:08.276000', 1, 1537, 10);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (79, '2020-12-17 06:47:09.600000', 1, 1537, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (80, '2020-12-17 07:00:11.808000', 1, 1553, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (81, '2020-12-17 07:00:29.578000', 1, 1553, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (82, '2020-12-17 07:35:43.707000', 1, 1547, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (83, '2020-12-17 07:40:44.233000', 1, 1547, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (84, '2020-12-17 08:06:53.249000', 1, 18, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (85, '2020-12-17 08:07:08.392000', 1, 18, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (86, '2020-12-17 08:07:22.986000', 1, 18, 10);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (87, '2020-12-17 08:14:13.879000', 1, 15, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (88, '2020-12-17 08:21:10.139000', 1, 1545, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (89, '2020-12-17 08:21:41.287000', 1, 1545, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (90, '2020-12-17 08:23:18.508000', 1, 1549, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (91, '2020-12-17 08:23:37.238000', 1, 1549, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (92, '2020-12-17 09:05:00.106000', 1, 1558, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (93, '2020-12-17 09:08:18.683000', 1, 1511, 10);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (95, '2021-01-31 08:25:32.171000', 1, 1552, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (96, '2021-01-31 09:04:13.303000', 1, 1513, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (97, '2021-02-01 10:18:42.420000', 1, 1560, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (99, '2021-02-15 13:09:13.132000', 1, 1551, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (100, '2021-02-15 14:34:19.985000', 1, 1557, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (101, '2021-03-24 18:00:28.066000', 1, 1550, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (102, '2021-03-24 18:14:28.113000', 1, 1556, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (98, '2021-01-30 06:33:03.406000', 1, 1560, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (103, '2021-04-06 08:56:24.646000', 1, 1560, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (104, '2021-04-06 09:00:09.208000', 1, 1560, 8);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (105, '2021-04-06 09:00:14.798000', 1, 1560, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (106, '2021-04-06 09:11:35.734000', 1, 1556, 8);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (107, '2021-04-06 09:11:58.885000', 1, 1556, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (108, '2021-04-06 10:42:57.643000', 1, 1550, 8);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (109, '2021-04-06 10:43:19.015000', 1, 1550, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (110, '2021-04-07 11:39:56.577000', 1, 1524, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (111, '2021-04-07 11:40:02.349000', 1, 1524, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (112, '2021-04-07 11:41:35.755000', 1, 1524, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (114, '2021-04-07 14:40:51.677000', 1, 1526, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (115, '2021-04-07 14:40:55.236000', 1, 1526, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (116, '2021-04-07 14:40:59.173000', 1, 1526, 7);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (117, '2021-04-07 14:41:23.441000', 1, 1526, 8);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (118, '2021-04-07 14:41:28.594000', 1, 1526, 9);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (119, '2021-04-07 14:41:34.256000', 1, 1526, 10);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (120, '2021-04-17 12:04:48.037000', 1, 1523, 6);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (121, '2021-04-17 12:05:56.609000', 1, 1523, 10);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (122, '2021-05-25 14:26:58.848000', 1, 1563, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (123, '2021-05-25 14:34:54.613000', 1, 1564, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (124, '2021-05-25 14:37:01.234000', 1, 1566, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (125, '2021-05-25 14:39:43.749000', 1, 1565, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (126, '2021-05-30 17:32:45.951000', 1, 1567, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (127, '2021-06-17 04:42:36.599000', 1, 1568, 1);
INSERT INTO public.histories (id, submitdate, customerid, invoiceid, stepid) VALUES (128, '2021-06-17 04:42:47.708000', 1, 1568, 6);