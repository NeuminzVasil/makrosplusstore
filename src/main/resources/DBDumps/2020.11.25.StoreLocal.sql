PGDMP     .    ;             
    x            makrosfactory    12.2    12.2 *    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Z           1262    13318    makrosfactory    DATABASE     �   CREATE DATABASE makrosfactory WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE makrosfactory;
                postgres    false            [           0    0    DATABASE makrosfactory    COMMENT     S   COMMENT ON DATABASE makrosfactory IS 'default administrative connection database';
                   postgres    false    2906                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            \           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    16546    authorities    TABLE     �   CREATE TABLE public.authorities (
    id bigint NOT NULL,
    customerid bigint NOT NULL,
    authority character varying(50) NOT NULL
);
    DROP TABLE public.authorities;
       public         heap    postgres    false            �            1259    16432 
   categories    TABLE     �   CREATE TABLE public.categories (
    id bigint NOT NULL,
    category character varying(50) NOT NULL,
    parentid bigint NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    16396 	   customers    TABLE     �   CREATE TABLE public.customers (
    id bigint NOT NULL,
    login character varying(80) NOT NULL,
    firstname character varying(40),
    lastname character varying(40),
    password character varying(255),
    active boolean DEFAULT false NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16394    customers_id_seq    SEQUENCE     y   CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    204            ]           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    203            �            1259    24940    history_id_seq    SEQUENCE     w   CREATE SEQUENCE public.history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.history_id_seq;
       public          postgres    false            �            1259    24927 	   histories    TABLE     �   CREATE TABLE public.histories (
    id bigint DEFAULT nextval('public.history_id_seq'::regclass) NOT NULL,
    submitdate timestamp with time zone NOT NULL,
    customerid bigint NOT NULL,
    invoiceid bigint NOT NULL,
    stepid bigint
);
    DROP TABLE public.histories;
       public         heap    postgres    false    214            ^           0    0    TABLE histories    COMMENT     Y   COMMENT ON TABLE public.histories IS 'история выполнения заказа';
          public          postgres    false    213            �            1259    16556    invoices_id_seq    SEQUENCE     x   CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.invoices_id_seq;
       public          postgres    false            �            1259    16482    invoices    TABLE     �  CREATE TABLE public.invoices (
    id bigint DEFAULT nextval('public.invoices_id_seq'::regclass) NOT NULL,
    datacreate timestamp with time zone,
    department character varying(20),
    comment text,
    ordernumber character varying(50),
    senttoapprove boolean,
    senttopurchase boolean,
    invoicenumber character varying,
    totalprice double precision,
    resolveddate timestamp with time zone,
    customerid bigint,
    senttoprice boolean DEFAULT false
);
    DROP TABLE public.invoices;
       public         heap    postgres    false    210            �            1259    16594    nomenclatures_id_seq    SEQUENCE     }   CREATE SEQUENCE public.nomenclatures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.nomenclatures_id_seq;
       public          postgres    false            �            1259    16450    nomenclatures    TABLE     �  CREATE TABLE public.nomenclatures (
    id bigint DEFAULT nextval('public.nomenclatures_id_seq'::regclass) NOT NULL,
    comment text NOT NULL,
    price double precision,
    manufacturer character varying(50),
    nomenclature character varying(255) NOT NULL,
    code character varying(20),
    submitdate timestamp with time zone,
    expireddate timestamp with time zone,
    categoryid bigint
);
 !   DROP TABLE public.nomenclatures;
       public         heap    postgres    false    211            �            1259    16597    purchases_id_seq    SEQUENCE     y   CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.purchases_id_seq;
       public          postgres    false            �            1259    16512 	   purchases    TABLE     i  CREATE TABLE public.purchases (
    id bigint DEFAULT nextval('public.purchases_id_seq'::regclass) NOT NULL,
    invoiceid bigint NOT NULL,
    nomenclatureid bigint NOT NULL,
    count smallint,
    approver character varying(255),
    resolvingdate timestamp with time zone,
    comment text,
    buyingprice double precision,
    commentnumenclature text
);
    DROP TABLE public.purchases;
       public         heap    postgres    false    212            �            1259    25083    stepcomments_id_seq    SEQUENCE     |   CREATE SEQUENCE public.stepcomments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.stepcomments_id_seq;
       public          postgres    false            �            1259    25075    stepcomments    TABLE       CREATE TABLE public.stepcomments (
    id bigint DEFAULT nextval('public.stepcomments_id_seq'::regclass) NOT NULL,
    customerid bigint NOT NULL,
    comment text NOT NULL,
    attachedfileid bigint,
    historyid bigint NOT NULL,
    submitdate timestamp with time zone
);
     DROP TABLE public.stepcomments;
       public         heap    postgres    false    219            �            1259    25072    steps_id_seq    SEQUENCE     u   CREATE SEQUENCE public.steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.steps_id_seq;
       public          postgres    false            �            1259    25067    steps    TABLE     �   CREATE TABLE public.steps (
    id bigint DEFAULT nextval('public.steps_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255)
);
    DROP TABLE public.steps;
       public         heap    postgres    false    217            �            1259    25053 
   warehouses    TABLE     �   CREATE TABLE public.warehouses (
    id bigint NOT NULL,
    nomenclatureid bigint NOT NULL,
    count bigint,
    location character varying(50)
);
    DROP TABLE public.warehouses;
       public         heap    postgres    false            �
           2604    25056    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204            �
           2606    16555    authorities auni 
   CONSTRAINT     \   ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT auni UNIQUE (customerid, authority);
 :   ALTER TABLE ONLY public.authorities DROP CONSTRAINT auni;
       public            postgres    false    209    209            �
           2606    16436    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    205            �
           2606    16401    customers customer_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.customers DROP CONSTRAINT customer_pkey;
       public            postgres    false    204            �
           2606    24934    histories history_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.histories
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.histories DROP CONSTRAINT history_pkey;
       public            postgres    false    213            �
           2606    16528    invoices invoice_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.invoices DROP CONSTRAINT invoice_pkey;
       public            postgres    false    207            �
           2606    25058     nomenclatures nomenclatures_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.nomenclatures
    ADD CONSTRAINT nomenclatures_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.nomenclatures DROP CONSTRAINT nomenclatures_pkey;
       public            postgres    false    206            �
           2606    16521    purchases purchases_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.purchases DROP CONSTRAINT purchases_pkey;
       public            postgres    false    208            �
           2606    25082    stepcomments stepcomments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.stepcomments
    ADD CONSTRAINT stepcomments_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.stepcomments DROP CONSTRAINT stepcomments_pkey;
       public            postgres    false    218            �
           2606    25071    steps steps_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.steps DROP CONSTRAINT steps_pkey;
       public            postgres    false    216            �
           2606    25060    warehouses warehouses_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.warehouses DROP CONSTRAINT warehouses_pkey;
       public            postgres    false    215            �
           2606    25086    stepcomments customer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stepcomments
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id) NOT VALID;
 D   ALTER TABLE ONLY public.stepcomments DROP CONSTRAINT customer_fkey;
       public          postgres    false    204    218    2751            �
           2606    16549    authorities customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id);
 E   ALTER TABLE ONLY public.authorities DROP CONSTRAINT customerid_fkey;
       public          postgres    false    2751    204    209            �
           2606    33119    stepcomments history_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stepcomments
    ADD CONSTRAINT history_fkey FOREIGN KEY (historyid) REFERENCES public.histories(id) NOT VALID;
 C   ALTER TABLE ONLY public.stepcomments DROP CONSTRAINT history_fkey;
       public          postgres    false    2763    213    218            �
           2606    16534    purchases invoiceid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES public.invoices(id) NOT VALID;
 B   ALTER TABLE ONLY public.purchases DROP CONSTRAINT invoiceid_fkey;
       public          postgres    false    208    2757    207            �
           2606    24935    histories invoiceid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.histories
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES public.invoices(id) NOT VALID;
 B   ALTER TABLE ONLY public.histories DROP CONSTRAINT invoiceid_fkey;
       public          postgres    false    207    2757    213           