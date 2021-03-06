PGDMP     /    "                y            de1h0kf5obhvs4     12.5 (Ubuntu 12.5-1.pgdg16.04+1)    12.2 ;    ^           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            _           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            `           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            a           1262    8845032    de1h0kf5obhvs4    DATABASE     �   CREATE DATABASE de1h0kf5obhvs4 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE de1h0kf5obhvs4;
                vyunydlrwviido    false            b           0    0    DATABASE de1h0kf5obhvs4    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE de1h0kf5obhvs4 FROM PUBLIC;
                   vyunydlrwviido    false    3937                        2615    8845440    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                vyunydlrwviido    false            c           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO vyunydlrwviido;
                   postgres    false    678            �            1259    8845442    authorities    TABLE     �   CREATE TABLE public.authorities (
    id bigint NOT NULL,
    customerid bigint NOT NULL,
    authority character varying(50) NOT NULL
);
    DROP TABLE public.authorities;
       public         heap    vyunydlrwviido    false    7            �            1259    8845445 
   categories    TABLE     �   CREATE TABLE public.categories (
    id bigint NOT NULL,
    category character varying(50) NOT NULL,
    parentid bigint NOT NULL
);
    DROP TABLE public.categories;
       public         heap    vyunydlrwviido    false    7            �            1259    8845448 	   customers    TABLE     �   CREATE TABLE public.customers (
    id bigint NOT NULL,
    login character varying(80) NOT NULL,
    firstname character varying(40),
    lastname character varying(40),
    password character varying(255),
    active boolean DEFAULT false NOT NULL
);
    DROP TABLE public.customers;
       public         heap    vyunydlrwviido    false    7            �            1259    8845452    customers_id_seq    SEQUENCE     y   CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          vyunydlrwviido    false    7    204            d           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          vyunydlrwviido    false    205            �            1259    9991019    histories_id_seq    SEQUENCE     y   CREATE SEQUENCE public.histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.histories_id_seq;
       public          vyunydlrwviido    false    7            �            1259    9991021 	   histories    TABLE     �   CREATE TABLE public.histories (
    id bigint DEFAULT nextval('public.histories_id_seq'::regclass) NOT NULL,
    submitdate timestamp with time zone NOT NULL,
    customerid bigint NOT NULL,
    invoiceid bigint NOT NULL,
    stepid bigint
);
    DROP TABLE public.histories;
       public         heap    vyunydlrwviido    false    213    7            e           0    0    TABLE histories    COMMENT     Y   COMMENT ON TABLE public.histories IS 'история выполнения заказа';
          public          vyunydlrwviido    false    214            �            1259    8845454    invoices_id_seq    SEQUENCE     x   CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.invoices_id_seq;
       public          vyunydlrwviido    false    7            �            1259    8845456    invoices    TABLE     �  CREATE TABLE public.invoices (
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
       public         heap    vyunydlrwviido    false    206    7            �            1259    8845464    nomenclatures_id_seq    SEQUENCE     }   CREATE SEQUENCE public.nomenclatures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.nomenclatures_id_seq;
       public          vyunydlrwviido    false    7            �            1259    8845466    nomenclatures    TABLE     �  CREATE TABLE public.nomenclatures (
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
       public         heap    vyunydlrwviido    false    208    7            �            1259    8845473    purchases_id_seq    SEQUENCE     y   CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.purchases_id_seq;
       public          vyunydlrwviido    false    7            �            1259    8845475 	   purchases    TABLE     i  CREATE TABLE public.purchases (
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
       public         heap    vyunydlrwviido    false    210    7            �            1259    9991025    stepcomments_id_seq    SEQUENCE     |   CREATE SEQUENCE public.stepcomments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.stepcomments_id_seq;
       public          vyunydlrwviido    false    7            �            1259    9991027    stepcomments    TABLE       CREATE TABLE public.stepcomments (
    id bigint DEFAULT nextval('public.stepcomments_id_seq'::regclass) NOT NULL,
    customerid bigint NOT NULL,
    comment text NOT NULL,
    attachedfileid bigint,
    historyid bigint NOT NULL,
    submitdate timestamp with time zone
);
     DROP TABLE public.stepcomments;
       public         heap    vyunydlrwviido    false    215    7            �            1259    9991034    steps_id_seq    SEQUENCE     u   CREATE SEQUENCE public.steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.steps_id_seq;
       public          vyunydlrwviido    false    7            �            1259    9991036    steps    TABLE     �   CREATE TABLE public.steps (
    id bigint DEFAULT nextval('public.steps_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255)
);
    DROP TABLE public.steps;
       public         heap    vyunydlrwviido    false    217    7            �            1259    9133715 
   warehouses    TABLE     �   CREATE TABLE public.warehouses (
    id bigint NOT NULL,
    nomenclatureid bigint NOT NULL,
    count bigint,
    location character varying(50)
);
    DROP TABLE public.warehouses;
       public         heap    vyunydlrwviido    false    7            �           2604    9991040    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          vyunydlrwviido    false    205    204            K          0    8845442    authorities 
   TABLE DATA           @   COPY public.authorities (id, customerid, authority) FROM stdin;
    public          vyunydlrwviido    false    202   �F       L          0    8845445 
   categories 
   TABLE DATA           <   COPY public.categories (id, category, parentid) FROM stdin;
    public          vyunydlrwviido    false    203   �F       M          0    8845448 	   customers 
   TABLE DATA           U   COPY public.customers (id, login, firstname, lastname, password, active) FROM stdin;
    public          vyunydlrwviido    false    204   �G       W          0    9991021 	   histories 
   TABLE DATA           R   COPY public.histories (id, submitdate, customerid, invoiceid, stepid) FROM stdin;
    public          vyunydlrwviido    false    214   ^I       P          0    8845456    invoices 
   TABLE DATA           �   COPY public.invoices (id, datacreate, department, comment, ordernumber, senttoapprove, senttopurchase, invoicenumber, totalprice, resolveddate, customerid, senttoprice) FROM stdin;
    public          vyunydlrwviido    false    207   vL       R          0    8845466    nomenclatures 
   TABLE DATA           �   COPY public.nomenclatures (id, comment, price, manufacturer, nomenclature, code, submitdate, expireddate, categoryid) FROM stdin;
    public          vyunydlrwviido    false    209   �\       T          0    8845475 	   purchases 
   TABLE DATA           �   COPY public.purchases (id, invoiceid, nomenclatureid, count, approver, resolvingdate, comment, buyingprice, commentnumenclature) FROM stdin;
    public          vyunydlrwviido    false    211   ӄ       Y          0    9991027    stepcomments 
   TABLE DATA           f   COPY public.stepcomments (id, customerid, comment, attachedfileid, historyid, submitdate) FROM stdin;
    public          vyunydlrwviido    false    216   x�       [          0    9991036    steps 
   TABLE DATA           6   COPY public.steps (id, name, description) FROM stdin;
    public          vyunydlrwviido    false    218   �       U          0    9133715 
   warehouses 
   TABLE DATA           I   COPY public.warehouses (id, nomenclatureid, count, location) FROM stdin;
    public          vyunydlrwviido    false    212   L�       f           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 15, true);
          public          vyunydlrwviido    false    205            g           0    0    histories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.histories_id_seq', 100, true);
          public          vyunydlrwviido    false    213            h           0    0    invoices_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.invoices_id_seq', 1560, true);
          public          vyunydlrwviido    false    206            i           0    0    nomenclatures_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.nomenclatures_id_seq', 610, true);
          public          vyunydlrwviido    false    208            j           0    0    purchases_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.purchases_id_seq', 3868, true);
          public          vyunydlrwviido    false    210            k           0    0    stepcomments_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.stepcomments_id_seq', 93, true);
          public          vyunydlrwviido    false    215            l           0    0    steps_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.steps_id_seq', 1, false);
          public          vyunydlrwviido    false    217            �           2606    8845484    purchases assetelements_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT assetelements_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.purchases DROP CONSTRAINT assetelements_pkey;
       public            vyunydlrwviido    false    211            �           2606    8845488    authorities auni 
   CONSTRAINT     \   ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT auni UNIQUE (customerid, authority);
 :   ALTER TABLE ONLY public.authorities DROP CONSTRAINT auni;
       public            vyunydlrwviido    false    202    202            �           2606    8845490    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            vyunydlrwviido    false    203            �           2606    8845492    customers customer_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.customers DROP CONSTRAINT customer_pkey;
       public            vyunydlrwviido    false    204            �           2606    9991042    histories history_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.histories
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.histories DROP CONSTRAINT history_pkey;
       public            vyunydlrwviido    false    214            �           2606    8845486    invoices invoice_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.invoices DROP CONSTRAINT invoice_pkey;
       public            vyunydlrwviido    false    207            �           2606    8996816     nomenclatures nomenclatures_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.nomenclatures
    ADD CONSTRAINT nomenclatures_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.nomenclatures DROP CONSTRAINT nomenclatures_pkey;
       public            vyunydlrwviido    false    209            �           2606    9991044    stepcomments stepcomments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.stepcomments
    ADD CONSTRAINT stepcomments_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.stepcomments DROP CONSTRAINT stepcomments_pkey;
       public            vyunydlrwviido    false    216            �           2606    9991046    steps steps_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.steps DROP CONSTRAINT steps_pkey;
       public            vyunydlrwviido    false    218            �           2606    9133720    warehouses warehouses_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.warehouses DROP CONSTRAINT warehouses_pkey;
       public            vyunydlrwviido    false    212            �           2606    9991047    stepcomments customer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stepcomments
    ADD CONSTRAINT customer_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id) NOT VALID;
 D   ALTER TABLE ONLY public.stepcomments DROP CONSTRAINT customer_fkey;
       public          vyunydlrwviido    false    3769    204    216            �           2606    8845493    authorities customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id);
 E   ALTER TABLE ONLY public.authorities DROP CONSTRAINT customerid_fkey;
       public          vyunydlrwviido    false    204    3769    202            �           2606    9991052    stepcomments history_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stepcomments
    ADD CONSTRAINT history_fkey FOREIGN KEY (historyid) REFERENCES public.histories(id) NOT VALID;
 C   ALTER TABLE ONLY public.stepcomments DROP CONSTRAINT history_fkey;
       public          vyunydlrwviido    false    216    3779    214            �           2606    8845498    purchases invoiceid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES public.invoices(id) NOT VALID;
 B   ALTER TABLE ONLY public.purchases DROP CONSTRAINT invoiceid_fkey;
       public          vyunydlrwviido    false    211    3771    207            �           2606    9991057    histories invoiceid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.histories
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES public.invoices(id) NOT VALID;
 B   ALTER TABLE ONLY public.histories DROP CONSTRAINT invoiceid_fkey;
       public          vyunydlrwviido    false    3771    214    207            K   M   x�3�4���q�wt����2�4�p�C]�C��9���&�&�\SNSd�̨Ϝ��Yւ���o�ih�̏���� _!d      L   �   x�-���@C��W�8��X��p�oZ��2���B~GfWn��$�LpG������U0H����`���"��Z��X�\C�Y�ޥ�D���M�B0�B2��9F�;���0F�^r-�p�B7B���<����	nyL�:���n镺]��=��o      M   �  x����o�0�����9�N�֍�u@�B��j����$��ĺ��S��i��6��~��4�RC���>�gK	�I��XT���,�"b�����
�=���i�,��t�8:���=��\�b��D/\�������l<����&$�U��:�!�&T[�K�.���D$��)i�D��\�UF}�VʵRv����׿�:4/Z[��:5��^���5MU��k� �Vqq�S�σ.�jW����+]�V��+]�Q��+]�,����A�"}܂�4�!����,a>YS��TL���	A~���|򳼗�>�Q��2��.���65G��a;��>n �,{��ճ1�Ӌ�;gGv}5�Ӕ�uPD�W����c~+��_*�܂� �j���#��W��6 ^�>L�+Ҋ3�� ?����7���m�^7�i�_��O      W     x�m�M��:���U��������u<��N��R�>�s8���~���Cp��_�Ef�EC~)�A�F?�R;)��t��A|�U�=3<���N���g=���(JZ��b�B͑;�!$�����,#l�:�8A&/�*�oX�&�]�y�'F	���}�>1s��v��v�M�z�S_%�E)�gI��|��`�t2l,����BY�I�a�]��¸0��Cx��Z[�oV�fp~�4���@%��yq�ܢ�|�T���~��['�u��	Z��)�+�t��������W�|rB����{DuآE���v�P�<��eq�����S�X���r��(ea��1��>,Ǥ'fe�5@pL�9/y!/{�0����[,X]N�X��h��r���k&������A�c�����b��rz. �k_�C�!��`��W稂<k��0��fG�����]L�'���cف�tv�_�#��(��W`��v��a��P�`>�w�, �P1<>P��aݐ��%�T��A��_~�%K|=1N0_�9�7L���xJ��!�XaR9�fp�V�U)��73=�a;��$�P�O�2�	U��7�j��_���1UL�	՚����*d8|�|$�`W�k��n�'&e3Y�:����݆��̺);]tƕ1���Wk����L/����y��˵�FVa����L�,z���E�EI�V�G@�'�^��'F��Y�5�J,�oB�q��^_�L��`��?�2�p      P   �  x��[[��~�b�Z���t��(@�bo�ช*׆lW��"��i�q
����vRyIJ�h�a��Kr�鞋fz$�q`]Ț�����|�;��r�YG0�L�O�X�~V���_J�μ!��dg�d���l8ݜ^�nf�l;{�M���l7;��n'"{�����kg�gO�������\�����4�"��r9�T޹v�k��u�Ȼ"mE5�${8�������dz/ɾ˞�a6X�l��\���I6��u�az�7��ӭlx�7����2�pƤ���.71��������oo\]��ƉN����p���d�7x1 c�� {��=wq�]X�v6L������������h�d��xl�b`U ˺B���lt��	x·	�q?{�hn܃dz#b{�9u����cNYGrfuZvy�,@s�����?��@[h���k���mz{�F� o�=�	�ݢ�f{٤�B�`f��׎wSlpQ�3�O���Ul
�O>� �w�,=�:�ӛp�Vî�(R��1�.BǗ@��{=w����X!�x�����J	]�8Oc�X	����~� :�7�`��n�g���l(Y�u�ǰ���#����D[����p���G6�,��E
�q��<����@�\�����_�2���T)�d�e"{P��h�Hm� ޑ�Vag�b0���\�Ef�q���&O�~`]����Wt�����<�0�� Q��2Ղ<@�KA�vqw(��l\s�~�aD�V�^���aN��{�M9L�{b��>D��q7L�R�5��fO1����ͺw'�Q�&�ў�d�1&]�4+/��K�vx�����0�FN�=(lM���>��6i}(I������6?�֔��]�m��>�=��Wĝ'ӻ�w���|K�Ȕ��Vj�d�pYR<�&�趂!2�Zn�ǖdOk����@��1�%���r�rN�/��K[x,�
�d@�Z7t��9q�L�� D	C�3ϜG�f�$�������`���{D�cZ"|�������,֫0nx�U���s�p��A+����
�)���M�e���X�BpŜP��<���bߠ8��xB�����A�	A@�:Õn{p ��k������_����޽r	̚�� ���3��w@!� %A-J��m#�(��I9���k��ﱧ�	�CN���
�D��"���)!��0ݺ�'�����L��v��Hk�WF��Ku�q�O�ᩦq�`�R	��Jh�}��2^���7?M0S�c���=�P�L���Ѱ����rܕ���̪ G߄`<}�g�7 
������Bb�̦��*G�������uQ�΅[��36���\�Ll�|����,�2���[��������n a�cT��PA�lS��^<��T
��X������Bc���TmDצ��܍��:����M2�ܫ�<mY���s7OK�.�o٦W��E�K���>�VV�)ʉ�&��-u�,�;x6�'��M.l��~m�rr�<v�y�����]�p����ު��a�W�:G+�B�c�c��|��З�6��M��=�&~�>�������6�&�P*�3ظ30ST���HL�L�Z# (�J��c[�Ew e�@���Ym�\������j�����fxp��� �%�[�C)�]@�����8y1T��D=Ud����[8�d���t�Tu�V`̒� �7@Gb`��%�:`��JA����#J�!����׵Wj��9/��e�֍�.}��U
+�H֮\~�ҕ?P��>����ݜ���Y	�{H���b��2�f���B�͚H�[�;w-5!�y���3d*;Z���(j�T1K1w)U�D�G~�{6K�̻��gKU"3q�eΩqiEŷ��4�M9�e�G����f��0��q�,E4��6�4�g�%%O��vJ�c4���,0;�i�hE�PEfO���DƤ�i���
�{��	Z�F���<�c	�U`S��;�����6��Z���<�K�����c$��|ӱ��h������a(�R�8����:��7`�/AD�]����1����CF��E0�=��k-�h�
)6@�k0����K����ީ�&��P�͢*ҡr���6���5�}S�zlɅrN[���N��?�m9����r��)�4&kvz].�gy� �x��x���V�nv)E��H5ˊ���J��5���ùWgBE�Y{���e���2S�pO���DO��C}�����wWjл��	T�9t6��]��~@���G���:�ZN8�B�؁�u�mZ�l��)�.t��~Ft�E��Śʚ6p���ON|��3߯ݡ[0X�3�	:bL�H������6����2�y�gE5�Z��F[��4�nh~y��iѪ~P�(���|(G�J/�&օV�X�֢�� FV]KX�X,���ig��q�Ԫ�5G� ��6�>���gJ,uc}{��rEqu�K�a�u*R��ΥoyԼ5jŚ-����DR�37�q%���aw�\�E�=�~p�sv�p�.�����V�[̂�P�=C�1q����e�k\33|�
�.\9���1�z�3�4c����ںܒ��'��@L���DS)V���(�[��@�+�j4�6�l��9��l�CB���g��	py7<Z���D�1��b�����_f��6T'�{��4�2��N��pbcU^G��}��OO)MY�՗�$+>Q�C"ѩy��.�8E��T�Y��z��P5�G�kb��U�.�³G-��qIƟo_�b�	�&�yS>6��yoA�g���[��+1�Z��L~BH����G���{����m_螔ͭ�T��Lgg����~��˵s�Q�N�~�0u��	|�eH�s�L���O���{\�舀5y�O0��Ǟ'<x_��A,�Û��J8���,�C�l�'�g�K`m=��	�ݲ���7},�7�Wi�b��LUڮm%S��ކ�>f3�zU�_B9��2���0�՘��dJ����(�0pE��;ݻ��.:�9�+��%�	�O�@�D���v8������_S'��Q)9�ZU�#{~|�Z��<5FW|�+}4W��;6�ຍ���8�y�Ƞ4��S�<�.���2*���&N.��DO[�'��OB�Y�C�0 Jzm^Kg�`G�:��QŸw[.���`��}#b��������{��{Ԟڝި�且&(`X��DBmP�*�V����Cj��w}����˕dpy���.����� �N�%�G�3��v:_��lv�����n���.��i��x��������T�{��[����q���s�=�ъ4����5ɩ1T/�/��XY+s}������k�tY(*�,�y+��H����aJ��r��;o]�]ra����w�c\�k�?G�֦_�m��I%pY��,���v�|87V�>]ԟ.�������5����ө_����Q�d�{x?�����[dm���d��L���yxj~2�8G�����@�*�~�9i	�U����Y�e���ߐ�9�B����;��ڦC����_P�=�n����B�o<�
�ä=�x1�Xm��n����VW���J�V�ʀ�����f$�B�T\�Ӿ����?59�q�����7�3��K�KI5�i ���B��*�̌2i����xI&uJ��ԷP�x{!��N�ĉhc��'È�S���
9�6&Q�FEL"mr�Sт�[h�|�X�kӡ�=p󭢛��[��'��`[�:��CP��s�9o(s�9�g�.�꟟�P�gu�kFD*S�y%2)�?q�M�����L�x*�'{�ې�i�� �J1��F�ʴ�Ǭ�al���4��l��6i֚"�����@��h������K�sf�Vʤ������{5�P�v/���?nl�����f��jT Ō�=��jV�đ���U��d��E&����/�U�t�	��{�)%L�da���{G��Lu��      R      x��}msɑ�g̯(qH7l����_�1� �eDP�5c9 �1"  %�瘑�^_̮�>_�]�vw�޽��[������_�_��U�R�]��N�H�ѝY/Y�Ofee�A�����姗�.?�xq���?���M�\����&���9|����?��m�ַk���7�P��B��v��{��q���_�g�/�������nҜ�2�$y���/���I�p<=���'�w�����ƇѤWK��m���5NY�P�J�S��K)>&��,�?�����o�rJ��#����	�B\*Ѕ�tYz�x�5�KZ�K[�Y�i����E6����/?�MI��O��*�VY�����ԳJF̭d��'d�7�&D3��f�ɜ4mA�r!�+R��M;Sq]����Y�KV�R^��1ry��ĔW1���4'[p�غl� ���v�VW^�2�i<GqJ[�q),V��DI���Ƈ���V-�1.��5|K�Rq�b�>m(���ʕ
�x�Ur^��@�4�?�n(�G�be�6n�M@�"�U�
DXH����=6>�z.�>��G���"��QS��[���5�xe6�#�����F%���n��q�0	Pw6�j��1Z��@>�&}�u�8���2l#�e�=�e-ccS���5��t=j��-���dd$asm��1r��)���4�L� ,s�Ry�%s��-�@��Q�黬�&tC�	�,��DN3��.����)��>��Ґo�.Ҋ�h�Tpƃ��J��m'��I!�����ŀZ��57Б����L���� t�!�S^����f���/.�x����lv2}�^�����`68�-ON뇽Y�x�~O�G���l2�������i4�gGuƔ.�?�L�Sg<{��5�\h����F�{��(�k&�/pUr�:*�s����,��6=ߢ��s��S�R�B-��X���m�;&V~b����3�i�@ii�X,�ԤoQ?)	�j/�Y{z�b���W�E��W [0 ro�ϋV4u�G�-�����<`��y�﹮K�zѱӏ��8����wv2���9��aUY�վ�]k�;����Vg��� ^ �T$L��q�0P�W iS�	�� <W�~�ڔ�l�<�s�2�� ���g��F��2��� mbN{�췗?��9'j����3L���gا0�x�kr��u�������[�aTS�d�5�����	���G��@��PV��"B`�����T�<nM�����뺝���q�>w!�k�(��.�lmD�*�	̿Q«�.�AIF�y�;P���a���W˧1:����!`kJ��(a���~�sr�c�>g�A�	r~	w}���<n��2�����`A�A�f��i?JGΥ^����܄�O��O�	鞞���fc����!ͣ��!\~ �I+:>N	ٻS����_��b��I]��XHðnH���Ju���N8jx���t�r�B{
��k�H�O��|����ջ�.Y��	�$�����~mJ�Z�C6)�[��#kK@-����/p��$��3�]���J�e��VK)|5�/�_�,�%�vW�H��� ��A}�D|N)���`�������
Rs�%>���`���J|@�` ����NVV�Jo6�&gx��Jme[:���^���i?�GF�c��ǧΤwFv�^?���'���&��(���5CT�J`Q�����.��.���HɘJ��g�uE�@�4�L�ܼ�,���+X ��pz:zXˮ�	�8N� �D��`%�J�1��)���@MbEA�(����5�}�Ww"�H8$u�h�V����������1>��~@�w����t��qN�8���I��2>��7߁�\�{�s��m�j�6ۻ/����qoz� ��VN�5�\��K\^"��jA��(=/�������	��:�1���	?hR�=��;��f��#Wȍ�v�fB k���bhz#E�!�y�_h��<׺�>
R��5P�?W:?�G�Sh]���.�m�0����9(�W�1�k�b��F_���X���h,��n/��}��|��]��k��e#�ƹ��D(RS~�_���� uhC�|���s�(؉����B.�.}���)����6��#("�sQ[��˰<�Q��"�q�Ӵ�H�s�sE#��:$k�-�<>z0G�{A�;�G��(��d0;�D�}P��o��Q�H�`��� *Oo���ʋ+�MI�k ϔUyM�?8G�l�F���t4#7ҏ�'w������ ���7jj�=�p�9�+�{��T���
h�w�S��p��?�e�P�uc��td�1��0oYѢ��.Vݯ.�dP	J4�kde�a��,1�{�j���1h2E�B���@P`<cM��{����x�Ǐ����d6���xrV�n�qop�;8��g�Ƒ;��/�J� �>�k����Y��B�
���>�M�<I�O�gj��C�\*ǝ��@���\�L{���U�`��L��0*���P�\��6�xc�tn1Оk�u�Z�����+��m,|�?���/p�a���D���&ZrQO�OT��U\��p
+�����mw���4Ra�@y���O�/�-TM�ރ�~z2��丂��vxb����6���l�����{v�D�|@P�&M�a;/t��r�dh'����%	2f'(\���6H��M1��ߣ��m}l�A����a�
�v'���#t��v�ѣt�ˋo�k�Ն�)#����W��{�����TdW�A&8@c۸ZO>�{�:�Ǩ�ц �c�x�:T�&02�ϖM����U|���J����Ǫt��{^)�:{�E��ū%��kc���d��G�%�RhH͡�-+Z�F���Y�[m�;Q��+�����& �㕶�	�ܞ���3\�{.?��o��w��/�H�xgu�t��'�Xs�2�%Zxk�h_�*����ĨG��|�[�B��<�z+ǽ�G����#;�����M�����U�7�|/�lוh����q?W+x�\���J�0G��D������	D\��q$��t�}�a<�#n���~��K��"*�輢	���F+	������z�(����t��.�I��9���'��}��+���)�짰�(t�a+:j�;Ϥ��#oo�`�1MɺD���
�!����D8Kz��y=��Y�pO��_n���G�Y�� ���v�C��]@' ��&w��>�f����V�Ӳ=W�C.�-�mll��F�C�d7����`�Л1<�!�ug�y[��մ��Ng��&V4«���v����'�ݻ���(Y��R���xW�둓����!yЃ��Rv#S�t*��+o��sm5�	8'k�����YD��8;>�wo7��Av���-��.�]��lMp0�-�5 �K[w6��|t��p�vs�i����]I��\)�C�ֽ��T,�r�m�4:��H�;=&�5|$	&-ϭ�ar1IR$Q��jE��NR�	�Ofpj�_�]3.��Z�.�n�M=(�e��<�������������6��d;R�\��#�>SPf��d�х��<�Rc0ڱ5Cb�O�_�����9i���n���]���MÁw�Ƥy�Bo`�]�Y��~AbmY����`u�������w�9�B�������ת<q�6
���e���6�6
���(�5ǿ1�tzOI7:�H�\s8uª@-�Z��k��?U�o�/��0r�ѹ��5Fo��x{8@�,�W-d��&����aЗHjTn����g=8������_��|G�h�ݼY�0����t�����p\9�� qBy���~�����2�/Ej��{�wjp38��hHR�5t5�Hv�S{c ��F?�p��y*��\o(èA�����v��oJ6w��`+�����@�܆+���f2�m�%�S���w��q}0ַ��s��5��t'Q4r6ל���͍����tv7���q?�c�Y���Qoz��`]ً�ԫx��{k?
���'Ѿ    �sV~t+�%�p�_޹U���IU��,�k�l;��@V��j��>����>F��5��� ,��0ǳL04a�z�y�i��
��y׷��#� 6F�H���7��FDJ.I�-�)����<D�e\I�n�ߺ�q�7�����H���G����h�h�9;�щs��0�{=܍ �?$&[�(Yk�����ҜD�VG�ߛ�H� tW!̵6$\ۨ(\Q�4��=c�H�w�W�t%�0�11��g���m(��J�&&'����t��ÿ@&����s>~����̖������cl�~�?�٤j�����T��U4�Y�t�y[:Ɨv�ߥ�?b;9پB�+b�������e�n�=e�f�%&0 33 0��_��d�b����T�����⇻�Ȥ�]��m����7�]*޲	r�����&4��Ng��!�;�)X��j˪���~�E����a����,1��N�-�	���k��vB��lY�C0>�f�ĻU �{ͦ����1c���^�F����i��BF��\v���-﹩�N�X�0�)7YU�6�;���b��}3]#���6��t��YQ?����ekS`�!���ɸ"U@>Ȋǹ������P�qƣep3�	j���~x�$�DG�>(���~����O��������~�d:Ï�n��f�c3jhc��Η�|��ϱ9=��[S�OI�Q�O��Յ�ſ*��R�.�>��_);h�����-�'%+<��M�|3ʆ7Wp,e���s�ԱJ��?!�F��ӂa�|�)U�(�'ܭ��Fw�������?���P�-�2��2�����j�m|��! �;�%��;��ݛپa�{*�!}10�"q8�F��ع�h[��/n�(7B�NiY�	�
�f�^�?Z��2w���(y��7�ñㅔ9x�~p�!�	?<�ll;*��Y���h��D�����B�����dR~��݀�gB���3�.��>z��}�}������N�de�#6��n%��Y�6��&����SEz�D�@��#rk0#+i�ҋ�y&����R?��y��J�pq3�.mƴ��)����$�P������
��	��������+�C��⩖RP�P?Hh�\��j1��#{򬋧gtB`�vB��
����%i���v��y2��j��4�� �wΊي� |s��f��3�=ژA����8������k��J�d� 䦓�;���Q�$S�J>�>���h������I�Q�w+DZ�{Zp��]*R�~.��S�fn�T�L�p�#��o~;q����W �R��#��=9;�i9,t�����&�l$`)ʃ@�"���;|�F��{����l$�>������f1�x\}�N��/�^��D�(��]眸���3� :���hV���(̤d�;�^1�Z����z��M~�,k�Vtv0g��`�}��A I
)���,]�\JzΓ�dnKEkp�w�}x��b� �A}�"I��H�:�UH��EX����7��+�ԣ{�Y�ﯢ�WQ1c2��_�++���To(<�l)���ʞJ��i�
��ſ�Q��t2��Ծ^�rk��UE�s�q��T���1�	�E���M��_�z���1�����'�f�?��������77�?�n���Í��͵�C�,:��r��悳�T�L��|�Kd�����W��m��J~Uj��t�ӹ:#F����byZ�_!%�l�-f�-��P�	��ڬBl�40@��wn�;N�nj<U\8�	����I�i8k��uA��I�����F'0�,�C>���>�X=�9�Kv���~��{;O�%sQq(���P��W	lf�N����e��x��t� ��	���L��*X�qfN�lj&� W���s���N�27��wWT<L9����f�$lƯH%ĭ[�cA�tV�h�Fb;�1�[.�+I��1/�3��f�K�C�����&a�d�Z�0���&{�`�Ϩ2k,\��G1M%NMn9`l���4n�R	0]���y�]�/��4��]��||:(7�s|�������v��I�4&�Q=�+�a��xQ�0ba�8�_<�9�}�v���J8<rN`�L�H�p���쓚:��Z�W%�1���I	�������{�.������(�d�E����T�N��W<��Q���|��G,Ѓ[������\_0uHupp��`�K?=����s�~����>Z���j:5���̚�|���Ti0W`�X��Om��J�F�TJ�g)����$ε�����9t��8O�V�@ab��O�g�!O�X�A��������-�1��[h��/cҾ�<ˉ�X+W��}ih[s(,��Z=�F"��S��P�&YKU	��K��#]��м&yK!��B�#��M�D����fƥAZ0�ut��&e(�
Eũm�>M���Z��R��|�kd*f�"_�����R��?����T�E�.P}��E/���VW�f�*���l�l�270��s*e�� VTbn[�o{ia҂',j�,`b)���T�P3byPkMN�do4���,���ޠ���㌏��$�4.�#�X��O����~��hb� �JA���3P۬* �e��(�߱����/,Z�dd��2���8��3ZL�'���W-&�����7٦
팩䤴�N�Uq�_bdB���eqF��'��YN�,P�O_xIr��o@]���аa�k��z�A�_�,Ҷ�JS��3BZ�B���e���A/\��"��𔆏��?։mW�oN������D|�M���(ACz�^�E~*f%Ȭ�dY�'���N��a.��$�%�(k��+a�\��2���`nZ�K�).N�w	����R`��T��, /-���ԯB)��kK��,�/+�E5'C9KnYW]�>s��H�D`��Ídcc��`T���FM$�\�n+�04��4���Q��>U��|=>��5[������Y���E�g���
:UPS�@Wjg!�*Vd�+�d�Um�2b����{�0>j骒��U7� ����d�Vf�Sb�p��ܞ���`�Pݞ��
-��E&Į����ޏ�Z���������a���fjt1nbƪ���Bחm�s۞s�_�t}B6��xTS�:Up8�,U*�I�2(�lL�.���i�JD��nE}����O���G��}FCٹ��<�6����!�b.��A��Q6*�s��7q-|�i.���D/��`�yZJ��U���hJ6OG�	&i�X�:�gң�f�e � �f&aW�)�o�F�VS���Xy$C�
k�}���ZR�7H�0҆:�C�hIL�E6�?Sv���S"2���04�Ý����y�11>�0�yTC�(d1���kU������w�i��6B
��7礁l���������ao6�8HЩ����x�i����� p}�+�-�;t��5�5��IL�f�ף.D��A�5�e��l2>V���[E3�=F��h2��?�=�;X��x�a��a8�DHg�;|4T�L@�0M͢v�qS��!pgg�K���I���ٚ�!j�TV)W����T�=}�Ӽ�"���g�i�+��+��m�;.,�4&-�Ψﳴ���-G����:�
ܮ���zC���o�xI��7�ֆ��æS��'c��p�u8YC���5x�1��t^�OA��0ҵŘ���l6h��`M����1��Vt�4ԕ����&+���c�m�W��Ţ��P?�XD��`a��=?0�,">W���0�4����R�Q�bA��������u5}��s��d$�1��.�����͊8\S�q=���n��3��9t�d��e.�()�a8YT�ˑ���=E&�̤8芅9���X���B6�)/���x6e�b���_�Gn�P[	��w�Y��Y0S���8K�0��I$k��;<��1���a��%�< �����Ɩ8�20v��+l�x��P�l�ik#�n��h�����ߙ�ɜ��¿xA���ɸ�Zobm��<�M�X?�x�N����
u�V�ý���ږ�Q�j�ި5�>���T$ 4  ��I`44��l�%J�Xy+6�B��V|55���潾���oš��^4W�U�w�^���M36�CU��'q�u�;���b�\��ϒ��-���T���� Z�388���<<ĕ��`q���'��;]$%��H�aK�Q\MVW�2���Ha{�B�ڢ�  �ۑ	VXs�0���vp�<����.��
8�38X6�*8�2�9����hɹE�U���^ (�β�9��9�G�~}:��������z͗�0��ω�����)�\��i��^zk�޽8����������`��T�*5/�6iȪR�6��0���Vu*JM��[��CSO�P���W�=*�mYP؆w���X ��
A|6*��fA|OP��[�����=�%���g��r����������� �u��gѮ8`�v5Ȩs?@Pd�$>��Lզ��}�ǒ���g�P�3<Jo����%\�I�J�g!9��XM���u�V~6�,����Jź�ڞ ��%7��V����V�f��,��%_��/������4'ˁ(�4|Y�� }\��fz���c��i!X�Cx�;��Y��*��cf8���(������x�dE�L�kº	�p�+�ivi�F�f[�pg�~��u./7t��v�cx������7}�+&�XT�GY�tUE���=��C�ݤ�"\�q [�R��"*�ק�3�&����<=tz �}YX�"�MVDE�(��F�QO�����_���%E}�<��5���޾��8��g���M�����g'�Z�lY#f³�0�;]'�+�D�S���(﯑�*V��]��TE _���7f!:�R�}���Nz�?��OO��Ɂ��:��GIk���Q�>��'��}��xV@�h��@��¹]�]���������e�z��g��W�V��؂����=�Y�4Z#�X0r� a��T�5�Vy�Efs ����Z�0���s�|*�%ʳċx�tS�9ᾘLi��2�E&*�B���e�,����
B����Z`�,`���8�ȫ۠0g�gb�xX�3eZv��ǋ�T��V�_Ȗl-��1��ca�Y�񙀽��Z�Dc"y�0���D���Ҳ8��%�^sdv���Gd��q�9`㚺RK�Ll���*��H�v�����
,ӕFG�/���s�.2�,���Ǜ�3��3�6H�3�}��e���U���`�k�	>�~��k�͡�gdc��\\*�A�	��/��N0�(�k͠������:M��#�f����D�:V�4��'���
v���H���A�/��(g�@@+��j��͡�6���i�sh��,,�,/h>͠#�1s�-�Kr�%�U���"��sh��}���,�Eƛ�+({6ʋ�7�W��m�ovEE6?I��mll,a�DU���l���0�T}��1�l��G�:�`M����H����4�����N�ꊚ�#�ݨ��\�fޛdj���	9�Mf�A�aD�n��y��M�Q�C��o�_��7��~���}��7F�/q;<��3�@��;`��Hp%n���h4�]�a�H��D��-1<S�Y��W!ޔQ�=��^���ڟ�G��x2�3Hޗ�"XaD��\� 4�'I��4��1�J�V��t�)�����D�	�\�G���0`�`�_���P)l�W.A��Ŷ*HY��b�����qy�� +�V@ �+�ְ�����7]�#_6XW�'�$z̻w~Sc�W����
�j[�{<u*a@�P1�#;82��伪�F�dUM#������<I}���n��L�.ַ��MK�Xڙ�߂�
�VcMb���X}��"V�yW4Aݨ�P�L_����Z*c�",�ߥ����$o�[�v��Z]�����5rջy�	T�k�%��ܗ zX 5��wǧ�G��G@��%/�,X�U�	y "ɫ������a�/��,�r�Rg����6q�v��Q�6�R�L���{�+|��+���T�$���̋��z�&�7j��Y�m��d����H�g�xzO�g<�-���;�����      T      x��}�sǕ�3�W�־�e��')ْl�$�+2N9�*א� �@&�l�ko�kَ���q,ۛ|�}��(ѦnԿ0������s�A��lee����3}9}�m�,�X��UlӬX�W��fg���\kD�v���_5�*�����ex��e�����%�f!��W<��T�v��z���`\����}O��mr��a#�����!�o4[�"�U���A��������~�?�������G�;���p�~|d���6<r܏��Ô�-���@���l�Rysg���t���N�`,G�ݨ%D� O�A���� �������(%�J��_5Z[a�1\iG��`�������ވ6u�'%�crH�C�뻛�^��D��V�#~ޣ��6�G�O��~͈��_=ގ��?����9>6���+��G������<�РɄo�7?1��|xڈ������g����A��䦖~�%?1P~�e�W��"����~�->�7�a?����`�VމZ�Fs5B����������$)o++F�5|	�~ |=���o�F����࣊?hG=88��fs��՟?#',{�e��Sc�$_~��ir�K���'�ɵ��ĵP��c�k���/_f�?�����5%�_�����bZ3�&����0m�Iz'��?7}KH*߮�r����E��K;�ş-E�vs3"��B{3�;A��	��!j�n�y�<�=~�Xt��V������N](ɖU�������(�?�?�����N2�ǟ�ؾĶ4��)>��l&𡄷g�	u��HoE�z��]0.�l�;M��"�	���i���?SlKb�z�̟�$�7x[��3�w����U���.)o����fSon�I���Ia]p��b2�F+���~�(8J��Ţ �-ɬ�*�`������3��0�3ɫ܈n�շ`�_�C�|�-�+�v��s�����o�3С��ǆ�U1�/�#S3@�;���	�ʩ��mwA���� j��%c��v�
Q�,mw6�,������!o���KX���8|�!Z��/�2��w$�=
���Ю�v��Ihw�о����3`¤R�#B�V�78�n�����h>6�o�����[��_��/j���C\N "����7���-X�R2�d>C�v�������k?�qy<����'�a���#��� ��xF㗅h>�lw�qvΊ�P`X�rUC��`쐛�4� ���N�(�BsT��Y��I��F�����N2���th����8`�Q3z?~=��?�'�G��'8
���Opj����z�b)Kg�O�+�~�K�If���]�m��ٓ)�c�8�txVI|�_E߅��2o���p���6�&Dw��B~��fw��6����]� dW͒ų�:?��j��+���Q�\a�Xl O* ���$h�|	N$v;V���mE=r���~KWf�b[yhP\�E�Nw�������� ��JQQ����������3�r<��M�V@G+׀k�t���qi�\K�-�j�
Y�Ac!3!`ɒK7�+��^���C*�q��񑲒�J�ڒ�u�DI��#QW�ϑ���(ym{5⎘��/��S�N7�0%/�� ϟ| �{υ|(��ρ�c����t�a�yu�����#ōwVq,{#�� Kl��G����V�;�p$�����+1��o�`x#<;��1|�7[`0a`�M<#@�Kl�r3E������*��o�Y�����20���� �􅵵.�V++oE��Md:�`��zԪS��3�E�����C�?�/�ʅ�xl�����������֠���,X���+m�}UQ�� &��	�ld�9Ț��@�>���n�W_0�E��vܸ~}e��-Zs�yA��@�
%�}��s��f(%����!i�T�T-�h��~y��{�A%��h� ��nJ���_a�S����c^hocl��kŸޕ���_G;��v;�V������
���zwo����8�ݝn���	�Z����{�f�l�d�}����m�F4�ڻ���B��)?�$fU�uau}T�Fs�8]���)F��%���_j�o�H���3���k���*(R�޹`,�R"�O=�O���_��x�b*��~/Eg=��-�iGOݑ��,�]��jGP�U��if�&�]t ��	3���s�9��|{iP��6�M��������>`���VO��g=�
�D��_~��(�C������nt7>T_��N`�:�,����J�u�H]9=u��IS9��b�	�VRJ� 
��	J����%��2$�q�s
�V���.�d�f��r%-��ϖ�'I3'�KR��I��h�Mi�3n�9Oc�b(\d)�cJ�����ώ��TΈa�%�*�T=�n� v��� J,d h[t��<lo�y�ȥ�^��E+�nBÓ4p��4
�����:Vg���a͎F(h�x>��q*���u�:����Z�締�eqʣA
��cR(�<��  �S\e8������++**tע��~+s�'<Y�'�TY�z;\����'E?
w��w������~�<u�}*lE�L��V�#UT�1��G�)20F�S�� >�w�lI@����ا@w$�:?E��Gw%�:=eBt)N<����/c)�<�E�L�.�q6�uTC�Vwo���s�lg�v�MTث	�'��c#���'-a
pbG��08�¡0��N
��c��;���C�A�N��	$KY���]�O�/�,�_5�Xl�ղS�R[A!nG
wm�H�TΟ�³��z)?(�}�V�ޛ��,��1#��0�󢖳�$�3mY��%���S��(���c��������)�%q��p��q'ñ%�7�Xؔנq��N������

���v�}I�͊B )(˸�AA�r̃�	�@�St1Ά�\��81
rmcF�l(�U莆�)���`wb��#_���J�pه���F���b��R�M�#m����G�:�`hM�=!r.(�'�"�*,�*��(�rMB[X��v��Wyi�+�˩���J.!(<��P8aΘPL@�)?�-��������UX�)�+���<	fM̗`��1�dJ���`���,�`��`�)W>,��ɵO.�I����
�)#f�~�)W�Fխ}fzZ���'cj|�˗(:)
-{�GT�FPT�Q�R  �; K|�"Ϯ,�7UG/���k�`�K�@hd0�4`�H�KI1*�5���suQ$x�.��7e,��(�	�3��&�t��|]E:�uG�6[7Ӹ\JQ��L6e-�P�Pu&LX�0~�M�/�R��c7O����/����a�I��S�R >$K2���5�_��qЕ�����~@�v����H�@'S,�CPQ�*���c	X(�5�3��,�Q�	%{Ϛ1!ڥ�@ܩ�ҫw��k�R�z�A�
�	ÏRX[��y==XG�zS�u%�?UX_�������C3	�a�z�kpT��R��n���
�M�|�%�T�w)� D�?B���b�zh|���a���`�.-�ĩ�R�K� 텀S�ra��Nr��������3�>�1��-�5Ƀ�J��flI�H�쐺љ�'�i!�ћ"gԽ��r����L\�Z}�(�W��>��yԷu$rT*%�i�G��H5H��#�(�<.���N�H7�>���a�dv��oy&<��i� J��k�V�yum�ʥ��#�xؕ�.&a�,�0<�,�����<J{.�rN�����=�ኩFL�>+߷WV2�͓�t&_"gE$BxV�Pl;��.�r���v8�?�V�<�N��ٿQ�/������"��');���z�r��u�X�WN��-	������LR9�f&������>�Uً�1N�>��c,���o4})�Dߢ�S��d�ht+W�Vbf��JLkj��V�t@uJ�d: �	]�k��Itu�Ȅ�t�b%^���b�����Ʈn%m��J�|x��������    �pdK��V��u�TZ�,�����#��.(r#�ԫ����9X��������`Vϋ7���	l a�t� JXo���)a���Z|%�g��[B%Xѥ�Q|����3�t�?��?�u��@��ޣ��qZh��L,0ڄ׻����HHs��kL�#A��mN����,�5�U�O��q*Z��`G̋E[�B�N�x�lc%���S#�P����'s�QH�PMp��Г��S�19i'�[�b�h����
���N)w����|[ض�.S��?���O��"Ѐ�b�+>"g����${&�� ��FԏDT�?�s��?��Z��������o"k��dB<�y���,���r9!�B����v����ף�3�X�_�?�s�6?:%K�,8��H��7�9kT���"Zk�F�э �ܯ.�q�z�ҿ�[���AI�X��;I5ɦ�{acd�)�g�}TK9�9g��Q�yK^x��������N�b7f	��i����N�l��R�V��'ַ�R�ϴ��LT~��	g�>I�O��{&�Fy�}ޘ&-7E�R���C_���FĻ�����Q�J�i
h*��bպAT��a��g�x�ƹ< ㌳)��Sx6hKBS�v=�{�,�kQ��R�=Dv �,?�F�#9Z.���\�qň��8��r�'k������'��j̃�s��'���L9�V�]�Tք��u�.�P������grA*j�I����s�����O��f`�)���I�̣�1Uh��ɸҘ]5|{���8b����ˈ�B�}�p��E}����~�U�}ğ����]Ŏt++�1���^��;;�i�t�3���nֱ�t�QoG�F����1�7���5�u�u�z2��TAbP��? 㿧�q��5.�x���T�/�8�i��|ƅXR����%+5�zDZ��$u�?j�0mk<�)���(��bٲΘ�,8ggf��J�0�S4xXK}PYE7y��0��^����_���6W�_RH���xة7 �p�9�;9V ��ɱB���G�,��JGc���������VR�`W~�=FQ���"y������퓆%������?[\�o�V{���ޫ��7��h�٩�ŭ^w}{m�(~Y]�ڃ�Z����D��j���߬�Ug���hO�"��󰨜~�M2y5���%���#T%Ǐ�hu=�DЮ�Vf�O�qh�?�P�z<)������3�H+��� ӥJZ�r��ҲM�(��T��>R�����Q�$Ee���wV�r�{ʪ������S�B̄��$S�,��bɷ��,�W��YE�����<ە<�~�gǔ'�R�x�Z��ɗ<���s�)�<����T@�����f9�o�9�TY]�m\�y��y�Yu$��Ϫ+Y^xViO{l�A7�vۥ>'*5{._�jX�h��|�BDԣP�N��C��գ��&Ŷ��y��0ʮ)�_��	�������-��`ߎ�$CƧ�tROq�Aڤs�������x,2� ��:|+<AM�AQ�·��wK���ljw�g���h/}9��"���a���S-�n�d���ϕտ�_1��G����wd���㟗��$j���mܨ�����g躤�Z>mI��p��fǼ�3�t�ǅ;��u8?�G?:i3+~ȱ�hF\���/U�}ߍ�5���VV����Z��	G��	���;�7G���*�\���?�M���_E}'�i�Vy* �VK��\*NԆe
��ע�Q�j�/�v۫��������5�j�WPt��Q��S�=��R��1��E�vX�ai����b�d?-Oy�������ޗq���xd9I�/���g�xn(G�b���* �p#�1!By����+�)�pĜ��aLC����9���ʳ8@�%7��;��R�����Ks���1�?����(8��y���v^�j���޼�AX�{�sc��1����/]��n�l�׍K�c��M��Y��e�v��\)'�BNR2��]ƭQr��Ӌ!'����ǱX�"Q��uy��e��9+���
�s�1jd�>đ�E:b�Ь,hV���x�Z�&��w4!O�+V:,����z��잌1U,;tE���ȉ,�,�&���ņ�s��h�<�w�е5h�()h�c�6�E�0n:��$/7y��ҫo�g?�E�����W�O|����~V��-�B}�u��9�	���<���"���7��K_$�Y\"[^�1V�#�V|�>	�����¸����WQwh���J�[��2 Je���I�c��^@�l�v d���^��,���|،��ޖ����|�����P05����O�ɳ���Zwc�������Nal8� R�\:��6��|5����vH���[J�i8)��9ez����u;9�P�Gd��yB��K�d)�r~d-I�:W�L,���fn1�Wm�ṾlW�
4����W$(��_<"]d�A^�*�z�*���K[?�j{r�(z��8T��G��>����\X�9�rT����X��X���&ǢS"�!O�F"#5gE����zLN��Q�+�����d�pE�/�E�`?��=���5�U�r�rnu�-l�b����O��$I	=�^*]�WT�2CG�x�f��ٶ|��i��|D9������ƪ6|"-
��N�|(��sLt2@�ҁ�"8�6��Ԑ���f��G�)�N<��-O4�R��O{��|�t�Iv��^`J�&��Ā+`ω�3 "�S`�</���I_�tύd I��F2�$�s"�S�1-&��,&�R�-O� c�P3F3�'%z����l0�Bf��NI�:/�B��ĥ0s5�7=�%��w��=,6�XZ��*)G����/�<[0(Ҝr�b��.ì`��o�,T����y�5���{�M�298V��S�&M�1cuD��)�T��M.��2��g]OF����ӓ@	����-�����{m��O�����)%� �3C�"8+�#���5'z��
I�QJBf�;��(xƫ.�|F���d�<^%���˴y ��w�E-ލm087�:�*��I���T-'u���+T�NU\bf�B��Y�[��Z�f{=#��� �P�����E+t��҄�pEͨ������#����tҧ(��1�<�E��_������(���pe�E_�#�L���e�S���zI=2�ʊ��e#�؁���^;����e^�j\�0��/т}��@�Xn���A�FR6��oDUۤ�;,�%#;F$�>��ڠ7+�Iq��w�}PĤ%�8��(�F��~JCh4bSk�^�*x�/�>�@V���՟h �Qʭ+�u�:��b�Z]%�^o��R.%�	��*�]M�3b�Y��H���ŋ�(�XͭetDZ���Ys�K�~�/��	`Q���I��P���V��b�5S%=�?�;�\l��̇� ���O���i�0M�B�=4����ri@�y\�C�}�b�)�g��Ui�#��D����a�'9�H�]���x���������.�qv=U̌�2OS����r������d���;Q��hⵯ�rss[��U�L%�O9Ͷ+��*R�/�.5���S���okk0P�j��zj���n�{�����A��i�����wW���A�;h,Z��-�lٜ-�nBP�ޑ/��
��B߂�� ��#c`R��}$'E�mOx�2&ȖCQw �#�醢�W[���k�����KhR�P�k�\��2Wmim� ߒ�ګ'�g�g�]�t�τ��P-���B�b7٤�r�r,p��| �� ���2�ҙ��y*��G��>W6\Ɇ�\��Co$A���hQ��d��d�'���9a�Ҿq��qu{�S_���E}���!�|����f$��[b"�L�ϑ�P2�=?&<S2�?G&����o��L�'�����
�y�?�%k%�iqv�ܢ��x[��u������b�oD��=����h�ف�y�?�5��� ��k�6RJ�I�և3�2�ȃ�c$����;�Jl'Y�4<�1�"Wf{�@{��� �  e.زO�WOI���ڈ�z>e1ز
r��L��ŵ%n8U\Jk�u�L�Wb��|�����3
o�|q�Yso�r�)�M`�%�c����u�	K��`��7v�� y�]��7�.��1ߒEw?1������K2��]��_Ч�9���!���jb�z��q�ʀ�����]��.H�yB%D��_��O��Iu�:M�A���V�h0l�%����=�s�4����L���D'!g�x����߆�A�~]���;)UR�,����1G��=��ّi�{s��8>��uX`�'��8OD[��+ax{>��\E1A��>���f�\Q�b�S��P���<rTVh�i�0E��6̻�?��Pdcx;K��me��ZM��hQ���bh�T��Vq$��l��(�b�ܩ�iw�S�����Z/ғ���eCS-�o���_H]�g xx�%wǁ�����S�������MxBc��s��sa/���eo�m�|_r��l��p7W��ɏ�Q���Bf�!��xH�ز�����8v�zʻ֛"�C=Ѓ�Bz��`�|:V�%(��Yue+Ƣ�B�V�$��B4^K���������ƶ�����JZ~���{5~��:ߧ�*^|}�B��*�E����ִϓ"�6�)bH=�X��
�#Š��������|ƥ�;C�زL�y�B�V:�3�XFX�v���X���)u�o+��zC6�Z�����r%PЃ���*�������~3�C9?G��W��Р� �G��}���_|8�����၇��-:80ē�~ S��S���Y�<^{�<^M�n@�v�K�EV�͝�F��W�Ǆ��!9��up�~����g����Oai�R���ZICV��P��ǻ�T���v�WK9�����	�+�ݭ�������F �;�p�WI��~�2�U* {JE��-��x���x��K��ׯT�Q�S��~�@�P��ޕ�s����o��c� ��Z�\�|ާ�}�z��XSk�K^��{����	5��g)�;N�F����pޘ�+ג$��Q��κ�Jb���Ay_�gs�Z �e�)UӔ�=ڠ�a-'ѓ)K�E�ZT^m4�͖H��M���v)>�|W�Λ 5.�WQ�s<�=h �VC����,�dk�⥂���x��T��ۗ�Y�Hlo�|c��/��0dra��ǯ�F���0i�^,�B��sr�~	�����"�Q_\�63�œ�H/��O�d��EkJ��ba.�K����� �����"�n�3�O����t�f)�j>�z��.�G�t*���vE
^@�b�T<�F��1���d�A�JD6�����EgĬ_�6Z�ɴ�(�&��D�F:�\%���=�pL������d-�7}I\A睸���I("��F���Zm\��-6>��PFa;��v���\��U,zb�s�x��wT�p+o��@It�y +ڪ��Է��-�T+��h,�l���nes����,71q�G{�Hvޥ��lC4nu7�@�t7�_�;��hPoWw���&>�����o�Qc��=��_7�T/�]�px%pg��v�5�W�x!���܅���Bu��X�DP]�8B��Z�1<�q薅QW(���C�Ά��R��~�c9B7Z46�h��	Ԭ^\�)A��Gz��D��Ohl[BG�����2^3�%e�y$AvNCI�>��)�����ׇ%�q4�~%��<k={�M&��|��vq_J\n+Gלzfĩʄ2 ��rS���f�%�I"ǒ����jrUQ6;3��L����C�X�<f]�t�؇���F,����K�e|a��9縬h�'�0���@D<�w��%�F�3ԋțB�))�)��G��� ǒ8�p�S�D�@�SP�r0כ��mt=4�s�=r-a&�b�}�X��߼ˈ�T'f݂j��C�]��w;�A}��m�7���+~ܽy��Vǌ\8��7��E;�M�-��#%<)t�Zc����hҁ����2���W�dܒ^��vӅ�߲�ض��T���V�9���{�aE��Gk�3��V�Y:N@׶��bq�� 7N�e��{ژ��������-�E����q�$C��?����ʅ���^�o4שG�R��5h>���+峙k�]yO��ń����T���׷a�y���7��	 {�q�����LQu�e�X__����mv0���M�����e*�H�Z�	�e�1Z���L��jE�/��8eq�ƐS�A۪�˖���ij�7��H;�}Cvا\B{�K:E��0���=5�Mcq%��ӕ�1!�� >��]U��/~�=	s�'tyepf�A�����/��7�B*.E@�����>�	�4�2�	�f��AV���#j�>�,2������J��H���)+I[��.VZXW6�=������	ل!�����g8��]L�� $I��fIj�������S��˗�_J$�|��]5��2�Plc[<^��~�Y�C�bօ��'���-�嚇ϑ���R o�,� kG��'���"Z��1@C�E�:)��s��w�Xr�c��[̱���]��¯5��
�O���`��k(��J��̩اS��B�J���Ǎ�������1G!"2�xB��j�kƌ�J�E�#$�x9i$�޽�lh�{�v�c!h�t��n��լm*��i�l쓔8�Y������@C2�J�n���X�B��Q�9����{���G���K�%r5_$�����	Z�J�!G�U��>J$�;�S�<$�fz<3/g��S{��/��ή�BL�3��(��knT[���w�jP]_�qr�8���m���L'9f�7tk74כ�V�ׅ��'�����SuW���:��P�WRP����$E�Zؕ=�`oa�������.�Ӫ���g�+h���?�"���|%)`\yr1~�i3]��S���q?���cܢA~�L���J�%϶y�� ����A^.o��$�3ޮU�͓%�zd���2f�I2m�ܮ����t�uM|ST�j����p��0�F�(ו��#��r-�s��bL.��\�k�\Y�05`E9��+	x��j,A���� `36nL2�P���ǧA��� ��Ҙ���J&�Sn��#w�G���A�NA\���ŧ�ҝJ>����'peg��8�ܷ�l�-E3�r�4�X瑢\R��&���iG"u0]����L��o�~��f�~+�p!�)�d���\�X2}���ƕ~�����X]z���`���� ��%}��@��������rL��1�"�����v��%��/��ܭ�aZ_ow��^�ZŧA.�V�n.��V}�jV���j���^�N�Οڌz�&��&����k4���zMЗ�wU��m��䞈��뻛�j_�Q�=����Y�]թnV�8����`��Zo����^�栺֨�:��ŭE3�i^��Ka�1�ś����?��xg�ҷ�9
̋M}L���=�Jw)��/��]���{�d��1?�,�Ș��9X����?	gz�.b�7�7�ˁ`�X�>��߀��D������$��]m��(�ލ@6�_ֻk���!�PS!�g�<�U���^�\�$��w����$���=!�?�6��=��|�r)�o�PxᒜlJ�'*d�f����S<X������zǸ��K�,�مt�f��iy�����$�-�
��z�xL2�<�6��b�b���(7��ہ��?ʨ�9~�m]j��l`�!��ɬv�3��U�
�Bks��|3�H��R�M6 7崇�.����݌\С�}�i�͛U��mǋ"Rwy/��C�j�&��OKθLu�i:�Pe� ����l-�����p�o6+��$؋&R��s���tL
@i2���Ǚ$*�œ�
@�E#W��H��jv���K/�/��pU      Y   �  x��Z[o[�~����Bs�zn@$u�q�"N�Uж\��P����M'MR�ΥiR�4I��ҔhӺ��ÿ�_ҹ,�s�"i��A�<;;;3��7�4��:���{b|{��������h����/��ҭo�@��0�S��x}��������6������g\|FK-��
m2-3��D�KyV9\���|+�7��	�0�+��P�G$7���ͣ"�E��C��?��;��.��2 ���B�߂Y��c��5�ߧa.<=�_Y7�}2S^	g:�d�ʐ���u,)8�+@1�V ��@4����S��wQ��
�2���XnO)��F�qs���^>��=�%������X�[1Zj��P|�k��`�!��3�3D=P�1|u��k�����GAu�q&��8�i<��!HDK��?n���:~���:�Oa�SԠ����,`��7)�A*Ȇm���?�;�21�v��K�ĥvw��u}A8�Ht%��{�0�0��Tr�(�k<D��xw��`���ͯMF�����jɶ9`uy'h���A��@*Y1��t��S�ᇴ���J�d��.n����M�y�fM֘_[�v�7�V��͛�rguk3��j-����o[݅�ŵ��v�Y���.llK�������n��˛��[m����V�������Exr�sui��om���6�o����-x�ۙ�Z�lu�n-w�_��k+K�Rg-����\mwI\ÏQr3X��S�ի�m�Zo)m]�]���՟\]�\[#� ���"������׼16;7[6�i�.b��$m�S?��ħˆC��x݂j������+�D8�F=��X|q�.vWWLi#��<��"�ϣ'���0z(|�J9�U����.�d�TVO�t���?�o[�6��6_��r����M��rH�)I�63)IU(�f�{�����wJ1��!P��pp�q��! |�
����JR��6Mj�c�Q�Yv�ì)Ð�d�S(�P&��b�6H��}�0b�d�*:�Ȼ�(�s��l"Kw�����3ʜ	�"~��Еr�ם�飆��	��z������H\D��"Jg
xP��"f��� [��l�&}{����1I�&�V���g��A�Ma�0�8.�	%g�OIo� ���C"x|qNfF�q�&!����	`��E���9�b���x��'�	��y|�Y)�i:�bD[������� �o�!�(hI��\k2	b�P2-�D�������UH�`�g������!��p+��+��(L���'(��(�T߇�8P�!��D��x`�S�<��z��pd*�IʄX�N�S˦�euj�+��c�RKT1<9B7?��fJxC�r�u�L"�@���o�b�Gf��V�T"�2�kL,�fچN+4���R^���4��:�?q(�F?��A ��ֲR�M:�)>p���#���`�2�O�A=���j�L�N��_]�n���,����$����ճ���"��jt�)��,
�IV���O �	��xJ
�bn7�ŹIf`�tbMQ,jj2�B�س�wk�b�L�0"���> ;�Jb�L��60L�����~��s�����򧊅t���Ta�"Z��gA�|�¿�ZR��)� J�1�����R"�哰A�(�(�ު�d����/��A��&�$�_�_��5���b��\�W8��У��c9�$靨��Sp�$�tk1�f�U^�oIP���\� ��&�nz�{ʤP��K�.҄���X�*���כ�(��>�%@���:Y�7�ȁ�/~���2QS#��&ʤS/��+W�@�ƈZL�d�x㍲�/�|��ؑ�F[ԣ����cOQ��c����F�	�/��� �E�	��@<� �٧4ǭ�]̽O�^��X�sE ���4hk�9޷3\T?���W���0a��	M0U�5T"!��4��§��]ә��oё?�%�&��܏ 8;�Ի$Ɠ��
�[!)�[��G�,u�Q�0����1³OZ�>�o`t� ��4DId��*�"�4�Ø�7���JE���m��yq����0er���[}q��K-s�e/��_��E`�S�����3"���`�nP�*�h�e)�j$�e���*�6�jZj��i��
��*Մ�E�o�S5陪�L�B�M� "4�2�Pp- *���Up�Q ��~�Q��˾����Pbm�.j�3+ �h���*�N�Hqe~�����4}�|$�k�(.�1$�`d��(r���,�D�R �L�I�=r�:-u~D>lBr��bf6�@����B�ց�?�*�Nó?	3x��;,ϩ-?����զ��f��v�Q����\�B�}Q���T�?��B����$a�L��\����\�����͓+�b=�44��s��V�&��UJ�RL9c����D��odj���F��ԙ 9;�M�!��*�
��N���O���ʋ�SN�8���+��
�M��ö螘�M$�昕���Q>�9D}��q��k��i��ޜ�����.�}��hYU�fV�*b/ ,���L�
��8��"g�b��3��_'�Zԗ|媚:�-�1�W���׵q1�EB�8�.~��µ_-�=Ϩ�4
[��%���C�;�8�N^�*�U����?������	7t��1�D�.$�*�=�aT�����	%/Q\t ��˗�e�!��c��#p�z��������Z�_�����+��k�2X��Q�w��|���	S�{��\��Hў�S�#3�D�򌠛�Y��~�Чʭ�w-��C���(/�����^�e���;|��;W ��:*m�����;1ŚTƾ6�*�0�Lw�)����r��=p%�64�&J�D���/-���[�p��lB���b���Vٯ���hU�M�ԝw+�<0���y,׸��p2q�vW��|O2�>Q����5����`s��������[׺��F��(���4��M�v֖�xq=�v507Wl�n�f�ǉ�PmC��,'�I�t�JԖ��Z�X*ꏤqeal��J���:}�,�?�&]�ݞ\a!P�0�a"���s�&����I�[P���g��+��8�il��h��k��-I��7^�j�'�!�+>���z����.�ȝ��o��?��̙mR��Է�i�=��]%�ϐ"sZ���;��Ή��	���>�A|��ѝþ�ƛ�[�������4���X����l���(�c�aƤ�t��W�y���%�FWb ^�Uh�K�6vM��Aqg>H<cX�!��gA"1R���M�>A	O~���SM�Û���M�������lhTS�߇5,�A�%tm����!U;䔟}����9��T�p��*S.�|_���ҩRRV�B�G�b|><{��h�ͬ      [   "  x��Umn�@�m�b���(�p N���8��Jh�@ JU�o];q�xs��+pޛu��IEi�ݙ73o�LD�J�>�=ɥħ�;#3�2�Y����q���XF[#+898� �$��'�X��H~��Dbp�|��n0r0����z��t�\�5���,Ã�[��q���0G�O�X��������e�䬑?Db��Q���&w�R:NY~#�f$ޥL���ح��m�K�\��±ϒp�(ȅ��$@��j�)��^�sɼj,��p/4�?hdވ���$b�~��^.�J^?t�|F�Qyɵ`&[�a��Q@?z���q�p���zL�C��}�����8KA)�%���bWɂE 4�zڰ@6jB�(:��_����Y���ʘ�*���*�I�N�K� ��������5��W�ZH"$���j�Hkc�ػS��[b5��q��vD�4�Ba���[`�4�M��D��D{�3�k�Ġ��֔�N�߂����	9���,!�E�$���#ɹ��7�i����E�ij���T��[���i$�I�]k+0�U�+FƅNY= `��lNB�o֒�c
���g�ȵ��x�*���r��xy�rֻ2�_vx����c�C�*`�k{I�B:;-&/��ㆯ��;������-g�������nkA�P
�þ�������By�n����xd�9�����#>���Ư-�n��#�g\뽖r@��5�T��C���o��5).#�7�x96�-��H���Y�B�Tف�n����o�f�V      U      x������ � �     