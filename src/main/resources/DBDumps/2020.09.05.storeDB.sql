PGDMP                         x            store    12.2    12.2 %    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            F           1262    16601    store    DATABASE     �   CREATE DATABASE store WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE store;
                postgres    false                        2615    16602    store    SCHEMA        CREATE SCHEMA store;
    DROP SCHEMA store;
                postgres    false                        3079    16603 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            G           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    16612    authorities    TABLE     �   CREATE TABLE store.authorities (
    id bigint NOT NULL,
    customerid bigint NOT NULL,
    authority character varying(50) NOT NULL
);
    DROP TABLE store.authorities;
       store         heap    postgres    false    6            �            1259    16615 
   categories    TABLE     �   CREATE TABLE store.categories (
    id bigint NOT NULL,
    category character varying(50) NOT NULL,
    parentid bigint NOT NULL
);
    DROP TABLE store.categories;
       store         heap    postgres    false    6            �            1259    16618 	   customers    TABLE     �   CREATE TABLE store.customers (
    id bigint NOT NULL,
    login character varying(80) NOT NULL,
    firstname character varying(40),
    lastname character varying(40),
    password character varying(255),
    active boolean DEFAULT false NOT NULL
);
    DROP TABLE store.customers;
       store         heap    postgres    false    6            �            1259    16622    customers_id_seq    SEQUENCE     x   CREATE SEQUENCE store.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE store.customers_id_seq;
       store          postgres    false    205    6            H           0    0    customers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE store.customers_id_seq OWNED BY store.customers.id;
          store          postgres    false    206            �            1259    16624    invoices_id_seq    SEQUENCE     w   CREATE SEQUENCE store.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE store.invoices_id_seq;
       store          postgres    false    6            �            1259    16626    invoices    TABLE     �  CREATE TABLE store.invoices (
    id bigint DEFAULT nextval('store.invoices_id_seq'::regclass) NOT NULL,
    datacreate timestamp with time zone,
    department character varying(20),
    comment text,
    ordernumber character varying(50),
    senttoapprove boolean DEFAULT false,
    senttopurchase boolean DEFAULT false,
    invoicenumber character varying,
    totalprice double precision,
    resolveddate timestamp with time zone,
    customerid bigint,
    senttoprice boolean DEFAULT false
);
    DROP TABLE store.invoices;
       store         heap    postgres    false    207    6            �            1259    16643    purchases_id_seq    SEQUENCE     x   CREATE SEQUENCE store.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE store.purchases_id_seq;
       store          postgres    false    6            �            1259    16645 	   purchases    TABLE     I  CREATE TABLE store.purchases (
    id bigint DEFAULT nextval('store.purchases_id_seq'::regclass) NOT NULL,
    invoiceid bigint NOT NULL,
    nomenclatureid bigint NOT NULL,
    count smallint,
    approver character varying(255),
    resolvingdate timestamp with time zone,
    comment text,
    buyingprice double precision
);
    DROP TABLE store.purchases;
       store         heap    postgres    false    211    6            �            1259    16717    invoicesAndPurchases    VIEW     $  CREATE VIEW store."invoicesAndPurchases" AS
 SELECT iv.id,
    ps.invoiceid,
    iv.ordernumber,
    iv.comment,
    iv.totalprice,
    iv.customerid,
    ps.nomenclatureid,
    ps.count,
    iv.department
   FROM (store.invoices iv
     JOIN store.purchases ps ON ((ps.invoiceid = iv.id)));
 (   DROP VIEW store."invoicesAndPurchases";
       store          postgres    false    208    212    208    208    208    208    208    212    212    6            �            1259    16634    nomenclatures_id_seq    SEQUENCE     |   CREATE SEQUENCE store.nomenclatures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE store.nomenclatures_id_seq;
       store          postgres    false    6            �            1259    16636 
   nomenclatures    TABLE     �  CREATE TABLE store.nomenclatures (
    id bigint DEFAULT nextval('store.nomenclatures_id_seq'::regclass) NOT NULL,
    comment text NOT NULL,
    price double precision DEFAULT 0.0,
    manufacturer character varying(50),
    nomenclature character varying(255) NOT NULL,
    code character varying(20) DEFAULT 0,
    submitdate timestamp with time zone,
    expireddate timestamp with time zone,
    categoryid bigint DEFAULT 1
);
     DROP TABLE store.nomenclatures;
       store         heap    postgres    false    209    6            �
           2604    16652    customers id    DEFAULT     j   ALTER TABLE ONLY store.customers ALTER COLUMN id SET DEFAULT nextval('store.customers_id_seq'::regclass);
 :   ALTER TABLE store.customers ALTER COLUMN id DROP DEFAULT;
       store          postgres    false    206    205            7          0    16612    authorities 
   TABLE DATA           ?   COPY store.authorities (id, customerid, authority) FROM stdin;
    store          postgres    false    203   �+       8          0    16615 
   categories 
   TABLE DATA           ;   COPY store.categories (id, category, parentid) FROM stdin;
    store          postgres    false    204   �+       9          0    16618 	   customers 
   TABLE DATA           T   COPY store.customers (id, login, firstname, lastname, password, active) FROM stdin;
    store          postgres    false    205   �,       <          0    16626    invoices 
   TABLE DATA           �   COPY store.invoices (id, datacreate, department, comment, ordernumber, senttoapprove, senttopurchase, invoicenumber, totalprice, resolveddate, customerid, senttoprice) FROM stdin;
    store          postgres    false    208   �-       >          0    16636 
   nomenclatures 
   TABLE DATA           �   COPY store.nomenclatures (id, comment, price, manufacturer, nomenclature, code, submitdate, expireddate, categoryid) FROM stdin;
    store          postgres    false    210   �-       @          0    16645 	   purchases 
   TABLE DATA           w   COPY store.purchases (id, invoiceid, nomenclatureid, count, approver, resolvingdate, comment, buyingprice) FROM stdin;
    store          postgres    false    212   T       I           0    0    customers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('store.customers_id_seq', 5, true);
          store          postgres    false    206            J           0    0    invoices_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('store.invoices_id_seq', 140, true);
          store          postgres    false    207            K           0    0    nomenclatures_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('store.nomenclatures_id_seq', 616, true);
          store          postgres    false    209            L           0    0    purchases_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('store.purchases_id_seq', 270, true);
          store          postgres    false    211            �
           2606    16654    purchases assetelements_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY store.purchases
    ADD CONSTRAINT assetelements_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY store.purchases DROP CONSTRAINT assetelements_pkey;
       store            postgres    false    212            �
           2606    16656    invoices assetorders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY store.invoices
    ADD CONSTRAINT assetorders_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY store.invoices DROP CONSTRAINT assetorders_pkey;
       store            postgres    false    208            �
           2606    16658    authorities auni 
   CONSTRAINT     [   ALTER TABLE ONLY store.authorities
    ADD CONSTRAINT auni UNIQUE (customerid, authority);
 9   ALTER TABLE ONLY store.authorities DROP CONSTRAINT auni;
       store            postgres    false    203    203            �
           2606    16660    categories categories_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY store.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY store.categories DROP CONSTRAINT categories_pkey;
       store            postgres    false    204            �
           2606    16662    customers customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY store.customers
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY store.customers DROP CONSTRAINT customer_pkey;
       store            postgres    false    205            �
           2606    16670    authorities customerid_fkey 
   FK CONSTRAINT        ALTER TABLE ONLY store.authorities
    ADD CONSTRAINT customerid_fkey FOREIGN KEY (customerid) REFERENCES store.customers(id);
 D   ALTER TABLE ONLY store.authorities DROP CONSTRAINT customerid_fkey;
       store          postgres    false    2737    203    205            �
           2606    16675    purchases invoiceid_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY store.purchases
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES store.invoices(id) NOT VALID;
 A   ALTER TABLE ONLY store.purchases DROP CONSTRAINT invoiceid_fkey;
       store          postgres    false    212    2739    208            7   ;   x�3�4���q�wt����2�4�p�C]�C��9���&�&�\SNSd�̨/F��� �      8   �   x�-���@C��W�8��X��p�oZ��2���B~GfWn��$�LpG������U0H����`���"��Z��X�\C�Y�ޥ�D���M�B0�B2��9F�;���0F�^r-�p�B7B���<����	nyL�:���n镺]��=��o      9   �   x����n�@@���9X#3@�m���/4)�n&2�[a�aP�ӷ�I��/���P8E}�¦�w���brl�+�t6	5�[p���m�v8F�rYĝ�����>4r؆�կ"��r�_cY|ـ2-;�����X%p�w�&w2�$$xF�B��=T��y���>ƬIR�"�y�"�v\��mz�=.�e&V�4�_�ձ��6L�L<��Ӵ���y��_��2� ^�<      <   ^   x�341�4202�5��56T02�2��22�33�60�t���Q���724��,I-.1���1~d�Y�ehl�n�������v� D�9@s�b���� �!�      >      x��}�sǕ���_��%%�9DwO�|(�r� �,�� ~(Zo�@bD""  %�[����M�������*�o������V�X�%�j��?��z�zfz@P9��3=������o$���o��_>��x�b���_�w�
Rw~�I��{��l�m��¯�mWf����K�����&�wޑ�5 ����Y������#<&���Bt���M��-����.?'��ՕחO���M6:�`�A0!M��F �d0�;���&��a\P
���X���DX]ZSX�+��SˋX]��3���K�g�j^g�	���=
�]D�QE+��0ϓ6b��(\>����0	&u�䀸��fnV�h�8e���1�%�����;*iH��m"D����ג�ʈ�;>c).�D��M������7 �v=��&�l��'��dm]0���5g��\��j��3�P
��04(LA�=n4�v�M4�F��-�0�5�/�簵��|����(A%�Me�(0�b+(�E�q�Ī��L�tB#xaX+���j�C��!���"�a�4�D)
d�H�@�1 �\@&B\3E�H�Ж��u���?�����|L����� �]�}><F�Jr-�6ԇ���(����[���Tќ|Ǯ���vF�Q�{����d��<���כ�2w� (:P�$@jw��Es�E�e�w������&$��-�sI����R���ȸK�Md\~��J�)�D�f�:���7��-G�*�ѡ���]�~E���Ұl�p#9�'�I/�C�Z)d�'�5dҠ6i`��C�y"��rMe��`��	S�E\:2��Ŵ&l38,0"�H���:�����ZAң�2��R\�3d
&�Y���<6c����c«�o[���i]�e���\�!m[DG��Q���$��DnKP��T[��ENNq[�P(ir*��`��q�2AUrY����W5��aT����姗�����7X�7 �������Jy	���3x���_�'v���O�__~:}	v�Fgқ�uR%a_mꀘ������*�d{�$h������k�jm�E�ǝ�\F9� ���1�K��^~v���_��6'Ո}�����ks���8�j����Ao��o.?�'��x��M����D��Y0�M_$�oN��[��L�7��ƻd��L%�W����>��vk��$Ԧ����Ǝ�&WYk47S���{��\ lgi��k;5�T��唒�ixY���=x�R��^���z�+��/���8�U+Z%KKd�3��s���TYږ3O!��t{�Y~O:'d�
ϟ�Y��9i�n0��zp�4F�GH)��5�������E��//E����{5�	�x&pf�QFwK:��ྃ'^�iHjy� ���^��2ܳ�68G���v,�����}�W[�i���TI�Nu��vN'C��?�'��� =~D��gl�9ݳ@	�#��}�#2<������A�~M#��_��e��	�.��j+�9���I�.m�ǁK�z� ��Ԣ���(�8�4Mi˨�T�c�K���&��R�|P�
P��~+э�Φ����h$�9����e��gA9�Y�5a_z,��rEg�ׄ�L�kG�*L���\�#����Ұp*��VN:��h�0gu)%��"^2����y�y��?����E��@5����}���"��%����j
%�s�Q�|����Ŷ�{&��;���fX};&�O��Y���� ��B	�o����A�g�I�lv���l0!7��(=���y`.P�`:��7(䥟ӻ���q��'�)�4y��?+���h�=����Y-��П�Ք���' ���7eI�@Z�1'@�����BT�H@����_Ć+�O�A�J���g߄ѳg����8������a唨�ivMy$8��&��\�DY_&��WH�6h�l��FآGV�Z��TkZv@<d�cCvI�Ш���&�S�7!�Lf���E[�͒�����ř�(��:=�}�����^E�S����H���*�XvP��{����E�#�� ys6�9��� e~�$̹R%^)�6��?*�o��B]6��?���?��Fi@j��{Q�/��+ �J�̏���p�����_�ٰ.�­1���p|�7�L�[���gf��N�����@$`����&M�e�1��@u����S�OB5W-)l��a��AU?�4~��T�Z H .�[:�>��������W����@��(<��a���C�E~ ������)��|G��8j�/�����!3{�������c�����'@�������Nc�
Z����Ad��{���=1�"=�EYY�Ց��/0��E;l���+��ȟ�=��J}{�Ԛ
�r���l-7��ۋ������H����`Rk���r�f��X	
�.���Ʌ��H���BY��Z__'��f�x�K��v��$�M�Γ��G��^�9��UqMo�G��pP�'��9��,
6 ���r����;�;�����TD*ݦ0Utx̎��5й��Өs;�s�&T����1���n?U�_w����m���b�߫ς;V�j��׮! <��B�}�s�g%��%�W ��
��`cx��!����dx�"D4�6��1�g_2��
���Q"�O��7/�K�.~�b�7�90�Ȩr-��߲�[�.��U(t\ܻ�*x%~.��>�9C6�2=C�(v�
��ӽ��}R���*�īhO�3�~�ty���gL50�l0eԨ�h��+���$�ci�7ڣ�g�E�>	N��i�'�q�Cl������Y련Ʈ)���[Qav坊�E'TnlSߓ��U0x���$���5(l6�Y�/t�kV�Wi���'0k{8��ǽ�1H]j��`#_\
�ʋn9&i�[�N�h�����:XV��h���]�b9��mn*����xW���� tqN�}�_�	5ޘ�K��h�!�� UN���(i��2 �Â��k%��ڬ�M/�j�sp>	���r���U���:i��[��� �� �WpP�Ao�@VA ���[_ k�&|6��4خ�[�0�j�J��Q��e	
F?ioY(	P�r�n�jM��$�h�p�h:��DvO4���|b\�DY��U'b�=5��=�:�􀢟W�-N�.�9:  b���S�
D�(�����3�NJ.Qm@�Jo�E�"*D�=J�/ �44m���4֏���`1�,�%4x�\�7;`�k��s�>�'������n�l	��L����i�gU� .НQ�6
�B���"'�`��z�.1�!Y����h�������0m�=VV�dH�[%�.�����9����ˆ��Vz����Q1���
e�}C��&
W\~��̴�^��N!֡\>/#�%�-Ѵ��U�#��\Wu��ި�yB��!���Z�_�e@���]Bڢ�+��R^�]�ȍZs˒���4tq�?�A���.����C�ԫċ�قR�>Ew�rl�<^P�.�EW]B-0+�[4Qڝ��lp����-�����<�d��N��\��
�<X�b�U��r�l��ggt��F�n��llÕ�m~3�JPm���drz�Z}���bp�9_<���I����o1a1k��j��V�pkc��^[�X�n[1Hkg�ZbV��f�0�S�u�?�5�o�N���ŭ�[�?�j����`_�ZK?��1(�$ϕ{�K�m>GÉf��2��m��Z
�V�F�;ÉG�����D�8�hE�Q1��c�PȶI����O
>�h%��R��3�t����&Ρoc�yP�y4>fU�5���xn�ָ����% E��Y:9&�!��Л5���j:%����pqtV=
�g��qu�9z{�A��u|j;�n���6��L�DԒ>�Jmu��Sk��( ��Q@��I��������V�a}��zu}��u�����kHICe���S��],N���]_��;+�Yl�RϏ-�7������T���-ʗ��%s����f�oHi�1'�d��?�dI�9�����yUp��d̥@��V3�:|��5    O�g�*��vB�?�8�h{6�UeWx�D1�_o"_5:L�
3~�+��W U��ӓ=�E���GyR�"lʌ�"{F�H�W��uDƇ��S�0��V����+�ۨ�1
�,�J#�	0e&���4��q���Ų�2Msܹ��XM*OM[���t��8��C�i�ɔ�Dljg��ȍ
�*}�%浀-���`拻�kk���n��v]�WI{���_�n�Co�����0�g�x��EZ�����[�u�]��{�A����T�	����i5ȸ78:	�IM��.�(1P��f~P�	�ӯ��?��*O��	�7�k,�&�K�A�o�u0�w�r��.:�.v�:'�2���Y�����I�q_��h��[�T�Yo�foE��4��m-�z��_;����%�A�GxY]5�gL����ٸ�2��Y,y����C�F�To���`l�`�|��`���?
F����>0������1��p|�7��9O�+l���I�D�r�p�J�˼���3�M� d���'�i������[�2d��tP�jR�<�C��gV�~RPƄcP�msMS�ۖ �C�_&��\����@�ZF��L��tȟE֍�V��qjg��0�&���t�/Pc��%9
%R}3P,o.�V��-�H
�Ǎ�	X�r����$q3�'�\T|*��<���;���+5*��K�EߐyBVT0&g�Έ���Ҷ�ˤC��$�����V�y�+�X����ټÇ�;��Eq�2;���ܯ9Fn��?��d��R��Q�_D��u������ph9>e�5��B}H�p���m�,9k�3莃��
P�G�
 [hT�wF#�X�VT0�)�txj.J�˼�္�k?V��Z�x�{�4A���rT1x�mF���^2an¹@�|��D5�d����a@n�&d��b�{υ�M[�~���/.9#��l���h�/U��˫B;	Eb'́��=����V��7J�N��$e���y#��Լ����L '����MӁy@3hp3xʗ%�? [��'!�+Ñ�8�0 ��Vn
ə�=��\wStd�0/��|1Vtwg�d��Y���GR%ޏ}�S2����9���CE�Y��}j��̑
����ƪ����$8Z�����sn���ǡ�zb��)���X-f5,�[U�}$�v:@�����a"�����������#7��tU��� 3��s!f��k*O��L�\.U���H��d��?+c�2�6<��P�9�L:'ãjp���JmfQTu{��n�%��J	^n�/��7�.�$�v;8?vF�x���i��*RJ���i C�!�x�����Bv�2�q/�'!�)�E�Ђ��0f}���d�#�Q.�+�A�'���
�-��~��@�]�\L�M�u�v-���
3R<@��C�kE��i��j���*S`<�7��R嬧�J�c��#"?�Mzhc����$(���A�P���n�:w��U�xҥ�*Byϧʜ�<�@�׺�g��2ѵ�Z����2V(ӏ�!�����<4�I�N8��p�N���a��DI�t�IO���E!a�{��a��V�\�R?�ǠQ�LF"<�nx� ��4�wv7�,

��M�YS������,3�86ډ|Q����ѿ	�d���MgM_�5����qU���=������Ó����������i����������M���y�=��X�Ü缐]4Y�W;�H��+�c���Ԉ0���T=om-7�&J�DQa�8D���VG]�f�nlWe�#]�R&�Nar�����q�j�]D�����NB�߽w��z��ߒ9��V��,J�p�w��Pނ����]k{xr߭���?�@�B��7��(��p��To`���ه.�8Om���mݝ4&69��D@+:�h𬖛d�~�g�����"ޓ�%δ�6�)r��L��¸
���ꃦ���.�#T�������ލS�@¸m�`d���DMa�} &P7xv���q5����Lvk4)^ �
����'`U�@�﫼&����L�'n��%-�j�	sZ�$q�L�h���9�xF�c�.KN!�ܶ�Oo��a�h8�PKqp<+��1��1GL�י�! x4��4*�I�.������c��q�s�c4\

(<$H
f}�E2G�F�,=�e}O%y���ɒ�w]���,�L,����ޝg�@a�� ���̳�W�1,; ����e�%z*i�kF�Q5�K�_R�Q=����L���*B��p���fó��$��y��y�zPˢY 3���<9n�@�_f4��Є�\I%F�Rά��"�D��']��'ݽ
׀�0[����Żǀ��׊c���#|����*��B$NW� @��h�Z@an8H�n���n�����|X��v�*����m0`�r< /�(�t}��G�����D�O|�bM�g���M��J�j��%i�F���01�c���UQ0<^�'<CE��f�����*�E��r&)�.�����	4S>9�s��	�P���9
����?2)�c�=(����(��*�Xbʻv̝��`��5���M��4^�WJ�=���HʎM�'������*�$0\��R��xj�����O�pl��Qػ�IO߻��X���i�`E�L�{����;8&�.���<������kR���	V(���ꨮ��u#���T��� ��,����n֤����a0�"�CݬC#��0T���Q�EL�`8PU�A1�����͖3ӈ
���`la����Ve�k� x��۶i�۞�zh��Z\�[����N��j��w8�o�2��\���%l��4K�m��?�-��Q���/���x�@��9�M�{g�rp��9+�ʏ�́u6�>���Y���`<�z���9�V�d���GG�"�n���)�XlyT2��{f]�v$X"k��4�<bs.o#��ͫW漍��0ż�s�t����&��ǘ�n���4�^������y��o��=�ߏE��[DZ��-��
hE LȀ�+���� �柑�!e2��Ć�6rD���o0u��l�Z2u��;����9N1��XQW*q+����v�Kz^"K�[���!0[`:o"N��R�U�Q�d{��c���)���f�6'���+�C��_�Q�[;*yk����v��RٌD 4 �i�԰H�5R�bOiɚ����oLfwtr�ۑ�>���p�M�����uq��h4y#+�(��Q�N�,����t��3['�VY�a�K��4Fg}���\GB`�0V��0�d�.���e 
@�;�9a��ڞ�A$h54�]�jjlN~�F�Ah0��
��Qk`�SiD��kԚTԨF�"Uł�^����Q�0���� ˚]%K�q>��Kkf�YFWZv'�٫��
hJ�`YTx���@�Q�8�r��1�yX7��'u��?��L/�lP��5U(6���
�T��j��\�Հ���ÊJo�����m9��m;g'�[��c`���/��S�i����*!��____�`�:�<P����~���@_�y�a8 �!��:�@�;�M�q��\��z��{���Ѥ�����:G�I�IM�QGI:Ζ̑�a��)0�玶1Qc�&�J�
�hqm�D��J@�nF���Xa6��	z <P	��:����*q���־Q��]�9�^��7�V�K}�s���{���ٹ�-?¤�hpТp�.�z�A���9��5��8a�Z���Θ�Arؿvs�^�w�rt�j�c�P���56v³ߢ�Z�������[ 0�c�C�)n��*���:+�Y�]H��oܵl��A��,��׍��W���;���ǅ@����Zu~�53�H�%�Vvw�ÊMj;~�GM`p���EM�r<�%|��)�:<Q�e�!4����
�$9��J�P�u�]j*�bV�G;��:=K~�i} ��Ke�����T�����?��>�_�����v-;OR����$"|U��0�;��ֵí�nGU^*ݻ���˹���:�`�G?�G���;�:�̢z���*��߃e�   %P�O�ڃ����^کd\�~��&�GR�St��A��Y���� �.���r��:w�Y�{���:�=��?�f�X|f�yT�N�U�-x5|���ze��Xި7Z;w7�ě�˞V�%�j�':���|)	��A�f�`o��\��c�ffN�\�=��l����8u�1����,�k��(��*PU�(-�������X���l҇�}��EÐ�,U�S������U�������GĊk�Ŵ�����8�g4��*ފxV�Քx���������:���l��Rp��� 7:R��2/y0�w��4���$B]��l�r�b����u[e��LL����\S�Q°oh�4ۥ7#�Y|E�2م%����.CV2Ge����i�0�52U���eXZ�"�Т��l\����������͛����$܎*	o���k�J�U儫�OT�@fT�)5��K�G,��>���>�W����̚�6��z�q���t@�\ob�Z�`��}2�����T@G�r
F�+��v������v�Z��*m�ϬY��@[ٟaN��%p@h�W�-
i����j쭫�ͺNtv�-5���;�
��y&�V<!3� ����k�;KJЫ�L��k�B~EekT�o�0���n���OXu��N�>$F�S��u0�9Q�a]�,A�+f*%ղ�l,�.�0 �%�a�Σ�	*g����-��C��m62h��k�<��A���6Ú?�sj��f��4%�V��z��\����
��<Z�`tls�3���t��f�
Ȏ	�|����]�y��Jsx6"sϡ~�aT�vA�<�,���(�.�ݨ�B)2ul�>%�����J|��,)�&0ؗ�����(���%l�N��`kݻ����{a�T�;eF�W���l
+���mrC�.�;M���h߬�k3�~�^��3=�r`��'fTН4���$B�:�<4�zP�5йZR,EV�q�q�r��
i
ON@r�Io��Y5�.1i��I��ǒ�wl���� �d[
�M��:�y%�рT�?���~���L �z4{N?J@ɒ:�ѥ5����N�g�k����?+(s�s�hx�P��G��	-���9Z�Hl��k��i�Z��2��|�	�c������<ݷ,z���ya��V#�o��J�V���f�fX`u��}����gsU���&��b(XA�H/.A�#8�tT�̍���u�����Q��>�0�o�r%s�[
�׷��6U��m����E�{���i0��I� ����
��j[Q��"��'���*i��O��O�� �**��MT�;�ԏo�ޫ���xt�sr4��Z��-�f�z�/�v����>�;�F��&!���"�����o=\�W
��-�7���������Y�rLG�@�4"��c�"0[8ׅo����Wь$��Z��/���֗�|�N.�\Dtu�ٛq,�LV����Jp�8
�)���S2�B}���;��?��7(      @   &  x�}�MN�@F��)r4����!���d��H!�DOOƶ I]����q��	:h��&b��a'�5�E��y�
��.��3+YZf6�z�Qf�r�s��SA:����,rf�2���L���e��6�2�˨���m�m�����m}n��}�(��ݽN��u���5{O k~��ە�2��ʜBU����ֽ�k?\V}$��4J�T��\�+��ӱO������$mG� �@(P��� Km ��*�T���2�������&�=�+Ⱦ�>ܛ&rw�Ȋ]��&�"ڶ�XQ��     