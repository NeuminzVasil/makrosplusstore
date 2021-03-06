PGDMP          +            	    x         
   makrosfactory    12.2    12.2 %    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    13318 
   makrosfactory    DATABASE     �   CREATE DATABASE makrosfactory WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE makrosfactory;
                postgres    false            =           0    0    DATABASE makrosfactory    COMMENT     S   COMMENT ON DATABASE makrosfactory IS 'default administrative connection database';
                   postgres    false    2876                        2615    16393    store    SCHEMA        CREATE SCHEMA store;
    DROP SCHEMA store;
                postgres    false                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            >           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
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
       store          postgres    false    6    204            ?           0    0    customers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE store.customers_id_seq OWNED BY store.customers.id;
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
    totalprice double precision,
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
       store          postgres    false    204    203    204            3          0    16546    authorities 
   TABLE DATA           ?   COPY store.authorities (id, customerid, authority) FROM stdin;
    store          postgres    false    209   U*       /          0    16432 
   categories 
   TABLE DATA           ;   COPY store.categories (id, category, parentid) FROM stdin;
    store          postgres    false    205   �*       .          0    16396 	   customers 
   TABLE DATA           T   COPY store.customers (id, login, firstname, lastname, password, active) FROM stdin;
    store          postgres    false    204   I+       1          0    16482    invoices 
   TABLE DATA           �   COPY store.invoices (id, datacreate, department, comment, ordernumber, senttoapprove, senttopurchase, invoicenumber, totalprice, resolveddate, customerid, senttoprice) FROM stdin;
    store          postgres    false    207   �,       0          0    16450 
   nomenclatures 
   TABLE DATA           �   COPY store.nomenclatures (id, comment, price, manufacturer, nomenclature, code, submitdate, expireddate, categoryid) FROM stdin;
    store          postgres    false    206   ):       2          0    16512 	   purchases 
   TABLE DATA           w   COPY store.purchases (id, invoiceid, nomenclatureid, count, approver, resolvingdate, comment, buyingprice) FROM stdin;
    store          postgres    false    208   qb       @           0    0    customers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('store.customers_id_seq', 15, true);
          store          postgres    false    203            A           0    0    invoices_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('store.invoices_id_seq', 1548, true);
          store          postgres    false    210            B           0    0    nomenclatures_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('store.nomenclatures_id_seq', 603, true);
          store          postgres    false    211            C           0    0    purchases_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('store.purchases_id_seq', 3812, true);
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
           2606    16549    authorities customerid_fkey 
   FK CONSTRAINT        ALTER TABLE ONLY store.authorities
    ADD CONSTRAINT customerid_fkey FOREIGN KEY (customerid) REFERENCES store.customers(id);
 D   ALTER TABLE ONLY store.authorities DROP CONSTRAINT customerid_fkey;
       store          postgres    false    209    2724    204            �
           2606    16534    purchases invoiceid_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY store.purchases
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES store.invoices(id) NOT VALID;
 A   ALTER TABLE ONLY store.purchases DROP CONSTRAINT invoiceid_fkey;
       store          postgres    false    208    2728    207            3   ;   x�3�4���q�wt����2�4�p�C]�C��9���&�&�\SNSd�̨/F��� �      /   �   x�-���@C��W�8��X��p�oZ��2���B~GfWn��$�LpG������U0H����`���"��Z��X�\C�Y�ޥ�D���M�B0�B2��9F�;���0F�^r-�p�B7B���<����	nyL�:���n镺]��=��o      .   .  x���Ko�@���w�V�겕R�[4)�n&2�T:�}���t7�s殾L��,�DfbpRQ�
6%�E�_�����6�G"��9��ө7O����X��i��3��z$
���>�� J&�Lx�x0��"��
�݄/%,�Q�"S�Թ��քw7�ڛ�x���ުot0�~��]�E�=�_e�za5K�g��a3��LK��d���Z�D_��l+�Ჺ���}m]�ɟGK=�_�4�a������0�tAn3��]7T]��
n���Z!mt5�VhM�k���zZ      1   �
  x��Z[��~~E?�j�Q]���
K�g'�%D�&�B�DH�	XA���lc'yK4;����B�_�/�9���o�3�b��;�չ~�⚳�`<2���U��06X�z�R�~���z�?ʿɿN����zq���o�[��|;�������N"�7�$�o|tzx�䏆��1Z��5��
l���v�ecW>�v�kf��
�X?����Ջ�/�~Eq��u>��۰v��	>8��A��au7W���Uf u�aߏ?,��>h��9q)�3��m؂tJVVVl
8R�l
C�@v|(�^����$N���Ϸ��I��:<��֦�>=\\[�f�O�?� ��b�������R�9mj	���ԦrӦpY֣��k��>��ד�O�1 2��7	Ho������q�G8(��/@�w,��A�$sh���� ;�<X6�l��<���(ߒ�=���ō:H�͈�c�1k�կS6��Y͂��(h@s���m9�}��:���C��&"<�&�{^��ۤ�q��ow�B(��,��:ヌ)6����>oz��yK>
� �w�$�4����x�FG��8��J�v:� ��- ܛ�Y6l��F`y��)8<���rq�Ơ�
���ߝ� ���'�6����J,`��%h�~ㅳez��V�=�q�^��@��'�Cf��2my�g��=�ʲp��z���}�F��T)��O򇘧��5�E�Zo| �Q��d1ƭ��m"
9G��	�����1��nC7�x�U5'Q��*U���C�A�
���*�P>m�.�����Qv���JV01����p@�nô����f�9�)�w��L�Yo���٨i�oG�F�x&S�>��J����Z�Os,�W����2ö4�4�A�5I��p��:ؤu�$%ClB���cP~,����r�|�p�}�u?�*m#S�%[�/ɸ�
�G"�� +�����$�s��!'L(7��_b�j��89&I�M�7�"���>�4�n3��Ɩ�>ʮ�)
���O�Px��6/��*�Y	y�
�U	�k-�TT�>`�ɒE���^[�x�y�Lhm�҅D��� ��?�D@�	�N�	J"P���`������� >����v@gL=hph�ۋE-�_W���?-��+�?�t�W(چY�+Na��$�rk͏XQh�"^��|H�d�(�N��rt�n9�C8�u��[�� ���b�8��������vhϬ�D@�0<`"v��Y��~+��>����ee����.��N����h��T�Ti��b)SV��v���P�6EY#g��n�~c�S��⁘�=0t(����	x���W`7��	�eT`���k2�����/-W߅s��$�Ρ��#�
z?!�7`��Y�KP#|�Ĺ���M�ܶ�N10ܠ��E,�vj�L2�B�^Hm ��,fu�O��>�"%>h��xRH��Jz�8F/�����vI�(�����/.^۸��?!��D���k�����h�J�w�[#)㒢�P����xa�(�P�T���h�>��F�Ҙ���ף��lH3�������}S��T�sBt�E4�21��>�(qH�������@��ۍZ�m��� ���}{`iXou�N�9���7L��ٕK�I*�a �}�؟	n
�� lOت �>�kW�^K���3A��jUO���'��Ƹ+*O����4�Sؕ�U�B��0ݫ����O��<Y_?���Z�B:�6�Ku�ˣ��jW�#�����`:��_�Hs@>�f���]؇R�I@�^�Z���L(ƓL���谝�k-s$MD��U�U�(�(C�i�xmo�R	�iw3Q���)R�S��/��v@��q�a~��[2?
��5A/�~�*�3�֊�����`�~ڹb��cS�L�c?B1^K2*a���He�Ր��Ә3�"�ͦ��\P����q�ۀ���c��7T
����d�[o/��7�8LȲ���u]̹�n�K�~�!�����8#^FTeF+[����D0�>��R�ŭ���Ț�.T���Z�C��9�mCgN�-�V��K�6��w����Y�-P:d�ꁐC����lb���ڂ�S�`��Ҷ
r�����t7v��󚺝C�h���|�21�ku�!�Q�8e��mB��z ��)�j����K͢]�3?��՟�OQ'��^���Ih��Ľ�c������偂�_�(+��}�ٓH��T�tM�e�J���M(�����:��C��CVf���kG��Rc ,�T~�����@� ���w/�G�ށ�*�a��Z�(bX`͚�/0a�|d�.�Q2ĭL�4�2��n��e�����J�I�ҵ��z�����^g�VC�X,U8Ō�z��-�b��s��D�7^b/ᶫ�a���مg�P5a�\��M�"�(�B(9��Igsn��
�*�1h� ����j���2!H*D������+���ߝ�t����y�tz4�b���w�-��`��~�s�G�Rjb����P�֐g�������;��A�s�F����e�&�J�6R�J�{ب(��vo��xԞ[�zO�͜p
��қ�Y��L+��c����A��_ Ɉ�a�(V�(k�����a��4X�kN�T㠞&�܂T��8�����}Xc�6)}O�3O�� ������C���n��%��t�vP�(��2%�.5����XA�c3_�̀%�`�K{X��������н�(.��q��׀��5c� ~K��>5�(�T�X�_��e��%�ղ�ኃ������f�=�)���z�[E�a:wVP�CB��2��d���x�c��USj����6�o��sk�a���$hl���%5c��
&���G�`VUִ%f�"�G��L�wA�_����N�\P�>�,.>߻��'���7b ξ'�jst�v����b��%� i�
"W`�y�i�b��{zq�GP�a�O!�- .Yh�tc��*�]��Ԫd#�k/�e�	��am��Zzع����^)�c������䧝ֆA�5�V�X�*ͪ�F\/vfSa{��
�8Μ�aU�UM�����#I������ɒKS��Y�/��M���Ώ��F[~;!�E ��؄�д���~zU��)����l�~O�L�Q���7R��TcF�"�J�23���;��h �&�t��6��2��N���ugZ�-��2��W��f�����?��n5����sL�ki�b
1t����f_�Ȥ��x�����@B���16�8?���A�A��$
� X�]�y}\y�����t$�Գ��Y����
?���s�
%F�f�{N� 
�F}R���_c9~��Ƌ+��c�x�Y����.�>u.��9��g��-�����Y2����v�L��Nd��UՑ�GG����6�      0      x��}�sG��g����2A��DUuU?<� �,��	R�x��h -& �D_܄-��΅w�qsqw1��ޙݻ�pq���hdɎؿ ��.��]�]
���X$؏�zde�2++!}�2���������k��32�j��կ�էW��^̾��P�ԥOf���ξ��}K�·�9x����W��x��P%�����j�d2���yo�{k���x�
>:
��p��>`���8���މu6�8=
.˳��K)��
O�iدl��U{�*�����Y��>ۊU�a�~{�B���=aW8�Ԣ��%�����@��^��%}�2��\�������V�?8��� <~�x�Q�b�2ɇK��2�����<�h&w�io-ٶ�a�"<�u�0��NVv7z�����н�04_=������k�8��K��ұ�7���̞í�W�����l�W�V�'ne�k�g����l\�~C���5���P|�w案�'[��$���a���!���rB���N�;���/G�pT���R_R&�[���a�o9�a���>�6���}Q�>u����ME
�P�6�A� /��I�����w㴈�o`c#�{ �IfJ��\z#V�4���꿩%��K�G�ј��p�^8%�}ƙ�H�����\.$�`]
Z�ef*n�t>1Y�������7e��\�)+0�eL��2�HFʖy\��v	[�������;uE���4oEӦ�X���(Iv����J�m�"�j\�7�*W'��Қ�
��\���ϹJ΋\]H���9"��K���1��=�7ec�x�����!G�y����z(z�ćS�f��G�ȸ;�!Gĵ]5j�����56N�
���}�����QI#���Q���ؾ���;P�Ѱ1Z��@>���q&��a�4FL1J���Z�Ƥ�����
H�"&Ѩ�
��Ƭ���Ԅ�6�N��V��F�Ȫ�� 3���0̑M��7J愡[��[���2��i
4$t��ˑ9}���F���8���g�#�!5�6�Hq��0�q�`����{��5qR�h�r����r@-U�7Б
�*^ ���\2����
�
\F���կg����No����g�l;�4�N���A�;��h��L��Ƀv�"��F��*cJV���X��pZ�0fC[ޫ��*��08#�QrTO`�g��C[�P���C�5A������q��u������G�P���Jפ�c^n�'Ư쾙�Ik'
K��b)�&]����0���%��+;�ݩĈ��z�ܬo�ϊVw8�&����i��L��C�p�a�����mZ=�a��Oέnor�.�G�eY��A�b�5��*�46��W�����v��Cؚ�8O�ON¤��k�Ui
�$��3����ՏX��9[�@/�wl�F��-�w4�)�a��a�t`� H[��S��B9�#��_(^-��`�^^=�>��iŋ_����݆up������.����=.�=6}�O@K�>����^���b����0+ss�5�ƁM��:�m7�?Hƍ���\�p�H�:�����1�
W˧6�<
�7!`j����+a�5����*|S���%H>A�/ᩏ��=�y�e	d����0� � v�����GΦ����������cҺ8?�_�z�Z�9 ��`|��c���9!sW`j��곫_�P�8��g��W5� w��R��A��	G��T�����a���[y�l67�$�����~�K�V�Iv)�[�ș�%�P�\�8�j�Emgҙw��!#Y�U�
���|�T~m��V	;\_%��a�8[��d���R2>��
�I����p�u��k_TS�[%> 0�Q�R%��d=�bd\_���K���ݩ4�no4$O��a�'G- п���%9�n8��1F��#�«O���?+�X�������@`�_���JG�g|��e ���^&��޳l��aŖ,�V0�\O*�u3!�������=�X���d�r}�{�z �&�� �CA���?ū!@$�*��I�N�np>�߃Q7��k�{�����/�����j�.�t�������^gp
���u6o�K���}�TpF7���4�A�l�k��6s\3pl^ `�r^��(�/J_��R���O�4
�=��O�{�rw�����R�>ʌ���ù�f��(u�D��;����W�5�F���>��l���Ķ��C����p�
*��g�
��ߠ�i�+��"|1�����Il�Qi�08��@��G���RF�b��d���
?a58V����ݞ��#1Nގ�	�ĺHY!��6�0��b<G��}�9xO�U"-T�/c��'__�^�P���1��x֌�?ʲDZ�������� "}��y�%�t+~P[o�������x�Vopއ���~ܛ�j��1�w�j�����h0I5ܰa!TO&;D�f�ŕO�V�k@O��yM�ڽ�^��I���9�N����2����es_\@��Q�[55ОȚ�9�����TeD�)����/"��	�'�����b���^�j�bc&SD�٦,iћ�B�����I�&XP�o��0��6���M��!��-;�����%"�X�p<y���i���&��`<�T�`4���8x��A���~�#w1y��/A����=|��Z��-�
�kp2��:���N��f�~�%�c/^h��@@�~��ڄ�*RX�^���cl��5�h��g}�|��I��h���6��d���ťk:0�9��$[���&sk�(uz����b4�'Q��VrY��)�����sr��"6P�[���SÃ��G�P5M��a��|Rɱ�F{����+�؀��z����.?2+%�)��=��foԶ(��x�.s.���$m��9���<A���m �T0��,\ =�����$;|,���&��:��K8��}�x>F����c_ξ�௝�tN9\XUe��N0�kl�7��@�rId�"��#ғ1�Q~��Ǩ�ц` Tf��W����#s�tM���/���ķK,!���?�}��	�z�<z�����og�V#O?2_&Æ?2-��Blj#���^��W@ܭx�-rY�!�B!R�5�	 �Q^w�ǣ���W|ᙫ��l���9cz8(����}�\v���e�5�Th�-�cԬ��~���
���~���� a���:g���ɩDp���&as֫�)*U�r���%��
�EY�?�`�)����/3aNdL��*Q�?�&&�@�=�&��s=_o_F�>{Hs+�{�n��K�LC
f�Q�p��)	������U=S�A���4[��x�.�E��9����O��
��S\.O@e?��F��4[!0�xg��!2��M�ߧ�"Y�(�_�8"O��竄��g�Y�3���y	w�$J�eW��G��l��{ (J�l4���<�	�%���68��Y8�5���B�͆�r)l	`lgg�4v�M�$[ٯ��EBo���#r��s���i���L��a�M^,i�S��l��sLj�����P����/q�x�!�!@;N�0���Pv#U�%tJ��*�����j(��l�N���4$[w���{w���!��Ɲ=r�.�=��6��k���d ���ݝU����<�_߱6�b��V��on�K�!�ykݱp*VqB9i5jMh�$	�������u��]���r��H�4 kՊ�?�ל�|�O{��>!�0�f\:K� ]��	J4�A@!.2�S�}?Z��A;?��������4���e
��sP��Τ��[fy0�y�u�0D�-��~b�	F6��H}4@wc@���b���n8�����
LÛ{V0��&��,��丷���v9IB]I�1�����gYw�@�2O�;�����a�d��M��݃��/rm������	i���-�S�/���VFwx�0��*��Mr��
#+��Kn1z���;�aZf���+i!�.0ٽS���JP�^Ĉ�Yڃg��2[%��|�)W6�nݪ8�ۚ�������3*�Zp�xBy5���l�    F�KeD_ ��������AK4�yC2wY};��xj�j@+���#�^�<���,�e�Q�΋UV%�
�)�=�c��2
r�Edw���[�ī0��cG9l�k�W{�Auo��b�b�񽭚t�Vg�Ckw�������oY	I�p�ZgV7���u����w{�p`� �BP�❓w�~��jwZ��cyd����<����a�\y�vI��d{U���X˦{����l�vos�kmcd�ނ��X �!["�x�	�&�Yo��Y
�X�\�:/��F89CbgxFj�G�p��DJ.��[�K&?^��%<D�e\Orq�߶���j�����H˻�T����t�;�Y�D���:u>�� �-*0O�Cb�%�����F�v@���꣐t�i@Z���
anm�@µ�*��� ��ڻ)��,�kFr�eQ�N�-�#��1)�Y��<�{J�
�Ri���d�_���~aUp���D�B�jf�GOnLw�^L�U� c���� �&U;�Mx�r���x���̸�d/�v�n��~���=�dO��/����bj���G��Hg}���`4��M`�<���	�Iv��	��4!h|���[T�*�|�q��4![��+�lEU	ɗ��xQOb�,
 T�N4�Ck�u�	����!~����\����>8H�yoݦ�
� �h�	vԄ�>h��#�r�7;[�lsY&�2/�j�	xn���%`�5��+�7��o
n�J���?WA2��O�T��i`WI���K��^�����W�RQ/i�cjc�"��Z�(6��f��A�B�J�-F���"���z�5{+6�/�k�m-	v�%�N���Fs]� �#����
`LAw�zg�Q.��܎x K^�f����~�CB�~
��)
Ǹ��rt���8<u�= e�`:zp>��&z���'S�Zf�t:��1N�"�̧�\}��)遬ܞ �yB����b,B]Hv�_F�t%Z��Z��os,#�f<�aǀ��Sz�ćK8�\���Q��F�U��>&d%{xkɠj6���JZ�/���A���[���p�������oȌo�w�ˌ���yl�ml�|�q@j �v�M���w�
���[�.��:*1d�(���p��B!�+Z��l;�N�Ql��5��(+g�&8*(�:#����z���!����ޤ3���2O��?��!�ì�}K%0Y�`�'��:;!������$��xR~iUm��E���SgCz�.��g��~������]���TFlȵ�J����cD�M��%#��	��olRM�<|���voJ�9�3RsDx��!��J=���Wq�,��ƭ����3�^�dib6-�$Ř��R~�0���_2�SȀ=&�g�JAAB]/I�Q42	���Q��)i���ˤ K�˄�Kx����W��y#�9��<%�ώ?m�N�һ`�셏�YR��@ٚ��w� v�ax,�a�b�߹~[��3�{���m����J|1Q�����]�g��u�<�J�x?��aɀHC(��B��!��$���}+3H*ɧt8v��@���܊�����
W8�ZO,��-A����:`V�b�Ue@�|�1i�#KQ�=aF���L��O���67��H�}��;��0��8b��!��jD_p�}��i
>�{�q��=�
�� N��v`��W��:�Ln�0���d=���%�z;�l��u/!G��F�+�$��_G�7]�ܜ�7K���P��U�0��r�#w�kuC�D��"�,V!�
.|��j�{M��+��`�'�����[F���8zӮ��G�SP��pd��HƗ*�G(����+�w��cp_D�*��z	ʍ@We�Fǁ�Q�kdep|����[�0{���J0�^`�ǃ���ݳ��:��t��������?mq��ywwkr�E�{�v&Z_p������$����X��� �p*�ɳ�CɯK����Y:���D�{��X����cH�-��5�Y`yK)���~�*'&�[��P�[w6�V���x�(v������]�fm��We�#]�R&~���3������a
/�����/Y?2��>�t��\��z�B_^���ݻ���e�d4�h�R�Hd��V<�W�jJ%��8�(I��S�TH.��e�9�<d�mY���*z���L"dŵ�x{���$>�F�~F3�]��u4E
#1ޞ��=���dO�1�wS���U|X@����*�a���J���ͨ&;�`�O���D܌�Ob�J�R��pFZ?P,���b+ �t�,�!}uD�pX:>
I�B"��^������ܜ�`N��cNZ�����,�=Jꇶ�A'd~`��@�_�nv���+�:��y��D��N#V'/?�`���n�hq�,��q���]����c��0���d�Cy�,,¹��B�%���E���Y�����
zpK��]�9���N��s�����(��K�8���ϣ�j?��=�d\�Nc�,��F�%��&�&W,q�VD�X$����綊�ւA��\J�c�`��yI\hc���e�f�q�����2�D#n8�>'�B�,�|͉m�4
G�o[��4_�#�j��vO+����Z���馦m��0�F�93IѢ�-M��d
�1"�\����mM���
�"U����Nx��)i��y�m/��I%�ZTH���C=�΍s��������|�O#�+f�"_���<�\������9u�5���T�( ��٧E��6�H�?��'�~��yt���� W�KT[d�^|(}ɤ�+�-x�q\9�6�Dž�\H&s+�(R�\�5t�FK�{r�h)*U��2&;_z�@MU*����nWp*ewVTb�������L4.��Ya��z�C��P�����fM?x���b@�����ɢ']�H;Y��d���C�w��
�e�$Ky�ѷ���	8u,�ը�\�Za~�B�e�#�0L�>��K��A��K��>��`�tFf	.2+������8�q9E�b2^/�S�C��B��)
�Sc�C��w�bi�Q�����cEK��c6N�Ťmy��#3Ś�_3W5�bM\��.C
醩F��V�BZ�R���e���F�_��2e��8����F��m
i���@փ�D|����_6(AMz��A~Jf%H��eX�'�4�*�M���/�u$�
�QV+����hfh$�l�f�A�����dYo:�Xs^�\�H�tn|</���Я\!��kK��9-�F#N�r�\3��\uD.���V+�%�@ŧX���NE!�$�rp�%�� ��r����'���
���|�g�1������v��g�����k.�k蔡tE(ſ\��E�̫X��4�dאY��#ەC�:W��N\<d'�inqрu�=���� ��D�u*~|>�V�'뛶W�#)��ђEZ)�+��p��H-z/ݥȕhd�R�a��V�0��XAfJ�..}��,�B�$��E=,�
�m���hɊ�Y�@���JÐMp�F��	ٽcL	Y�lY�eҡ����L{nEOP/�3?��wMUD��t+��i��z&z�\�.����Pki2�š\���m�Y�e�(��F1Ta�Ԛ�X�s	C�J0����7$O���d�}�b)L	�/��
�*ߢ.�=UG6��'�0�I�`UC����c�]D����!Y��T���x6�~]��c��п� _fԿ��V}4\{0У���*8�S�{���,l{��q9�K�������҃{�ƔV��g�D+:�X�DEG�}nEk�3���q!���pju�G�Nh��=���F�7���I���U�r����8�
T�&�Q�XTf�w���� ˳[�9͹H�<U�G��)�*7m�h:�{?:ǫ?^��fGG�i�T���K�L;��4f^��Q�e�j"��-�SS<k�m*LດǢY�?ё�j MjM��&l���GqҖ�	U߄�1f�<l�G%0>��kL�4ڦ`|����mU�~���[	 A��5�-�e}�B=Ofǃ�)r]����ތ���h{"�b	���q��u\Oc���\�� ?�$�,�lS�?�"�
� .  q���-,�̨�� (]@�%;E�Փ9�Y�hx��h�l0�֥�7�Zצ���\@�HV ��f��Z'�KE%:)gQ�}�g"�L�X��ތ�k`a-d����݌�c`Stg�/��A�y|�Z�9���H����L1nK����t*:��1ܐ��'�3�	�Z�6�:`
�B�v��q6�:0qw������>�=|*����t1Cd�9b~m�1]�Q����"M(�Hq���(�u,��Ը��
=^�'=�BE��b�����*�E���}j4SG4�ڌ�E�^�A�3��u,l�&�~0�`���Է���QyWL�o��?�[�(<hm��M���
���䬒�S�J薤�Q_K�3�T(�|�����,�%��s;�o�w/�n�+�����T�C[�ܸ��#WZ.�繺�,�*P�󸐔*G�L��+,|�Ǽ�����
j�p*��A؆����Ѽ@�����1,�ɔ�����v�Ѕ/�Q\uV��Қ��qa�~�|@��Yρ�b�ZX	��8���s���:��C�`yF�����W�A9,������\xƠ}Z%��� ����t�JDg��{����`��/��D����C�bR}<�E'΃N'�LF�^8��ݪ��j�?:��&d���[�Qɨ��U4��,(��_�V-D�Եy���\%
� �DGx��->!ƙAS�]��`2����۞�(�	\\Z���AP����w�M���(�r}�`.�@?g�J ~�0�%*Yi�.&a\�w��ߏ�RVU5�N�_%ǽq�]U-s��1G�L:Kӧdk^b(*Mfl����MdYP�4P�W�/a[u�Ѥt�4ЩT�S"��13���D}�aT��H�&o�q��ˏ�G�ѺUA�2���A��/�,�
f�����
��&c�5���{#<t�q"]�
�lKN��*��K�r\L��56����s�G_��i�]�8�ޫ7Kj�
^y𙇄}�DXc��M�_�T�^�	Ū�s�)�%�y&�̈́�b�$��R�����L�,nRk�/��25|�A��4z�AO,�ibQ�e�沠�9�dE��u�� �¦M �.�.,ǜ�z�qIM9���6�=��} �����Dz$�1��7AN%M��_��D�"J0�
#����Ğ�'��ا��0o/7F������U�J�z�L��<�3sc��߄��� vT�ts��i�>�"[�ו�an5�;��w�T�2�ό����2W�v��<CB��AD�x^$��eŕ_�2?�O8,��-������38�'U����F���V/�u����I�wG����xtqnM�ۚ�Q��&������]���s���h,z����7��6�u����w���~�޲d�9�������V.�������Q�9v]� 
��X�u�xo��<<�O�2�Jr���@�N6S��Ȑ��c�-ت8�(��#��C%�Dnc2�y�����(��2��20[n��k����j��2H��P�MR�:a�r�ܜ�I���Y��ԅ���Yd�E�%�'��[C�AL���X{E��E`�'������HV��
mt�����4,��߲dz�GC���8�|���RI�2L�o��7�	��~�Һ�l����q���t����
�o^��ۤ3��3�%�Zgl�n8v'M���+�c����A'i�ߘl�7��hi�٤"�Jt�+�%Y��.��p�u����V#�DZu��{�� �#!F2��$��gu̠��ƌ0h�Љ�T��6�	�Pb4�אo�:_&WQ�"��[�h/�
�:({��{d���Wr"mwm�a�����_� h6c�)�6sp�%�$uU���25��h����ҡˌ7c�PvL��oƯ��h/9�욚�*�()������Y?��w���'��z����4"�����i8	�q�T���"_��:N�Mj���c��0��J&�h�w=U�{�Ƥ���^�$$m�դ�N��d���v��:}C���QJ�GW˼n���:��p13?>���*=��k��D�[38	���KE�s�#R�v��J�)���_�|�������      2      x��}[s\U��s�+�y������`��Xn:�P�%R�JU���{�'7'�`Dt8�sy�	Y�@�"���?��V��{�RIU�鉘i,i�/s�re����yn\q�(�x�]q*�����u������v���T�Ȳ�W��^��.^�+Ko��yn���JhW�ʥVg�֨ݘ��5���qhn��L������.6�Cd���F���ߩu��6��A�m���V�ao��������s�/��û�����ᇽ}��kށO������ޞP�wڔ|������7V���f}�u#�������):q�����{ ��'@ih���=P��H�|�@�d�bD?����N;��U�_L�i�z0~˘�4���x��FڨuW����7k�f��/	Ϸ����&��7o�Ck57��V�	t���t�����{8o�~�?=:����� g~�]����>�1ہ?����t��O��_-Z0���3��π_[��J���s��m�go��c�f^��h�bc�����?W�����'���������pBX����
���)��[�2Q���FsAZ�p0x�Ғ����TGϔ�˥��
R���H�p� ���z��]~^M�����/Jȩ�[�~/����X������XY��aX%�u`�q�9��ŋ.��/c��!���Eo|4��Q�xJ��&S���Q��|�i"�(�*�.��Z�tc���H��w��j�Q�LI�8��Lo!'�a&D��*dٶ�]W�C>%:%^�5;�Z���FM�fǩ:Y�h����)
�/z�z�8�����Ͽ�H��`㜌�+�;}�D���c��2�!�Nڭ57Zsօk�f���hBtg.i�� ;
��`{$������=Ŏ�����ح,����t��HW��rs�_
J�]����0e�h�V�o5�u��@�p�K��o�xd�+m�0�OK�̟+�ZPp�����h��Y�Ҟ�=��� ث�;z{�L�K�폽og7Q�hl\\c@G��ങ6��98w�
-[D�_y��h��
����n�!'�A�
;"QY�j��]XqM0�/4jC6��=2z_Â�
:��ᇇ��?����8���[��(�@q��↊L7R�p����bW��#��dq���#�`�Ê؅M�����=��#��.�XK����/�z����	�,�)�b�r�9ǞCJV����(��\{�۷�kh��|�w��u�bX���L*�H�
��,v+	Acyu�I��� �;�{��e>���8�`Ԑ�g4� ^��e1J�ث��T�5W�5���)�ΝFz�?t�gtS�I��8Tw�h�����/@�)�n����c���g�r�x�o8���0?<���:�M#��My���i
�4�j�b8�����P�����)�K��}���]��xj�/΍	�-�N���c`�A���N@�v�YZ��G4�8P4BNSX'�{$J�(�	�z�uJ�(�$(��A\z�k���M��Fm���-G�l�U�K��l-��8�C���_Z��3��o��O�:�-�Rv�	'�,Ъ��e�{O�j�|.Za&o�ȷ�XP�L��
��$�F�g�	V`]Z�$r�C��r�$=��E_)�gE1P��YQԭKw�o-���(H��"9&��z�_
m���i;cڱ�Ϟv�������zh���`+��]����(P����<Xs=��4��9�|Q)@Xu
�=� ϼ�t@�G ��� �$'� �Q|{���{����u�3�m��ʮ�n�������qhI�|iiW.�H;ct��t�<�E{ne�E�����;i�:������hɛ��"���%���6Xk��{�bt�{+s��W"ȴ{�ۛ]Z�Z[�]��[M��}�ʫ
��|�2�ُ�U�dOP{_Q�IPF�uU��Z�ڜu9m�Kg��+KKd�д�O�K�;(�ҥ5J0%B/���'�eԝs$�r�4�hS<��v��ѫ2��{_�
w_���*�=4�:��d/��5��v��)����W���?�7@��n7;�6�����2(��+��k�����(o�n�:�F�C�����^ݾ�^�@wV
��������vC`�J�ic[wR�}B�5�� 9M}*
�]ڪYa�1���u��u)XaR�va��{��
����Y��B�6c(���^N$�OJ�G����U�d�О@Ӷ�.����ԡ�Fu!����N4��������z7��F��}��QW�V�b��n�:�ô]�DO��)h
ʻ[��^oe�k���������D�)�қxet�����ļ���)j����mQ�ж��I�8&]]Ť^��,S2�͚Ea�A�|�{��Z0|�0�b�8�ê�����Ӎu`c/0T�`B�B��)�	�N|�t"���.������Y}$��p{�*08��� >!�� �	\ ��I <@	ᘂ*��Hs�#|�Uֺ@\[��D�������r�Z��EPA6�%$m�@�p|�	�<�� 	:O��pN�@"<<`��T&t���N.@���C����������K�!��9&|�z�G���eÇ�>�@x���}��qi��y@��r����:��!��H�Ŵ}�u«���C�]�~	r�~��v�?��	���>����|�C�Xxl
�v]f��!�`��dY�+`�H��)�9ô{ǅ���a��1��6G`L�#�a���i��U1�)�T8��ods�0��wZ7W��)}��ְK̰_r{��B�t��
W�%�N�I�d�ҡ?)��D�P�w���»�û��-�O�/�L
�c̳`��fτ)�S�Um�h�b������KP[���Y�P�T�g�x��}�E��	9$�J�O�7�r)33���ٟ��%���p,}G�=U�������	O�3�#�I%s��Uqğ �U�Q� G�x
N "ۉ�*����Gje�]�)�0|̐��0R��5��}��2�,f�sl�nԏB�[��
ˮDS�z��ۥd$tS���"�wO>Vxc���11�a��n-�o�>�n:y8xݎq
�Q�#k2x��q�o9��rJͼ��f��ɡ�'v��\�߿�P�~�(!�8A\����QQ3�7[��F�WҦu�]_����ĥ����0۳��a��Ww�|�9�;g�u
r!ZH�S��6q*n\j4D��

jI<qT\޾I>�k-Y�*匡lQ᠖T������q�Ԥ	p<�q&����J5�PnK
R�H�H�"9�"E��M��x�y9�:���S)Q�`2��ֵMF�DH����3��oqҘ�BN�����Dk/[ݮ����Mv��p/���	-l��qL�J�7�/p������Z��:��(���b7m��>z	��zGݲ�TF޲�KP��u�6�=�W`/�.����o+�K�Զ�kT[Wۖ\r�j�iےK�Qm}YR^٤�(�
{^)<3%h��k��������؄�"! �2�f������d8��a� f?g�0LOE�����&�UuJw Fr?������9��%��{ U3��^��H��Y�NkϺ�=c�&���rN�
�CN��+��k�U^N��
J/x��P.���9����)a��N3P�hz��9Q=p�=k���q%��hx���}!US�rdc~��zW��ŕ�#LX+rd�s.�(:�3P<=�jV���U���U@@a	z4�:@��&o��QF���;lX����Y\�e8vk��#�i��t���sk4�n�87�4v�1����'��� EC��.u��Eo��*\0�H�©�%�c(]��;�	P�.S����p�`06/Q�Z�����z��X��h7@*�T�"������~��8�} �D�ä#{KK:ơ��P��7��y|��6ON�<����֥3\LH=�$��]�rt �T>��E4���Y�9'
�W?~Ιv��	/�.�r-j�e���EM���Tʵ�)P	y�(Ǣd�������N��K����r���	f�R�2�2!�Wh��T@j��&� �@fc
��:��:����.&P[�Κ��~�I�]�6�tL�    �����I�	]g�3�z�tc̖أ���"&�>��9?FQ,F��_�t�x��/�V9g��Z���]����vn��;���C�Y�!B�f��z[����])���F�p�v�����o������PX��	�'W�HaR���W�����-7b\L�2�
��_&#1c�s2)f����0#[1��a:���d�!L)�?�5�v�r�e��"��BK��Z�Mar�D���$WZ��5*T0�6���JF�I�1�K�#���^k/s8�@o.[���՗�ph����(��-� �1���1L�S��Cg=�a��⇌*S�4�t������t�9�4�Y�>���G��;�B~��I)����V	|L.������:�}
�#� �?�9֗��(HT
��*|��r�G�3Ar)���Q�<�i�������TG�vc$ק���N*�R�t�T�h4�5�J�m��֐��-ؑG~	�\0/cv�+��ۂ}X�4�O�`�S��#��W���O�2И#}/quJ�7xJS�x�q�4�����Ӣ�˓���r}y�Ѡ����t��|;��O��U�/4i�����<h[��Z�]b욒�%���O��k�ߺX�z០���s��^E�!
G_�|���� 5��@n���D̖俚$U����d�D� �3,y
c �jPr����U�1Ӥl��.:�T��
�	�Dq��f:��m[1"#oca8���U��3�'�1��8�A8�;tp|�_A�%{�w�n� ��@S�Eh��a�i�s'���"
]�;}68��<���ڝ��'�뱃?�-Vb��c���}��Yϰd�����\�
4*��#n��_�Q�`��}������%�������f��\n�k\Z	EI���X]v�����F�Y�lԷ�������>l�u:z {$�X�E����W���I7;�A��<O_b�n0 ���3�z%bVf5�Y�Ѷ�Юc�����iqf
��;���A���mR�BW� gwY�!�B��AѪ�\Ãd�ȱ"��E��@>���)�{+]��\_M�{6w˅��,Qμ)�ٱu��1�cO��b�w
�%愪�
\��{�Rt�X.�r�~1�y�TP�¨�Y�:��%_��Җ���6���`l\�!0�o>�L�^-�h+1P0!P�@�@	��b�k�ɨ`��
a@�)�ɨYt"�_��D0�ұ��<䏲�wH��3o�w��;�,,t�/W۵��n�=��Z�L�қ�f�]��n�n�t���ѭ�T;��fڨ.w�k�ͪ�V�ת��nP?)D�R���nds�q�P���@�����ˮaq>8X#��5C�zƍ��0@�+��ɒ�N�,��~��)f5t=�5f,%�<��p}�5�0�7P\c:��qC�������W�	�H	�u`Z�b%dL��"�D	SX�Gȳe�)(�X�Dy�W3�s��1�d�R;=��1_d��t��������:��^��r� ���@֤���C.�e��~J�ʑ1�g�
?%�"e�l��5C�2Tv^�5C	+\����jՂ�Z{�=�3�_����������J�Co�|W��9������^ݢ-��3�Yz0�=��~����˗��i���Z�YB߱a������I8{ �8,[:��dD;ֱs�L­Xdã*t �E�GF��0sM�JP?:zd����~��W���ٙ�q�&��0/v�.���l�S5j,�
��&�s����.�S8HO�Ly&��1�(���?ͯ���pU����Z[Xim^�M��>���7[��r���Y�l5��V���8��F��-)�^�x�5S:��3�e��F�ܕ�3�����;]��"����T �;��1g�P�n\[�e��U�_,�H�}���k�0Asg��-�
��n�>�{��.���re�ȵx��Y��-�imyS��<$RP�I߿]>}�3�m�(��o��P73�d�<�����Ŀl@zU��T�9Ilsm�;̴��'��Z���7_{�""|�IO����["$>���)��_)�Tz��r�~K�W=~� ����� � ����4�R�LZAX��R��.���3��_	θ�(��գH��+j�(*���Z��|=��?G���֞�D�â���F��.,�݃s
]�w���O,}4xm���9 qi��[t�@����o5~:
_�k`=S±x�G�G1��vp�m���h���˸�� ��V ��Y�
�%�bW�s�;���X����7a���=�wB��Ru|I��W�-�oĵv�ʻ���[�eN�~N��mjvS���'"K�KC+?�~M��L� =fe��3�.�S$�B�+`�B�O��m���rS\C�q����M�[�ml7�kR�x+�1�r�s�M�����P�g||��=��Gwv��󒜐r�?��}���z��y�������-�܋��NÜ�O�<щ.x�Dǈ�J�(���5ahK�B���#ڶx�� �Q-o��پ���E��-����!�&�I���ՅNg��z,*;�lw�Zj�1=4(�ʉ�ݘ���zߋZ�C㾫�s�t�_�l��3W@�[c�cư��[9�j��
֌h%B@��k�*��
&Hj���,f#\�=���c �d�B64)�n�˭��&>�h]j5;��#�7����qm�o��z�
���}���%`a_�br����dm�,�E��B�{W��K\��6�vD�(Fg�\kBQ-(F���8|RzB��N"��
�jˌ
?v�wU����'���h��Ku%�}�ްO$��
�*���r�4 ���߿7��#��ׂL.���SE(�L�C@�)��p�>�qi&J3�V��$4)	 i����t��sv4]YI�{��ĨZ�@��Ӑ���E͹~��������ٞ3y��0��T3���=
�g,2xBP71!W��:9�`�	Y
pqf���Q�������u�
L�(P8!�l9��m �J���7��{HiX^��Β��r��/�g�o1�v��}����
��I�f��o��8�e�h����˵|a�VG
oaP|Q4cS� *�&a�������f������GpHf��`�ܒ�q�᪯O��,�,�Px�'87ߘB�(����Ԑ2\�8�`z��]lV&��^�;ᎌ9;��x��g�����xGRpym�'O%���3�O�Q~�Q�$��\�[n_XZ�jem�����۫��pu$Ħ�Eb$��Y�����L/g
K�
S�Qw^�@��/�z��%�g
��WR��Pz��Ά^������(��,�E��A��;��Qb���5��-k4�,)�/�\%g��;ur"���:r��s΄\�G���q���D�:<u��.�V%[��+�I�Nv�$�~�����
]�%��%�L�ǿ��rx�F�f������KLzܓ,���4��;Be�C�,xQz��O$�*����1�v� '��uJ��L��Ok���J�r-]:G�0�5G��A����{�^��=:���+�Ɋ�S���m�Ə(�n�� E�mA퓓�O�}|���iAc]���v��09
tZ��O��ѵ
�������(��+�/-Y��53�}���=�3k�}��VD�|9��y�вJ7�Ƀ��X�ဤ:�S�Z3N��O﹮� ���2o����;�2L��b��'mh�L�� r�lk�H6On�u�:����΄����/r��3��(��G���}dQ��(��s�[br-��

ʥ�w�y��{"Q.Yט������!G'`�8�(����uC�|���.٬O��.>Y�I�=y��.����j �����;��|.��$�j����B/z�)��L�b�y�Vc&�7Ο_�Yq��!Ս�v��#3�fN�L��8��)�$2󏤲<�HF߸(�זk�V0���l�B�iwhC�����A�_�FM� ���"�߳�D1����	�1��E����3���%��J���n�,�m"�`��Zo�#\$ǟ�0�ӎ����Ni�r� ��6�
V����0�:�+���:> U  �=g]�on)�a^�i6fD��^ ��
!Nr�f�l�l��i��Z���m������y��U�Z�u�HbW�)"����*�����s��H��jK�:�GF��	C	I��_Q�T(�va�bp�l�3�T�2>�c�_��0�D�K��=98ŉz�{O�Q��'y' w�c��5�T�e�
��@0�y�k<��x�;�"�xA
�&�󎈑5�K�y����(��!T	�^>j�����f�\o=�&~dc�1U�
_�rź�u�Y[����á�%T��K6��696���A�8H���q��A��8蟟X���
1Ƙ=��3��A�,,���lJ��qq�Wwc'��nE2�%Zd��1C]��C$^��M��)P|ws<J���qXu�L_<�Y���l�/��p.�o�eMip
�+��9�(뢆��"�"��e�_�6-�A�_�EC�>���m�$T�|��82���BD�`�H�b�1d$0]Y���p(�_B�s6)%��|$�r���E>�c�l]
�XSQ������z�c��J=.���U�������+vr2�~�-Y�Y
B$�Fu�**�Ay��vK��X�)���~��kc�Y34�L�>��iY�96y��s��O5�mӯ-4��Y�Tjkg���;"y(�˓*l�v1�so7jk#ƂLL�[zߓe������0W�W��4.�+�n�dE��5�@VȨ8��`=52��icQi#��W�͗U��($����u4�"�����@)
��Dc2��k;p v�����<���%�C?�ga`�]��������"�"��k��+K8�7�S��M5��5)۴�ڼ�j������ި���Z�z�\�6~���N�[�z��)A4�5�s>��Q��<�����ХB��4~˘.c�7jZ��b����3�f���0}zK"�+t�Nb���E/�&�#�~	�^�k~ț#0���7�̠�$�:��0�0��m�D��j���7�y�_0]�r�i�_�?�V���0�dZT����5x�y��H�EBlן�P֝7ӻO�j$��\���8�^B72'�yS�U5��|
?��I/��f+1�ߣm��d�S�ץ��e�.���2�T����X����&��?��mi|b���'�֜#��ރy~6ӨR�)'uߧ�H:�+�������92I��"��
��0�Vc{�_�y�]�����������xI@�8U~?�f=m7�0��t���)|�qƯ6;U����"�+�9N-=���׋�Rx��~����\
nn%q�.� z��gh����>�r���m������s|Q�S�9��`=:�T(P�Y�irqK�h"v&FFĕ���*�����1T���t��Б1
�z<|-�
����D����?~)��C���Y�'Y���bCp8���n���9r��h�Gμ>��m4k��w)2l_i����-ʽ$_*����-���C����|�ʥ�o��'*n��1�bM�����1$�� ���A������Ƨ��}x۬D
��eT���Bќ��7pf_X�[*��_ɇw�_��Oi&0�G���H}�����r��Ov�9 ݈����9D��Z?�Z�A,�P&�m36U��\J���q�*��P�d8m����ol(�.=
]�¡� ��߃xc�O}�h�\�>�?��jR����j�����X�S%��źV/8
0�%=?�Ѓ^��,ݏ$��5t��Ӻ/���ߞ��91b?�9]�*=�(E`+�{��\�BK���B"����/�R�+b5��u<j���K�Y�i&���y�@ǳKM7�+LqC��b�����VH�e��(��+%2rbf^
ߒB��V*�K�L�Lk�.��!���kç�E9v�G�OZ=t`P��5�5O�/� �����O	h��o�ĕ���7��9����^�̍Ċ+� �d�*$�c��-��ב����8�|Y��h��;���a�??��ZM��$@�,�$\�
��N�LĐ���`�;��Z'��)��
ks^���O=�m�-�f��Oo��!�zN%���R�@馧̧Rv5��*|"D���M��Ӵ�4��i�M����4Ѧ��M����^z� ��`     