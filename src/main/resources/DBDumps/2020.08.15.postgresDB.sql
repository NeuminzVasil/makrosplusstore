PGDMP         4                x            postgres    12.2    12.2 (    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            A           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    2880                        2615    16393    store    SCHEMA        CREATE SCHEMA store;
    DROP SCHEMA store;
                postgres    false                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            B           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1            �            1259    16546    authorities    TABLE     �   CREATE TABLE store.authorities (
    id bigint NOT NULL,
    customerid bigint NOT NULL,
    authority character varying(50) NOT NULL
);
    DROP TABLE store.authorities;
       store         heap    postgres    false    6            �            1259    16432 
   categories    TABLE     �   CREATE TABLE store.categories (
    id bigint NOT NULL,
    category character varying(50) NOT NULL,
    parentid bigint NOT NULL
);
    DROP TABLE store.categories;
       store         heap    postgres    false    6            �            1259    16396 	   customers    TABLE     �   CREATE TABLE store.customers (
    id bigint NOT NULL,
    login character varying(80) NOT NULL,
    firstname character varying(40),
    lastname character varying(40),
    password character varying(255),
    active boolean DEFAULT false NOT NULL
);
    DROP TABLE store.customers;
       store         heap    postgres    false    6            �            1259    16394    customers_id_seq    SEQUENCE     x   CREATE SEQUENCE store.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE store.customers_id_seq;
       store          postgres    false    6    204            C           0    0    customers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE store.customers_id_seq OWNED BY store.customers.id;
          store          postgres    false    203            �            1259    16556    invoices_id_seq    SEQUENCE     w   CREATE SEQUENCE store.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE store.invoices_id_seq;
       store          postgres    false    6            �            1259    16482    invoices    TABLE     �  CREATE TABLE store.invoices (
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
       store         heap    postgres    false    210    6            �            1259    16594    nomenclatures_id_seq    SEQUENCE     |   CREATE SEQUENCE store.nomenclatures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE store.nomenclatures_id_seq;
       store          postgres    false    6            �            1259    16450 
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
       store         heap    postgres    false    211    6            �            1259    16597    purchases_id_seq    SEQUENCE     x   CREATE SEQUENCE store.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE store.purchases_id_seq;
       store          postgres    false    6            �            1259    16512 	   purchases    TABLE     I  CREATE TABLE store.purchases (
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
       store         heap    postgres    false    212    6            �
           2604    16399    customers id    DEFAULT     j   ALTER TABLE ONLY store.customers ALTER COLUMN id SET DEFAULT nextval('store.customers_id_seq'::regclass);
 :   ALTER TABLE store.customers ALTER COLUMN id DROP DEFAULT;
       store          postgres    false    204    203    204            7          0    16546    authorities 
   TABLE DATA           ?   COPY store.authorities (id, customerid, authority) FROM stdin;
    store          postgres    false    209   �.       3          0    16432 
   categories 
   TABLE DATA           ;   COPY store.categories (id, category, parentid) FROM stdin;
    store          postgres    false    205   �.       2          0    16396 	   customers 
   TABLE DATA           T   COPY store.customers (id, login, firstname, lastname, password, active) FROM stdin;
    store          postgres    false    204   �/       5          0    16482    invoices 
   TABLE DATA           �   COPY store.invoices (id, datacreate, department, comment, ordernumber, senttoapprove, senttopurchase, invoicenumber, totalprice, resolveddate, customerid, senttoprice) FROM stdin;
    store          postgres    false    207   }0       4          0    16450 
   nomenclatures 
   TABLE DATA           �   COPY store.nomenclatures (id, comment, price, manufacturer, nomenclature, type, code, submitdate, expireddate, categoryid) FROM stdin;
    store          postgres    false    206   �<       6          0    16512 	   purchases 
   TABLE DATA           w   COPY store.purchases (id, invoiceid, nomenclatureid, count, approver, resolvingdate, comment, buyingprice) FROM stdin;
    store          postgres    false    208   �c       D           0    0    customers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('store.customers_id_seq', 4, true);
          store          postgres    false    203            E           0    0    invoices_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('store.invoices_id_seq', 14, true);
          store          postgres    false    210            F           0    0    nomenclatures_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('store.nomenclatures_id_seq', 1, false);
          store          postgres    false    211            G           0    0    purchases_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('store.purchases_id_seq', 9, true);
          store          postgres    false    212            �
           2606    16521    purchases assetelements_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY store.purchases
    ADD CONSTRAINT assetelements_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY store.purchases DROP CONSTRAINT assetelements_pkey;
       store            postgres    false    208            �
           2606    16528    invoices assetorders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY store.invoices
    ADD CONSTRAINT assetorders_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY store.invoices DROP CONSTRAINT assetorders_pkey;
       store            postgres    false    207            �
           2606    16555    authorities auni 
   CONSTRAINT     [   ALTER TABLE ONLY store.authorities
    ADD CONSTRAINT auni UNIQUE (customerid, authority);
 9   ALTER TABLE ONLY store.authorities DROP CONSTRAINT auni;
       store            postgres    false    209    209            �
           2606    16436    categories categories_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY store.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY store.categories DROP CONSTRAINT categories_pkey;
       store            postgres    false    205            �
           2606    16401    customers customer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY store.customers
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY store.customers DROP CONSTRAINT customer_pkey;
       store            postgres    false    204            �
           2606    16458    nomenclatures equipment_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY store.nomenclatures
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY store.nomenclatures DROP CONSTRAINT equipment_pkey;
       store            postgres    false    206            �
           2606    16477    nomenclatures categoryid_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY store.nomenclatures
    ADD CONSTRAINT categoryid_fkey FOREIGN KEY (categoryid) REFERENCES store.categories(id) NOT VALID;
 F   ALTER TABLE ONLY store.nomenclatures DROP CONSTRAINT categoryid_fkey;
       store          postgres    false    2726    205    206            �
           2606    16549    authorities customerid_fkey 
   FK CONSTRAINT        ALTER TABLE ONLY store.authorities
    ADD CONSTRAINT customerid_fkey FOREIGN KEY (customerid) REFERENCES store.customers(id);
 D   ALTER TABLE ONLY store.authorities DROP CONSTRAINT customerid_fkey;
       store          postgres    false    204    2724    209            �
           2606    16534    purchases invoiceid_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY store.purchases
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES store.invoices(id) NOT VALID;
 A   ALTER TABLE ONLY store.purchases DROP CONSTRAINT invoiceid_fkey;
       store          postgres    false    208    207    2730            �
           2606    16539    purchases nomenclatureid_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY store.purchases
    ADD CONSTRAINT nomenclatureid_fkey FOREIGN KEY (nomenclatureid) REFERENCES store.nomenclatures(id) NOT VALID;
 F   ALTER TABLE ONLY store.purchases DROP CONSTRAINT nomenclatureid_fkey;
       store          postgres    false    206    208    2728            7   ;   x�3�4���q�wt����2�4�p�C]�C��9���&�&�\SNSd�̨/F��� �      3   �   x�-���@C��W�8��X��p�oZ��2���B~GfWn��$�LpG������U0H����`���"��Z��X�\C�Y�ޥ�D���M�B0�B2��9F�;���0F�^r-�p�B7B���<����	nyL�:���n镺]��=��o      2   �   x����r�0@���9X#	0�R����L��&#)\� !�Ч�M����7g�c�U(l
~�J��+&����IG�P3��
��"n�C�/�ɦ���_���Z��P��2"S+s�9����(�ѲI�+����U�`s�!�JB�gT(4��}ٺ�p+_n�`H�8�3B>���7E�߯����ĝ�b�W�b]��
a�d���<M{�}��2�	 �;      5   2  x��Z�nT����\�2���t��!�A��V�Al.VB9�*d�����a7N6�%,l��Df�ǌ=~�3��'IUu�����0����ꫪ���k�z���|'������
n_���rMp�˟���/��o��lkvw������ '�?�I>�K���͇	~Z�O��g���R���7�:ͤ(�j�\6��{w�pͬ�/��5�_��r�����.T?����|7?������]���'�=
w'a�2U�2=�S������A�přK�����!`K"�)!X[[�)�H��5)b ��H�Nd������~��g���0�\��F�	]\\��{I>��a�m"��:�ݛm绫mp)Ϝ7�h�IUxS��	yS�pY�f��ltpG��d�G� ����m֛�^��	,`?�M�m����Q��� ����L2�֊��x	l�B`���B�����=�@yM�{����.�}���l���Y[�~�����jV��A�4��(�k+ <�K�@���>]ND8�����{;���8wI!��f��|��^�[\T�u,��"<6�����Y�t�:Ȋ��kxj�cWc\`k%z��_]��nA�G1�m �(�B�C�+���i���������Sg�����N�v{�%Hpy�:��x�L׏ �*�����7@H�0���-R�^�-/�L���TYV.�u������5<UJ'���[�S�` �(R��{�.�v�,ø�,kS�a� 	��M�~`](���:+�hn���<V5� Q���T���C�KA}^<Ai(���7�'�FT�au�$kX����X��7=�aZ-���	T
s�
Ӕ����-���؛b���=?פw���c�h��d�1&�TiV�^��K�8�c�@e;CcN#��&�{��V�C��.��d�M�T<�ʚʼm�F���- �!���aR���L	WlA�P&��*�3�d
��i���پ�`ͤ,�l�矔�&dF��+Tti��_nq��]p�����W�{<i;�.�x��Ԩ!�J|���f|�&�%��I�F�
���d%��d���C���Х����� �C�@�T	�U:X��
��du�,�
�h��h�
�E�M�U��� �x�2LvRO'�q�����[7`�I*@���dܴ�@h�n 4�nK���>;�2:(��߃��C�n�H��a�I�e%���@?��ֲ�ƀ}`$�MnO9/}��m K�2�P�v�fI�g�X0�Ƃ`�֚|�.�|8B�q���X�Xat�҃F/W��-����
��?-��[7��q�Wh�F����kNQ��@�2���%���W0�OIq�Ð_���|ގN��&]�+آ�}��c�a����Z���_i���J�{@��%V!BkQˬ��[��@2�
�m��"�pª+5��~��G��15���_Hg����NϹ
rSɒ �۸�i1/{�n7�I�C�D�����; ��%.VN0lql�O���]L�ج ;�^G�$rcQ�_�?�D�G�q�_Z��o���I��;�F�11�7�C��l;�b�� |��%��	!����0�l��M���V6��*N�R[�	��,�m3�&i�̤8�FRH]�U!��%_���%�7!?������_\��y3�z!c�����w�ʮ���+�Q%�!��Z_Q(�5�5�����jԄ�@�����ryB�=<��-�����0��X�$+��KU� ��F�*��9�S�E����f���p���\K-u�	��b2�)�b,-��^Ե_�P�q��� N���cQ�y/=�na�~k�Z��qxD��Q�n�T���~����7"#T�a:����/��<Y_��~���T�B��Z��*���yV�DB�٢&�O>�L)F߮.�B`�T�1��h��ѐr<�4������$^k���H�E�$u��He��:�#"��T�Cq���ףԾ����뿤��v�"���b�L�O=�����Kplǳ
�Q�&�c���X���v�X:��T:�rk)�k�B-̖�[�%����Ly��b�T+l~^�Dܪ֡�������%/�Np���p��NGL�0|a�[ҩ�B�z���Xxm&��zPsı°����K:���N`�Li[lp���j�������A}O`ќ��H�ms�R�{U&xI��&:�)��������YM��BB�y�j����_��E0
'��^����]�� ��f�<<�W������:DYA���W�d$)~ U�u��?r����6����v�:n���EV�XYӵ%��N�U3�� *��:����%('�a^����@f���ih�mEC����5�P��.t&!pA�됷2a���*��Ay�ݝݝ7)�C[2����+66羉��@?�ڇ�R���������f���u�������;N�V�g��� �� ��b���խG)�B��hM�H:/�ֿ\A���%m���ˋ�j��D�*!X��*�ػ��oo%�����|����ūB��l�I�{��G	m���d��~���w��Ԑ:�½�BAf���?~$�?ӭ{��ؐ�����Q�uхd��Fj^� p���:�#ǖ�&�~��AD���h����N1]DS�
z�i�3��?g{�]��^���N�AR�ʚ����ۺn�Lt�ܣjG*R���^[�J�s�;�9�cXC��y��w]�ĐZY�ۈ�P��}C�+��\G9@�<�E���x*�y����XA�e3߻́%b���X[�D`i��|~1t#������&����R|M]�	
���g*>V���{��rEq��t���g���h��e%j��wʚc�p�=d(�U]�ac����n[!޻�\���ˈ%��$�ӏ-���X�*��,hl	u�s{4�/�_��T���WuY���ე�l�g�̸3�q���wr�f��gy��9�d>a���9����C���ڮ)2�S��p� #��A�TP����
�HW{�kxѶ��ݧ�n3��~X�=Ѕ�t�q|�FWc�b�	��f��w�u��sgΜ���T      4      x��}[�Ǖ�3�+�/�樫��UY9
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
��Z�3�N@8��?"��y�x�<)�ӫV_��e&Ha\�<�(\�J��[g~�҅1�``�,0��Y��]'t=�w��mG��B��i+y��aT��Q�X�!w��v�+���)o�Y��Bk��Y���bL�LGY?�y-�=����4�t�{ۗ�>:c䷆��R�}�痠���< ��:5����+����'��w���k�����G	�      6      x��][oW�~f~E�R�/�''�b×x$OZ#�H��4#=��d �8qd�I�$��ݗ]Ȳ�(�������N��>M�"%{��)��Wunu��TU;��,7�K�i��қ�V�1c\��T�Z�d�VP6������uxn~�--]{�q�%�,����v�R�l���f����7vLE�v��͂�66�}d�Zm�����+��
˶�j��J%���� �5�=�����qt;�?�090�=��<�<J�}��%�)����Ç�;[+�Z�Q[on�3ƍ��7�.E+LS|�<
�C���H?J�@� 9`tOнcѳ�=�Q
����f+nWk���V���}Va�ҌJ�
�K��^��MXa��k�F��'	�5��#���
Zq��⾵��=#y
�}H3����>3�G�F�����N���!�$|�]rh�S���3���	���͠E#	-�G|x�Hv
\+�/����6~L��8Znf���/���2�������ѿf��_`�k��U����B-��æ_����Q��l	���
�Sh6HK�XZ2�o�H�1p�\x�_.ǭU�2j<�z܂�A�o�:����jldů/�����9����O��@X��iX�����eV�lFכ���������������ѨCz@K �	�M�Q�����x�c�q�E�S�d��n�l��3��o�w��j�^ۈI�8W߈w��C�(&X��*��6�]�}uJXtJ�]i����V��f�*[i�h�*��Sԟ'_$�XG�A����1p �V�vN��۞<v$��ı}V�!s=�T�����Z�Q+<2�����K�>���� {����m�?ylG���c����6�K��Zk��w��jm�Vln�]�t�cL�1a�M�w��Fh��f�֮��=��_�~��#S�_i���?Z��\�ł���/-���7cЇ�=��� ث�;�}c*����|;-���C��:��ͤ�e���3ih�r ��һ�z4V��߭u�� 912n��*���fc-���k��|�^�ٝ���|�6���G}��:�Z�,��\gn���p=�u'���7Y�@p�����m6v�jD������
��;�y +b65ZjO��{��#�y�N��V��lrv.�:��� Y S~�|ְ�˜AJF���(��\{��kh�+�|�G���ut1Re!>$ن�s������� _�y��m�=�l�Re��I0j��sC�x�*!J��)�Ԕ�5V[���1���z��:�Ѻ��� d�;x��^��F��W���zw |����d�>�5�o��e3?��G�䛕v�I�H:��ܺ����l7�OfK�B8�����P��C=BS~���	W�C;jj��ύ�H����1(W��1��ݝ��͜!��:9�k�'0h�h���N,�X_PB
�(3�:�@P�qPx?��tJ7��q�<���z;�%Z��p{�8>���[q��\n�p��t'=����=槒��oУO�:�
�vZ�L^�UE�+�/����v�\x��t��o�Ű�X�`�]9�f�I�
�ϔ,�,��R�Id���Sdu�):B�:+��P�ϊ�'���([��2��\���#'�s�dD½�_2m���i;cڡ��Ϟv$�����rh+L���;;޺1o1�(P����<X3=��67wTs<��B �l��;�
 �y�t@ < �  � D'@����:�1x%�qqQ��c
���*ۚ�] rs�b�)�CK�T��f��V��C`?=�C�1.�s++MR�֖��ǍjȮ��L���^��c[]��h���>�x�ѭ�ԍ��yH�ݓdzii��R�٩5L�b�8^�7����]T��R(��D�8�b�㠸�b���)X�A�j�٪�W�V�p��^]Z"뇦}�"P_2��A���.���tS��|9]�^Z�9C�2
&�Gӌ6�Phnw-�*C}=�T�L�6GP�m�vչe+}�w���`��ގ�8�u�����o�f��n���m�����2(������=}5n)�kͭf�R�	�Z�����N������G߬ԛ����:�^�;q}[vR������SNr��T�ڴU=������*t�&	��0�ܸ�x�?\��{��Y�@����Xlwe'#�'%�x|A�����h��CӶ�,�+��ġ=��BX���i*��'�s������<:A�@�G]�F��M;��J�
h�zLASP�����f�)�%X���e�믿(.�D2��H�����Bs�ˁ�ynK�S�
mۼ�!me���1"]YŤ^�ؖ�)��z�"7�m>N���fW� �MhB�t��a�����
b�O�z����(!O�{���B'<]:�ЉN�N������Y|$���*@�@�b ���� � D'���'p %����O���y������9�Қ~HG 
����zW���܃p�.�
�N.!n��B Ƿ�@Ƴ;��	�qx=��uJ"&�����ҡ�-�w|1 ���Ŗ߃&z '/�� �������c��:���#�A�U��Ғ��jוxy���wL+�,�Eb,ƭ-�.4w����B�%�M�m�m���	���>g�M=�z䇬��D���ڊ]tPښh�ӓf�o�ݧ#1�#�����h}�v⇄�Z�1�߅�:��uƋVČ�Rl�p�Wds�0���͝��vL������̞Tp>�
:އ�+��L'��X�m����i�f��;��I���ѽ���ե���Ƃ����Y(���fO��U��M�x�B���1���KP[�������T�g'{�Z]�E��9$�R�O�5�2)3S���ٟN�%��p,}G�=U�����]℧�d���$��9��� ���c��2(�8G@�1@x;Q�S��V�QQ�Z�kלw
 4+H�Z������`A���_�sl�n�
|�[��rˮ@S2��J�(	��,x�@��S�^�G56�lL�`�<|([��&/�CN^�#�B��l԰��^�pX�[�R3+��kjr(��Y��5[���9��)_�X^X�d���QQSj;Mc�^���J�0.�k���w�ٔ8���gc{���~u�U��C2g`tg��AA.D��vʴp�FV�����QAA-�Î�+�;䃽�����R��E�jIy�~w�qHM�k<W�[���lIF���$k\�@��q�Bo2/�YG�R2J"#E�䍇䙲�ɈIV7�z�B���N�\�ÉW�3e]h�E��6}=?��ɮn~���!ha��Gw��Yc��ǣXh����ցj���)-v▲�/�_�[6��0���[�� uo�<�����n����
�e�%�u�my|)4��\r
jkKۂK�Ami[p�5���K�)�T\�[����#@0S��>�&��L���(�&x	�X���C9?�}CE%����
�1���`����P k�лhB_U�p`$�c�}�����@�{ZIa�@�AO'�W��)�H�,�
��g��1O�JwwY�I���J�vKo�*�U���e9E�����L
�ѧ3��&���tӟ�'���0as�z`Gt{�l5( �j�ޖ�*���B�ES�rdb~�b�#f��J�&��92�s.��(:�3P<�jV���U���U�Gaz4�:@��&o��QF���;lX�����K��^.��ӎ	�,uK��h�S>$�0af�=nlsc����Í�� EM��u�tEow]�\��9<#�y��N�=_༉��O.R;��Fށ��Jy�ʉ�伐=���y��YԚUN�L�փT��X�*�1|�R9�dz*#�/P�*�����Ωm�,-���CFoH��D�Ci��y��÷g8��:�${��m��it*��Ew#��Cٱ*�
�S?}�2���2/�,�b�l�e�����M��#T���	P���Q�F��9e+={ٝ���RE�)N�.��S�>��g4eL��x�
�x���tJ��J�� #�&Hu#H
��q���8A����@���    Q'և�$aFt�FN=D�җ1�b�y?D����l�7�
N�@I`��i|r�������?_YU9�oW����ş��3����; �>��x��t�����m��Ǉ�ǥ��O`=�-����{�ͥ�L7�+e��>����OU�"�I�6�/�(b~2�-7P�����eL;�Lb�����d\�H0��a�`�ô�zD��Yl��0�����`k�����E[���3��v���>�l^#$I�6�[�kT����]������QT��
���J��ZV�1=��hj�V�.υE[�\�BQ��mbFJ׊I�/�)O�T��v56�����
���I��V�jc��&��I�E�l1�|H�R��
�M�br�4���oXu�	�$}������)��h�r��XW�2�% A!��+��?�1
���p\$G���h
H��#��Sqڍ_�^��혋�r)$`�+[�x�k�)*��ҵ>;0��Y�#�}6`�U��٥�Xa(����ܣ�<����R���ܣ�z�*

9�'��"[��|��4��#7O��,O�ZTdyR�PY�-o��Tõ���/a�}���s��a�L��9�/<�σV�ٮVR�mׄ.��j7T��?�_�//\�=�2-{t�����pt���X�
Z÷�r���(Plq>�NR��\к?M�K��>��0 �z%�T��{B3T4){����-}`�C��(\�����c1|��@��P�`�'ǰC����0����N���_]q����􂳱U�㮪��K��#P�ᛮ⁂:5��4љu
����,��.*k�F���ڛƘ���;���-V`��b�]��}�\ϱ���L��*�`�e7	}��Y#X|�@=��0;u+�--I!��K˭xM�jBQҭ,g,V@�ݨ`�b�R����zmm�v���r���փY��!�Y�,�c)�Š��_�%��P
�׳j�ԥH�FP��R��(�<��j���V
��{��u�3U�d�b_�ھ 6o��J��8��tB�� �j���5<H&�
�=Y� 
$�9d�X�Uq�k�je��w�l�����H8s&�g˔����=ٖ�E��9�'T����R�?閶#�r�X֜o��t�����FE�1�E���[r���m�qĶ�%uL�8�C`�0ޤb���y���G����8ȿ���J5&��8
�( L�H��Cof���c��:a�.cK���/�����Cvm�"�]�iB�ty�]R�x���N�f�������r�r�֩�f[�s�Z�Sk������Jg�,/��Nm�ܮ�5�zy�]^ko�����V�y�0���IqE����v=�����4{�j ��V��@�NJ�z;}�!�ߵ�!3@;8��ς���j2Ȫnd�.�ַ�զYE�䔡p]���]��\m��q}���>N2��dy�Ƿ!TԁI
��6_e��"!�ͻ�!�乧L�����!ԫ�%g	9m����v"z��}m��������9;���"A)r:zy���|���+�_]�G�^?�����8�#m"Ҡ~J�P�9k�Ba��:k�"������
T+�5妝J5�w��K������{1�w����a��l��z-���0��=W�W{W���Y�k��p�q%��:����Z&��
�q��hY�Jy�)���j�V��F2ю�̌�"�%lx9
P:���ڃ##y{���> %��=
��A��d��
#���XH��"�fٸ��tO9��6V��������4��?8��)�B��z�����Xq`���J��%�ks+͍���I��U��F�SYn6��s�F��l��,�r����%e�)a�'�f
�Aj`�԰ш�Otz*=స.^7(� Q\�/�l:�B '�ǵ�]F��{�*g�@Z�s\\ӟ����x8�l�o�u�f�a��T�UK,�����͍|rn�Nk���k��>E�t�����
�ѫͧ'|��6��lf�JզF�����?o@z�cک�s��V��(��E� ݇B��ui�wrT³�$\hz�`!q:L�&7>x#﷝K~�D�u|K���zR�}�`�������}�2i~	�a�Zc���Ϟ�4��9B9�[�HR8V�#�g���6� �Oj�?�E��R���<Sz^�& �
$��V�?�����S���X����\S��ǥ%:Xo�}3=�J�t��WT��LY����,a<ĸc��͖q2�����,�dwSZ����)��H�=��+=m��W/���4�=�vB�
��\�ϖ .��ĵv���B��ֲ�CA��.mj勦n���,�.��|�ŲW k�)��'̘YfЅv��}���
��f��_
��@�c
�(���܃����̹���re��'�㷌*TU�A�fs�(��:>�2�ߣ;�w�8QFH��1<��}�.O%T �viL_�^�Z��U�����E��)8�-��QpD�eZ�Zc��&�A�:ܱd���kB'�7*@����o%�(t��rhI~��Q&�I����\���~����=g,5.N��Re������Y�ۥq���Y����N6x̙� |�scX��.�o����ؔh$B@��=��++Hj���a4t�Rn�1���[!��f	�ӕ��V���4.7�N�A�WzC5�֫�ç*���jWa�w	X8`�؅�(w�!i�:�x^74����e.=���9���K�H;"mC@~)h��#��?x��p)�o��}+b�P�̥�F����@/+Oi�����}q%�}�~�O�����*���r�0�,�F��&n��b����r29��N�*�*δ�rv��J�J3�р�|oǡI�H�n�Έ�%4���i�J��Q�CwQu�[}J2@��u4g��*v� ��_L����ɲ�Ɉǚd�Z�O��Ӡ>�:�ʈ'%qR�rehJ�+,�!s@.Δ�y0 X e]b���{A�.#r�
M������.U� �1z�V�ބ���{����YK*�O�>�`�&�b�$j��-?�v�����ßg�`I���}剃o��-6�U�Y(U�!�J�}�)Ӛ2�P�Z
�"�������I� $�x�p�d�
M�,�)��y��ߦ���	�s�.V���	N��)?�6G�*��2m*8$q7[뗧F<Fi"����"��ţ\{`x�hx��Fɍ9�j�1t��dQ���r��<�PQ�$��'^�
�z�`�����b��ͷW9Qcad��E���0b��{TeH紦7���vcS�
Q�^uO��/����s����['��"���
�P�gC/z�Y�(݅V�s��'�D�g#q(y
�`�i:�2&g9mu≓c����Y�s��u&�<9
N�9<]M(0�7�Y��hw�*�	�tYN���33F��nƠ�~f��'�\IE�9���/h��H����T���t���RO��Yݖ�����I����� )���WPg*�������&"#G��u`'�L�)���m���J�|�^8Ǖ[Ї`��B���c�;�^��>:�[9�
�7-+[�N_� ����OrYPb��N�>����SR�uq�����]��i��*d׿�����y��w}�U��U���%��TД�kA��{��^K4��}�HW_D�ly��YCӲL��t���X�␤:�~LSV�n�ޗ[��rz.�5[��i&�N!�e�+�h�>�Tha/�Io͢H�On����G���ѝ	髖�����]��(s�Q/��[��E���}@��-���
ח�S.%���
cX�SD�dmm�	s��N�G*�Ý��H���t=��|���D�%��6��W�Hv�/�UAPf�cV][�s�j6�J_"d�R�c���3=K����91��{�������pV�Yo�Ou�[(bG�)�
3I��k*���ZN�V���#}�n� }\[�.�Bߓ�	����j���6$�~��E$v/�$/t�A)2Џ�Қ(�wÑ*}H���g��t]v��~A��'t��qo�s|zOsAY0M� �  ��י�h�y	�J��8��.��v�
g��~�b�����)�N��{�z�Z�ס�7j�£�e�8PX��q�tM4��i1�+�xl$I�z�R��tZ�Fm����_�oV:�f��qQhs�G@!��U� ��x�TZ�CAm�c�����#�h��^#a��S��)�#�
E��[����C!��hU�W�1�.���c�H�_]|rp
iuD��4�%���<�V�*��\�A�pz�`n}�� =�ûơ��7/S\6.�H���t�e1�+�{��0���<<��y<�"���G�w��(��b.�*�?���(��7�p��qys�QY����2�h��sl�9��eq	�K��7���eq�=?�*~�-����T��eaj��sX(~F�Q�ز�;��w�ϒ/�m���p�n�,��J_oB�N��{M���)�#d�����01o�	]ߟ�[lYS����J*�DF+J���(�W��l�7��d/<1�"��~ ��A���t��|
�q��5��8q��E�#��e���Owg2����,	/�Ŕ���A)K��m��U�m8l�ئ@9��U9
ֶ�Q��6NM/!����Z��/..^`lW���aw+�H
��j`"��lTh�$�	h�;q�pjG�M���PP�u(4c��B���@��I��es?U��&|*�~{��n��Nޒg\�<e��a�G�r��×S�=�N��6`,��E�)��L�G]'M����ήJyS�
P΄,�Z�S �dD��h1���s�d��ʷ�����Ee���s�TƤ@m
'�h4AP��ɛ([�{��9��9��ߑ��{�1�\ ��9�*�aA�d_�Q�=����=XG���7I]�ֲ�BW5�`�x�K��m�ve�q�����M0�;͍9�Xު�ŝJ���Y`���*t��ٮ��"&�z��~���1>�U�Z���v��c�E�r�*ʻ��
�U��=�U$�����(F͵x=�h��_�.:���d&p1�۪fǷ�S�!�E[�gG�\���G�g��0��8)LG0��a���M�Lr��λA
ոUW��8��2�\m���j�lP�N��g[�eU|j�c��NX�"��Ͳ�����lFaϭ z��[��A7'�E�)ai��V��S���3��
[��������{)�	�oUh��476*�N	�^s\z�lSRx�w�!��Ͼ�3���W�"�Z|/H�R~�}��fK������S��W     