PGDMP         1                x            store    12.2    12.2 '    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    16601    store    DATABASE     �   CREATE DATABASE store WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE store;
                postgres    false                        2615    16602    store    SCHEMA        CREATE SCHEMA store;
    DROP SCHEMA store;
                postgres    false                        3079    16603 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            A           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
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
       store          postgres    false    205    6            B           0    0    customers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE store.customers_id_seq OWNED BY store.customers.id;
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
    senttoapprove boolean,
    senttopurchase boolean,
    invoicenumber character varying,
    totalprice bigint,
    resolveddate timestamp with time zone,
    customerid bigint,
    senttoprice boolean DEFAULT false
);
    DROP TABLE store.invoices;
       store         heap    postgres    false    207    6            �            1259    16634    nomenclatures_id_seq    SEQUENCE     |   CREATE SEQUENCE store.nomenclatures_id_seq
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
    price double precision,
    manufacturer character varying(50),
    nomenclature character varying(255) NOT NULL,
    type character varying(100),
    code character varying(20),
    submitdate timestamp with time zone,
    expireddate timestamp with time zone,
    categoryid bigint
);
     DROP TABLE store.nomenclatures;
       store         heap    postgres    false    209    6            �            1259    16643    purchases_id_seq    SEQUENCE     x   CREATE SEQUENCE store.purchases_id_seq
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
       store         heap    postgres    false    211    6            �
           2604    16652    customers id    DEFAULT     j   ALTER TABLE ONLY store.customers ALTER COLUMN id SET DEFAULT nextval('store.customers_id_seq'::regclass);
 :   ALTER TABLE store.customers ALTER COLUMN id DROP DEFAULT;
       store          postgres    false    206    205            1          0    16612    authorities 
   TABLE DATA           ?   COPY store.authorities (id, customerid, authority) FROM stdin;
    store          postgres    false    203   �-       2          0    16615 
   categories 
   TABLE DATA           ;   COPY store.categories (id, category, parentid) FROM stdin;
    store          postgres    false    204   .       3          0    16618 	   customers 
   TABLE DATA           T   COPY store.customers (id, login, firstname, lastname, password, active) FROM stdin;
    store          postgres    false    205   �.       6          0    16626    invoices 
   TABLE DATA           �   COPY store.invoices (id, datacreate, department, comment, ordernumber, senttoapprove, senttopurchase, invoicenumber, totalprice, resolveddate, customerid, senttoprice) FROM stdin;
    store          postgres    false    208   �/       8          0    16636 
   nomenclatures 
   TABLE DATA           �   COPY store.nomenclatures (id, comment, price, manufacturer, nomenclature, type, code, submitdate, expireddate, categoryid) FROM stdin;
    store          postgres    false    210   S0       :          0    16645 	   purchases 
   TABLE DATA           w   COPY store.purchases (id, invoiceid, nomenclatureid, count, approver, resolvingdate, comment, buyingprice) FROM stdin;
    store          postgres    false    212   mW       C           0    0    customers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('store.customers_id_seq', 4, true);
          store          postgres    false    206            D           0    0    invoices_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('store.invoices_id_seq', 14, true);
          store          postgres    false    207            E           0    0    nomenclatures_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('store.nomenclatures_id_seq', 1, false);
          store          postgres    false    209            F           0    0    purchases_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('store.purchases_id_seq', 12, true);
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
           2606    16664    nomenclatures equipment_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY store.nomenclatures
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY store.nomenclatures DROP CONSTRAINT equipment_pkey;
       store            postgres    false    210            �
           2606    16665    nomenclatures categoryid_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY store.nomenclatures
    ADD CONSTRAINT categoryid_fkey FOREIGN KEY (categoryid) REFERENCES store.categories(id) NOT VALID;
 F   ALTER TABLE ONLY store.nomenclatures DROP CONSTRAINT categoryid_fkey;
       store          postgres    false    210    204    2726            �
           2606    16670    authorities customerid_fkey 
   FK CONSTRAINT        ALTER TABLE ONLY store.authorities
    ADD CONSTRAINT customerid_fkey FOREIGN KEY (customerid) REFERENCES store.customers(id);
 D   ALTER TABLE ONLY store.authorities DROP CONSTRAINT customerid_fkey;
       store          postgres    false    205    203    2728            �
           2606    16675    purchases invoiceid_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY store.purchases
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES store.invoices(id) NOT VALID;
 A   ALTER TABLE ONLY store.purchases DROP CONSTRAINT invoiceid_fkey;
       store          postgres    false    208    212    2730            �
           2606    16680    purchases nomenclatureid_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY store.purchases
    ADD CONSTRAINT nomenclatureid_fkey FOREIGN KEY (nomenclatureid) REFERENCES store.nomenclatures(id) NOT VALID;
 F   ALTER TABLE ONLY store.purchases DROP CONSTRAINT nomenclatureid_fkey;
       store          postgres    false    2732    210    212            1   ;   x�3�4���q�wt����2�4�p�C]�C��9���&�&�\SNSd�̨/F��� �      2   �   x�-���@C��W�8��X��p�oZ��2���B~GfWn��$�LpG������U0H����`���"��Z��X�\C�Y�ޥ�D���M�B0�B2��9F�;���0F�^r-�p�B7B���<����	nyL�:���n镺]��=��o      3   �   x����r�0@���9X#	0�R����L��&#)\� !�Ч�M����7g�c�U(l
~�J��+&����IG�P3��
��"n�C�/�ɦ���_���Z��P��2"S+s�9����(�ѲI�+����U�`s�!�JB�gT(4��}ٺ�p+_n�`H�8�3B>���7E�߯����ĝ�b�W�b]��
a�d���<M{�}��2�	 �;      6   �   x�34�4202�5��54Q00�#mNgO� �x#CM��.l��x��¾�.v��N��/l����+\�ra��~��
�� �@6P1�������
r
�5�sScc�?2NC#cS30�3����,Cs]stg�9:C�eJg�@�e��F�p�,����� G��      8      x��}[�Ǖ�3�+�/�樫��UY9
4�7��}�8�`��n�������:$�c{C]�;^�5�gg66��E��H:b~�����*T�P�j�BDUY����<�<e����ɓ����'�&�L�%����3�� �䔼�.��uܒ+(-m7J&�*d�Z&�� �?��/����ɟ'��������o��@�MO������_��b�^�����ǡ�����z�-��d���}��z���̅��Aw0$���?|��j�q&���L�BI�0�$��L�b\ A�¢�Z4XEi�
j����iR �R�ts����k�`�!1�b*��-'E��G�����wvIu[���Fb�P��JX�F��"PPk{����/F� }����P�c�WY�����D�|
\�6EL��%(���������jD���i���o^
N�a�4�U����l�3 �a�q)l�-q�<�2���
���x�B+�����╗a�O��fAݤ@7. ـ`w��mG����Fj3nQexפGHz��V$=� =�������K���U�lP� ��2"��zL!���p܊��㗹�]��r�,%��c�4	.�-���e�\W�~�+�l�R�d�B��A���_�wLGN��2K��S!A�I`�@;����'gC^�e�0�\B�86�6����l��|jq���`zUHp�H�lpƩ�,���'��-���R��SbI�l:.MђY�h�dp�`$�D�
(�)��O8�l�
3��+�3Y,�:6��4̗Ѡ�TF����J���Se�,ҥ4�
�23ئR�)�O��Ytd�Ӡ�R؆��=hgd�w(0;\�y��N����??�^���):+��g\{z�3H��"�{��g
v�s"�s�65�!����l����+�\$tJ*28�Z����(<.�3�_J���"duy6-�I
S���`&Ɔ��]oFJ^1B�JHS��Dd�Qt�X�`	*2�Z�4�Y�i��BGS�'IV�\gc��j�d,�rBi�N>�|�-���`{0:D��Q �ԁ4Eg�p��"c�(��>�����P��X-J�Y��Iȵ��gY�k��2�*)їE�Gn)2�#c�� ��!�23EHf9R,���"��2zĚ�SJ����!� �eo�q��2�i��?ŵ��>���Td�+�S�)$FG=��C:ri��BD�n�����;!}k��c{ԋ!��@��},���Z	�L���9��߲��FaUQ����3\UpH`)m��
\�;�i�5o�3�.EulWa�v�;�3�X��5��R}�n�o38�������[�qo���N�*v��S�(��������LK���܊I�Sl�X.K�6v����	��nr��H ϸ�U�>;�y����1����;z8N6�	k�r�K��7���'��%4q�9PX�:J�-��V�q�@w��sVy��2��Y��Nw�'y/Є̲KG5�ܢiЅ��%��gVg�8
��,·6�e�bU���9*��4�7&=͔�8-ua� �|��7L�Fm+�aٯYhW�s�qS�v�f��e,�q-�N��\����N�?և��?$�ͪ�Y6���J�sx��CK����^$���P����9H ��CU� �-.F��F�!����p{��`^���bX�,��Z��j��9�w��@B �Pj�0����=��5��d���}��1s���%��K8�4W�
\���_N��<!�2_M^L���OcӞ���ů�
��Tk��
R&�j�:^�Đ�
�Z=��tP3�H&L[�5�<-�8"�7��V〯Վ�q�\�yAED9N�k�@�G�Z���&��/�:����`��HX��`�kk��iַ�F��n2A�%�l���/�C���/��g�����
����W�
��:yEd��"�P�I���ҿ:���T3�/&_��x�u�Y�/�A?���)i�#�ݼ�|/[ �ƏbD�ϥL�]�$��Y� TwO��A����3�l���4���=����[��1i7h^^\t�H��_����ykx�����w���tzڃ������o�{MN�!w�a<�ps���<$�q�!<R�Z0 �~�J@-/qJ�����ϒ��=������3��:٬o��4����Z��[�:٥�!sF,O��a�����'A{l2Q��h43Yi�V�����<���]%�`}�4+bo��G�ā=�/z���z'����}`�q�6sM���9=*��/���	}���me��N�[�?��{�zi�!��2�T�۝A�l<���.9lB}�Kcغ"�~������$�a�}��ӏ���`�^M�� ��'�O	\4�1�fը|N���0���*q:��{�0A'�L���j�z���Y)��xڠw���&ω��q�*�D��͑�(�}J(!G"�8�9Z�u�8ǫ�����n*�J�Ԫ��n]���7h�]|��c�ҟ������qN��wGD��~F�c��3x��5(۫��wF�W�4k��e�p�7���y8���ZW��6�	\[ܧ�����ZL��7U����ʯ$报v����O��O~���(mU��?��	��W�`UJ�Xx�N��}�P��Hd��O��~
�����rPr�[F:�]ހ?�v��fG�O4V��p�����*�=j��8s֔�N�m�dy�l����`z��2K�F�%���}t��>5�,�ٰ-F��	k�6N���C��1v�3E�(e��ph�+!ӓ�eVez$�H�Wr3{�B���c���%V�0��?7���=�Fϰ#��w�e���<�˰�l'7��;G�u$�Qc��#�#����oG�����!�'�[�햚��E��h�c�3>��08��SA>(�b�r
��C�>��Ҝ�$���2����OX�� /d��
˄a��9i���R�_�+�$��$�*�-t�Ѹ�f�iG��8�rϥ�Nr× �>���Krx���eg�!{���>����쫔����e�i������\?��!����Ds
;�?z0\��M�
~�<�-�L�	��,�
�=��@Z���,��+��_J!鉔��9�u�7��@���T]���^Ө�tύ���s�E�Rr��Z����~7�5V�h ڀ�B�Y :��Ÿ^DO5=u7�=mJUEմw���x|1z�\~����)tC���6�,��ƭ��|:�\�G�Z����`�F��p<*���`xU~��~��m�t�7�O�/Go�	؉z��i[�=��D�zԴ�
��;�VmA��fg'%�$��D�&6�Ϲ�6j�9��;TDN6.g��F�8<U��	�{:�۰���^rwv����R;��z��z�犸1����gu����Dn �Ve��5�l��'H�J"'�K�B�'����r�h"3�G��O�%�XHß揙��Z����Ũ�شx98gAK�F���G6v����;��p�
�ԕ������� (�v-%�1/��a.���f���B��%ŕȣ�ɈB�u��"\�b���e��`���+uV���$����$�@��YHG�pn�a:o0��9�둬 ��e���\۝����aTU��݌J��� Y��e�o�P�9n�<� �h}��[�f�Zp�y��`k���陧�� !��&�o$�%bv�Hn��'?�k����28�ݲ�ӶF�.� �������E���~HA���<Z6�ލ9
���(���en����1}����ߧ���ħi�GS.pI���?.��H��	��
��2�MAqtP0lJk�����ja0��7%cK��p��)�ʔ�'@�1�yI��s�x�_�!���Q�Ԓ0�Gbn�NZ�J
Da�%�Gz���E$�f�����@jQ
ջh<� 뭳�`�Bs^�����d�i0�#��@����D�%mR��,;��`t�3��9Uf�q�ƈ�S�F��v5�q���nq�~HV�5�<�x�y��u��Ax�z B��'?�	�����[�N��;g��<2�:'Ҵ^>�    �,2�ϱ=>;g�+��s<��#�c�Ĩ�	�W�.��6�h�ȿ�/��1�o|�{s8۾�lX$4�a�[~�3l������G�E����<:<��r3�������l����2��H�)
o����%AOIH�����	6����,�H1��?Sh�E�'��$�<V������V�>pe|+W3�87��΢��O^���s#��xoq�x��O��@	����:���)I�L�@�4%(�<�4��S�,�[��CR����Jnm��2�\`��8C��OVIsp��W����Y���Z�sZ�6 �tPh,����ą��4��!������ͣ}f�1V�S�f�6���7zP�&{��e��@C�1���/�M��ޞ�&�ĭ׭�mr��F�i�G���w�@n��#ϑVn�OI
<O�V�ur5��֑��pq�V��[;d�R۸�G��w`~o� q�Ig�J��{�*���Z>kF�
4�;Ɔ�5a�����Q/e� ��30d��Ay�c�9r��zr�<�A���%�5{J �@(��<�b���^Y��-��:���x�bi�:�L䖁�g� '��~�s�V�*�m��2��ݣf�Z�.�X�D�匔H�"r���7Oѭ�q��?"�%���B�X@�d5A!SJ�b�h�l���]�)HOg�����a�4��\��Wi�d
�͞�j����'h�Ք��?6��3c�ߓ���hjr�2���MW�b?���t@��1�$�qH�M3C]�	����z��+M�v�A����x@���9[�m%#�,�.y�9Ȕ9���[�/#�*"���@4�1���ٶDE���S��"* n)��B���BZ�A�;�tk�%�>#+���I�3�8�oؗbL���۩�!��}�;�WL���~6Gp��JgXo="M�.Ė����))?��X^�~�Pz}~�n���T����,Bo�� ���z'�L�dj8�voUo���HӒf�g�z�$nƓD����d������7J6�?���v����vi�.��@�W����hV����D3	��?�������gq����?�
�h���40p��(s!=	l���
�*+�ݍ٭¿�=f��FaH��m�����f ��-�?i]��z�θW��86�e0���Vŀz�������������i4��J�`�XgF��T���۱�:o������)Z���.`�q���/�J�V�,��_���HIT��눣�A߉~�Np�t ���fD6۝��\�A�A g�]�<�t��:F����I�݌3aׇ�O�#�N�f��QËz�d)�Z����J��V�:�����}"IXh��i���c�m '��Z���j�Z\�-V��޽�ǃ��۵m���JE����;m�����}y:�����y��c�D�ƹ���Z�f���Xl�j�h���F�O�C���>i��-��
�,���	�vʠ�n�@p�!`y�kk�;�n�iP�N�	ۥ�G��FF6A<�Gd�����EV6��p��)�13r�\�:%uU,�IS��@73Ю"�ՙ�+�H_M��W�'�_����M^�8�sE�b��Eˉ�1x��y1:\�/G'evCtʗ�ydC*�u(V:�Q?xm���e�ԙy!u�M-;�Is-?�1�Qش�t2���]���x]��E��2�}�9����bc๳�+��@�p�Q�&4�<�?�/wvw��\/m5&�mt(��I�X�i�̀�
�ݯ��CD9�@R(a2G��������Վv�u�g]��{;RbV��&�m��z����X(_��_I�n�פ��[����0&f��j�@ &�A� R֮G��Er��՝#�Q���z�]��0�P�"ڹ�h=M=B���N��P4xD*��xA ��*�X��F}]~�}���u�aL��uJ�$�zw�^m<[>��"�Ћ���n�_������=���w����6l������]����{�ѽ��h�_�A���{]��L�Hix>F6���9�M��#���b�Qd��Bw�6��٤��\�Y ����,;C"�I�;E��p���R��3�]�u�������d�TM�Y�a�5���-���~��1A���0��_&A�s)��7g1��[��Cn�m�o����'��v��I[Gd�c��8&�uliИ=��zİ�#��P��#��T�!MV�&1Gӗ�A��Pd�BͲ�³���<�<�Vu�@���Wj�61F��PѫvF���(309|p��䇀�;
C1�[������B�А�Z����pK��(�.5�B�6��@ា�ۺo٠����;?r���$��,mV�'��4A�u�Й1<ج~���Fr���ΩOnv�d��X�2q�Z.�U�j��Z��~چ�Rp.���OӉ�|(�_;���.�F�{�~�%�ˁD?�7���	���\# �s�Q^�/o[b��J�
bk�����Z�g�<<�'���b���,Z��_���h�)��ˢAf�S��Us�4�
��:�g� ����¢��d�/i��u$Nwn�bX=z�K��m����b���R�1�*�����<���§I�qs���0�=�!�.��2���F� ��A�aA�mi7�	���U�Y�D�6s}�g�$ü��9���V�fAS��}���=$2�t΀HoPkf@\���Լ��5y�ea��nɞ�9�Q�.��+#�^mJ�G��5���ό��<�̠v��	3����ĵL˃���{ ����ۇ���;q��m(�[���P�f�8��<�XŨ����HY~�&s#gn4�+�nT��e��fV��̲l���ƭb��뚧GCie��l�ݿ3��)�N+-��.cajU��L+WF+�=�x��=�u]�)�'�H|UCS=<�;�N�w�����i�,���;�b0��Ħ�	E��eT�yx0/�d7���Ak��E����<�4�)��
@��VΓ��"�H?��3�򙴻�o�
�pDV0Bu��ˬj4MX�\G��>��#��9�pNI�7�f��AW.N��A�m�g�� ����Юo�������~h��x�wO�b�� �T����\&&I1\c��I��__.IQ�+vRKZkC}�����x�=��e�Ѐ�T�Ԓߍh��Н��
O��Tm�H&�Y���*�P��^����Y������h�|u�K�Y�@�s<(�D��iQ4Q�+H�2+h�Œ��4(�tV��"4Lh�覂�(`|��WDo�(�3ZP5h�TM�*������v����j�5��w�C�-��dC@��ּ}��nP(hl�u��l�A�yPJ֣9�mm�|M�$�һA�����2yqm�O�-='o���o>����ӳ�n��fu��=��ϛ�۩n�n���~�}�f"s��Gg�J�m��<G���LH�̰k��L�ke!+o��O��4̲W$}j�Y��T��=4Q���bF��V��ѳ*g����êu�95EuS���h4�b�2t�VMY�������\Epf��`j[�v\� N���B������k�%���-K���AG��Q���ԁQ5I��qk�n�Q����2�%
`�A[öQ1�ve�2`L �Qf��_ Od�ざFm秱
��gN�;m�����w[���)���zG7PVjG;�����n�5#�?���e�>��#ZrA�W��I�O�M�j��4:�6��N0� �t����V��<�i;H���P��`�gT
7]�Ǣ��.�*��h�S[Yu�Y�@zӰu���3�U�PVSZ�k+�"1
h!�	�!:/��:*0�4F����Y��"
�?�\\���^�� G��n1�
L6�~Ex>���֥�@�YJ��
��&edq�g��eҪ��L�!�ϭ8�(�m�����[��%'��c"y��;p)En`�-ߨtn!�˄z��-�����.��˶dG8�J�=�
���%E���Aj�M��y���nG�T��<k��0u��.m�L    b�Z��Hy�m�YH<�dI�bR�)�ֳ���H�""�#߀a�j���1�h<�Ή�.p�UR�t�>�
N_X��
b�L7|���F�2���
)(�\I��"# Q+�k��x���#G0��Z�'V<
9B�9P�E='�:����3��f�]/�8�%]�uA�� waLY�.A�^&��!Ec4�A{N,��E�5f�-�����9f�/s���;f�mͧe-�4z��W5�����~{2�JO5���gNo1Q�.G~�����f0[���N[�Ur���U)�˔��Jd>�{�l
�+�a(EWKuOS�����ɭ����]��'+�eU�Q�t��
uF`D0h�-�gJ��.��0��y����2aï��)=n��~6�/� O@���������&
��4���K�'�����4��٥��y�J�s:����ui�)z��G�Yk��(��xM�b�b��c��Ԛ7Jh)���$k�:�v2�.4��9jYo�LYTP��2�Q��p��-߳`*���Ǯ�L :W�3�3��^�'��L��x��l�ƾ�O(p���%�a�s�q�E���騡�Z�2��nC-ܰ|�e��I�ݮ?��h(r��@�{ sے|R�;��n�F�"��e!I�RA2��e�����~X�S$MR����͂�Lf��ꪪaXP�n+�0r*V��x$D92TfV�d>�Jo��I� y��`�G��ue��m�ʧ�a�t�;#بF�����d��[���j��b���G١����CAS��:N����a���2� ��veA�v��|3~)O���S��)�Odc�2i�X7�Z	�s��#��Q������=�Ġ�L��D��<���D�mp���$����I_���|�H�@�4����;�Ӈ��f$<W�K���
�X\�;�Q��(<5_�-�5�G��%R�t���`6sʁr��h�ړq���[�f��t|[%�N��_l���p�X�����w.{���=�Hh��0�o\����q���?
�Tn]���'���g�u]�䞨~/]�.LQ�E��d�/��o����1#�����1y�䈹�� ���K��c*�K��*ܾ���@�Ob�EY�PƵ�4£{0:��#[��inb�w��7��L��"�L�]��2�ׄ�aGU&@�{Zݳ����]�(lVD�<�/��N�c�w!?�ٌ���%�����e�ҝ����T�|�Y�Wm�߭6��6_���Br���Qf!]��83S����e�t�8<ř{�dx��N&�s$���6��5_��º9�t�1�ң��<t��.z�?=�75�f���]2ϡތς�搻K&;�<7�Y��������
v���k�ɝS���,�5m��7#��x5hX񼆛&�q��֋� ����а�,�3�(7MԵTV L��^F����� )c�
j�H����tBnc�qH���I��q�8�J%y��*4�<SI����Z��|��4���Ә�Ag7t��5�
/�}���:��� a&:�,z|	� N
�J���!9m
��N��''x�O
��Z�3�N@8��?"��y�x�<)�ӫV_��e&Ha\�<�(\�J��[g~�҅1�``�,0��Y��]'t=�w��mG��B��i+y��aT��Q�X�!w��v�+���)o�Y��Bk��Y���bL�LGY?�y-�=����4�t�{ۗ�>:c䷆��R�}�痠���< ��:5����+����'��w���k�����G	�      :   �   x�}�M
�0���)<�H�Fs7"(��M�Z��B�B�y�F�F�B��I��f`�73
�@RBq,�K݌G�&��-���_�P�����ӿ}
�4�T���l��vU��hSZG�hС�X�zoO��v)K0��dBcj 8��G$W��hI� ���mW��!l��&}�2d��Wx��     