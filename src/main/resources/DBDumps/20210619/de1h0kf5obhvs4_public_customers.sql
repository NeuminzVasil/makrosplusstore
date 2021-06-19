create table customers
(
    id        bigserial             not null
        constraint customer_pkey
            primary key,
    login     varchar(80)           not null,
    firstname varchar(40),
    lastname  varchar(40),
    password  varchar(255),
    active    boolean default false not null
);

INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (2, 'cLogin02', 'Dmitry', 'Starshov', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', true);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (3, 'cLogin03', 'Oleg', 'Rizaev', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', true);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (4, 'cLogin04', 'Dmitry', 'Kharlanov', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', true);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (5, 'cLogin05', 'Andrey', 'Zavyalov', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', true);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (6, 'cLogin06', 'Andrey', 'Deryushev', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', true);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (7, 'CTF123', 'CTF123', 'CTF123', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (8, 'CTF1', 'CTF1', 'CTF1', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (9, 'CTF2', 'CTF2', 'CTF2', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (10, 'CTF3', 'CTF3', 'CTF3', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (11, 'FF123456', 'FF123456', 'FF123456', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (12, 'FF1', 'FF1', 'FF1', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (13, 'FF2', 'FF2', 'FF2', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (14, 'FF3', 'FF3', 'FF3', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (15, 'FF4', 'FF4', 'FF4', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', false);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (16, 'info@makrosplus.ru', 'info', 'makrosplus.ru', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', true);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (1, 'Petr.Nikitin2@weatherford.com', 'Петр', 'Никитин', '$2y$12$KDvYdm4m5Je.SFQRJsPhNO2811Eyj1f0MXoSwuTsdQi/47Pn8iBua', true);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (17, 'zaerova@makrosplus.ru', 'Людмила', 'Заерова', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', true);
INSERT INTO public.customers (id, login, firstname, lastname, password, active) VALUES (18, 'spb@makrosplus.ru', 'Дмитрий', 'Макарусь', '$2y$12$RwJcgigHCNlqZLepp/Mm5OXDHkWqhrqFKnIDdL17.R3o9iXXY3iGC', true);