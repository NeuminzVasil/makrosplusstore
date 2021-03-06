PGDMP          +                x            postgres    12.2    12.2 %    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    13318    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            =           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
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
    store          postgres    false    209   7*       /          0    16432 
   categories 
   TABLE DATA           ;   COPY store.categories (id, category, parentid) FROM stdin;
    store          postgres    false    205   �*       .          0    16396 	   customers 
   TABLE DATA           T   COPY store.customers (id, login, firstname, lastname, password, active) FROM stdin;
    store          postgres    false    204   ++       1          0    16482    invoices 
   TABLE DATA           �   COPY store.invoices (id, datacreate, department, comment, ordernumber, senttoapprove, senttopurchase, invoicenumber, totalprice, resolveddate, customerid, senttoprice) FROM stdin;
    store          postgres    false    207   i,       0          0    16450 
   nomenclatures 
   TABLE DATA           �   COPY store.nomenclatures (id, comment, price, manufacturer, nomenclature, code, submitdate, expireddate, categoryid) FROM stdin;
    store          postgres    false    206   �9       2          0    16512 	   purchases 
   TABLE DATA           w   COPY store.purchases (id, invoiceid, nomenclatureid, count, approver, resolvingdate, comment, buyingprice) FROM stdin;
    store          postgres    false    208   �a       @           0    0    customers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('store.customers_id_seq', 15, true);
          store          postgres    false    203            A           0    0    invoices_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('store.invoices_id_seq', 1547, true);
          store          postgres    false    210            B           0    0    nomenclatures_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('store.nomenclatures_id_seq', 603, true);
          store          postgres    false    211            C           0    0    purchases_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('store.purchases_id_seq', 3811, true);
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
n���Z!mt5�VhM�k���zZ      1   /
  x��Z[o�~~E?�2cյ��o0A�lL�DZ	�V!�DH��'��8�K 	J�]�$o���l|�=!�$眪��Uό!��՞��\�sNq�YO0����%�^`��|���d�˂�^�8�6�&���ƷƷǷ�|;��$�?���MD�.&�i�O>�_8��>����w����4���������{7Opͬ_�}�j��־X�q�����O�Q\��6�G�MX[߆�/&<A��mX݋Õ�rp��I�r��ӏh���N\
��0����N	��MGʕ�`HȎ�Eک��e��/i������$�rAk�������F���?J$<������|0����iSK�ƘT�6u���6u�˲m�ߐ� �h|+�5@F��a�.���^³=8�v>H������k��= ��2�Z+z*�,�N��*�����7��	8�+����|
Pܨ�d���s�&fm��u�z�3�Y0:-hn����
���]X#���c�I�� �!�އ�`m��1���Q���%_g��1Ŧ%p��MO�<6o�'���N��릃Vq8��Zo����Z��1�NC�g@��{�0˚����,�P<�wWB�.��4VB����S@@#<t�Y^�$���ܞ�]	���l��v�7^;[���m���7`�5���|9d�)L/Ӗ~&@���,l�W����˴
O��I�4�yʁZ^m���{�9K�a�:˚&R�s���Lސ�@���U�裸�����8�8�R��������	���j�C��a
�v�nD�Nw'Y��0!����.��a�j�.�O k�p�����
wT0��d��[Ltp��u��y;�؄0��3�r��,U���E�b}�c)��
���7�v��1����I��p=��|��&�s%)b2���ciMe^�������{���a�Pi�.��H�
�e�g<�Y�Pl���D ��9aH�	���y�nσ�$��U^�G.P�x��v �� u��� ֶw�QvyYQ��6�?��[�<��B{L�f%�&(�W(���RQi��} Km�
zm �)�2���!Kg�cH�R�X�v�	&�;	&(�@a(ʷ��>e�]�#�� |HA+�#'l�� �z���,��8Zj���	@UZ$+ׯ}y��/Q�5��me[��E+H���&���
кE<������Q�%*�����h�|�f�p�[��;��6 ���b�8�����~�b3�gV
_"�m�
;���,h���G|��v�m�4f��n��DB'쾺zmr�ꑒ!�T�@�!e����.�;�ڦ(j䬹ޮ�/c�|�b�A<�����6A<$0`a������#��
��yKf��1>��9��{pN���9T�p�}�A���$��:�06
v	j�:�>� ��۶���u��=���V
�I�\��
v�Ŭ�u	�ç���m�O
I5^A��腖|&}�� ��E��\Z����kגK!D1��s�_|~�ӣJ ��Q)��s+$ePP�*QSC/ꘊQU������a$)��!<���]��Ɇ4�{�La�O.0�7%�KU:'D�XD* ���GDX7]Fnzx��n�Q޶�	_������ѵ����F��̅����a��/�_HRQ�Em&�u4@@@��a�Ȼ��Y�{-=����֨U=�ê�,{���<m"��PNaW*Va�t�
O�Z9�r�dee����ʅt�mB�ꊗGw宼C<s"!��t6���#�!���j��2xtaJ�'! {Si	:�2�O2M�36�a[��Z�H*��0+#��Q~Q�2�����(����f��<S�:�G��_�%m�L��$�1����d~�
vk�^�����'Э�3,�|%�4s���Ǧҙ.�~�b��,d���!>5�^8ۋ��e��m�<D?i���`6�\*2�ܺ^�br���Q�*�>@AZ�& n�-�M<�Q�qa�g���F��{M>�AeH.��˞k�NM�SbG�&Bh���ܪ�M��JY�4Ғ���b�@
�J�Ƅ3�������r�(ٴU:$�*�ӥ�j���v<��̿5�Ѥx�
l%Sږ�,���iy�iN��&��^���m�8Er�05�LL��u�x�:N��:NԳ^`�<�Y%���a�I�Rra�_��Y55�H��{��!	�4ҁ�sJc�����3�S��e	���=� ;r���Ӷ���lXI�P����<�����vH�u��,�t� c�EL*ɞe<������<v(@�n���R(��[0Se<LC�Y+j�
��I���	4k���E15���	���U&����[S���C�6̷\����}���Fu�m9_��R��SL�7���=lx�PT���
6]AP΅t��.<Q�	�䢝n��ߣ3��eM��$�͹��+(�|��A��n^��I���#Ȅ �U��w��'���~�z����KB��du��)j�&4F|���
�~��OW��:�ԙ��#>`�y�,�v�N;��gb����K���ƭ�"M��Jm��
"W�'Q@gH���<:�}��&�j�9��Ӆ7���Ǚ�8;'��>�A�K]���K_�(V�(k��U�W��3X��C��&�܂�T��8�����]Xc�2�@��چC`H�,�#t�P�ú�Kǹ��+�*�7ZFD����S�+�7l�+�	�D�ii/ kR�X��B�b>��b���:t�z-��&�p�WT�P/��Li�e���^&��S\�;�8�Y��i(jF:ʲ��wzͱ�f�0�;+(�!!�y�ǅi���f8^��X���Ԉ�;g�b���:�f��kXio1	��z�&Ž���U����e�5j�>H�)��:Se�݅�֮1~�3g�=���wO�%�	��M������4
m�]ad���kq	# FZu��m�b�m���� ��^u�i��jk�0�璅6E+����:!���/�. �9hU
 �,tK�5U*�ڞ�SK�-E�q6��J�#kN�C��G��]O(��*9�����\I~�FkÜ�])�M
�Y�fId�\�vb#cg��
�gD΄�ae�Up�G�%����R����̹�8?!nFo���ق���ʅ�	�ME�U��ЋR��T.X�ct�^�[�
��+�Ѷ�n7BK�Gw���j���cFE*�SK�,��u�O��5��YI�M�MT�����{g��H�5���z�|�J���ݓrI�p�tCq��.F����?&�4J����JS��x�e��
�q��C �j�|S�`r�ܼ�`lA��&
����'�H�I      0      x��}�sG��g����2A��DUuU?<� �,��	R�x��h -& �D_܄-��΅w�qsqw1��ޙݻ�pq���hdɎؿ ��.��]�]
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
�:({��{d���Wr"mwm�a�����_� h6c�)�6sp�%�$uU���25��h����ҡˌ7c�PvL��oƯ��h/9�욚�*�()������Y?��w���'��z����4"�����i8	�q�T���"_��:N�Mj���c��0��J&�h�w=U�{�Ƥ���^�$$m�դ�N��d���v��:}C���QJ�GW˼n���:��p13?>���*=��k��D�[38	���KE�s�#R�v��J�)���_�|�������      2      x��]�s[U��,�����²���|
$*	�q�)�\E]��VY�R���SB��*�	�f���>>���`�p��?�~J���+˖�0[�;��=�����ݧ���q����vũ�Zoכs֕��zZoT\ۉ�vRu#˶_��{��xѯ,����	6�*�]�+�Z��Z�vc�:�춚�ơ��g3e�wGP�K��x����.6��mK۸������[����޳�~��������Z��{{����ޮux>ك�z{B�SJ�iS��?*o�XY�7���֍tκ�v��fڧ��Y��zO�B��~D�� �=�����@у#���=�Q�����V;��W	~1���e���-c��L*���7i��]�7[���l���e��$<�f</D�+ۛ��޼���ܰ�Z�'��4�;�i���៭��y��=�����O0�8��o{|�!���a�����~z�bѢ�����Y�|����X�V������?n�?{�}#7��?G���������ڿ��g�<�_d���ϧ��B���n��_N���V��j�	�⇌0��҅�����������8z�<�_.��U�2<���Fچ�A�oֻ����jbd�7T~QBN�߂�{�嗧�r�,��0,��r�ò(Q������o/^t�?~�	.�.�x�Q�̀��St0��ǀ�����cH�E�W	t��n�j�s�F���[LWۍ�fJ�Ĺ�fz�91&3!"U� ˶]�r�)��)�z��i�ڠ��7j�6;N���Fk���OQP޻���9�W�?�F�#vJ��s2v�����������ȇ�;i���h�Yn�՚��#C�	��
����ˏ�(pP<��خb����;�>�/�lc���^ooӡ�n#]�o��ͭ3(w3L�bSÔ�Z9�ըw����^�-.
S�e�);�����E>-�3��jA��V����7g�?J{�#��*�`�����Y3�/�?���U�Dq��qq
�鎃�f�к��ܙ6�l9A~��V�+���ֻic��7\�T�Deq���va�5�T�Ш
��^���}�6��{�~��:�Z�.��W\on��p����*n0]�Hq����֋]1v�jD������
��;��+b65ZjO��w���ϻtb-�{_����_������$ �@����y�q�{)YU�ڞ�<s�Io�b����h������g�a�*�9�� )6��ح$��խ&��΃�����;��ȪZ�L�QCV���x�c�I�(b�BSS9�\m�Hbo��;w���9��M�'
 �P���]�r�7�?�Ի}��3���E��S�Q�}�߽����L�Z�tZ4�����6M��V�5|�0�����<*s
B���z���.��_�Zv��Ah�87&ط@:m�n���A|!c�/�;ū�Cdi	tr����@a�18Ma�8�(���&�Qn�M(��$���~q�U��6�6y���N
K�ɓ��qBT�/��N���j���Nfi)����:�A?�O��\KU�Y&�ز,@�J*��_�=m���h���9"�G`A�2���r4�+b��Y�'X�Ytie���
�����P���sV}���@)zgEQ�.�e������ ��䘄�~)�uÓ��i�J;<{ډҎΚ�o��.����pv�v�#r̢@	O Gk8�`��������x�E� a�)���W <�� `��
�� b�G��
�c�J�m<�Ҳ���H��*���] ��b�+ơ%m�]�t#��!���!���)CkKK����.�;6ã%oVv�����@W/(�`�=��Yx�ѭ�̍_�< ��qoovi�jm�v�[o5��#�q�*�6���]T��g?bWQ�IP<Aq�IP|Eq&A	�aT��j�ks���.��W�,-��C�>3<�/Yh��zH��l(���P�G���QwΑtlK���4�M���}G��P_�}	*�}�F�#��.�и������;���0�e��h��6^��~�� Ͳ���l�����[ˠ��_��n���W�6��պ������C�~{u��z}�Y)��˟�Zk�6Z��
�}+�m�I	�	
D�ا��4��4�wi�d��ǰ�ס��Ih�`�YH�څ�����(@��;g-�ڌ�l�r�3�z9��?)1��]��hW���C{M�v�оB;S�Յ�v;m�T�^��28��P�{yt���G]�Z��M����t�=���)(�n�Rz�-���
�{���__P[t�\Jo����f��Җ��-*ƶEC��"'�tu�zq̶�L�|6k�1m�Q�)�k��Y�o��e� o�VN��n��O7ց�m��P��	J�ۧH'T:��҉�Nr�tb�3�GR�g���^��9@���� �V��� �$'p��'� %�c
�4OW �e��}WY�qmM?�#�[cs{�/���j�C8dA� ���e���-'����@$�8<��J�9%����)�R����[� ]�߇bK���@�ד��C>��sL�����1ˆ�}0���������Ғ��j��ty��1tL3C3D��i��W[7�������&���͐~�#|uX}&6���������#��.:(]C����ɲ�W�ґ�Sts�i���+�9�8�cB
m���ZF��r��:�E�b&~Ul�p
�_��aF	�n�6�S�轭a��a���$Å"+�x�K62���bɶ�CR,ڧ���f��'�w��w?�[T�_&�&ǘg���+̞	)R$�)�����C�c�@����6R��H�`�f�N�ص�;�|�rH����o��Rff\+{�?��Ko��X��6%z��;2�[qw��bg�9<FJ�0J�썫�(�?�� ��A��$� D�%:U^oכ5���^��S a��!eka���k�?��e�Y��+���ݨ�J�l�]��d����K�H��E
�
|���<���ucb���c�Z��4}x�t�p
�1��u��eG�d��r�r~�唚y���^S�C�O�
毹F������QBFq��%ʇ�e��f.�o�����WҦu�]_����ĥ����0۳��a��Ww�|�9�;g�u
r!ZH�S��6q*n\j4D��

jI<qT\޾I>�k-Y�*匡lQ᠖T������q�Ԥ	p<�q&����J5�PnK
R�H�H�"9�"E��M��x�y9�:���S)Q�`2��ֵMF�DH����3��oqҘ�BN�����Dk/[ݮ����Mv��p/���	-l��qL�J�7�/p������Z��:��(���b7m��>z	��zGݲ�TF޲�KP��u�6�=�W`/�.����o+�K�Զ�kT[Wۖ\r�j�iےK�Qm}YR^٤�(�
{^)<3%h��k�������؄�"! �2�f������d8��a� f��ta���tmaM��� ��~D��ǡ�?p��5J
G� �f:Ž����ݳ�+�֞u�{�>M*���&ڇ���W^mך���6t9%�^���\
��s��)&��S��3�f����0as�z�&t{�j7) �J����*���B.�4�������������+3G��V��b�\�=Pt�g�xzլ�Ӆ��g������hF#t���L���B)�wذTA7����p��n!F�ӎ��,�+��h�3>$�0qn�i�Jc��=ncO'%A��|�]�*����0
�O.T�`*p�S�Kx�P�±w��]�""/��@�`l^�"��#	��(�8��n�TF��E2�
��qd�@z���IG46���t�Cm��:�oi��D�cm���y"�íKg���z�Ih���2�@F�|]�h�e��sN6��~<�3g�~&�8��˵�ɗu��g�5*�R)ע�@%�٣����Nv��;/�������'�-J��hʄ`_Q�)SQ �	4����@���) &
�L��<��b���@m�;k�6�9'�v��1	��    '�s3$M&t}�E�|D�ҍ1[b�o?D����l���
D�I`p�3~9/|�����X[���k���v���k۹���ȣ��e��t��eb�m����w�$�O`=�-�ۙ���s�K��~<V��Cas'��\Q"�Iݶ�_�V�
��*�܈q1�ʄ+�n~��Č3�ɤ��b�SÌlŌ����zD�]n�0�\�����`��A����
-��Rk�6���o��FH�\im��רP� �ڸRK+&��T�.
����z����,��l�fT_�¡-v�S�(���0�D�,�o�~�0�N�j��\��iF�2Z�L��@ӭ��&B�M��@Kd�b���>��
��C'���w�oX%�1�C���)��h�r���X_�
�� Q)�[(��-?�1
��U�xR$�G���q���#��Sqڍ�\�^ZO;�K��E�ZPu���8`*%���[Cv`ʷ`G�m$�s�����L�8�o�a��D?-؂�O�ߎLv_�S�?��@c��Il���)%��)Mi�i��Ӥ�˓c�O��.O
v *���F�j�6Vӑ��%켯{?ܢVi�Фe�O��Ulu�kw��kJ���z?e J���]|�b���V��΂�y�z%�(}!�9֚���[0�!Zv1[��j�T�;��T�����ϰ�5���A�!��sWi�L���J���Rn6�'H�E���<<#�mň�����(F|rW1���X�`��^�����+����Y=��iL��I��k<Ma��3�iȯ��Ν�3���4t!����,��D�}Jkkwc��P���L�X��6��w���Kf=ÒYV�od�p�+0Ш`�I�W�G1�Œ������3����Ғ~��{s���qi%%�Jp�b
t��f�.��ig��Q�F�So�?�������y���Y�,�c)Ţ*�_�"���/�<i|���� ��?�0�q��Y��@f5F��B��Q�b�ř) 2�N��m_��IHe]���e݇�9;E�:��r
��"Ǌ�N9B	o�D.��\��t�vs}5����-���D9��g���.���=َ�E�)8����6|p����Kёc�@l8�-tTp��X�)RA�
��w�f����|i�K[�<f�P�R4��qA���^���2�z����@��@��%�����U&���6����'�fUЉ@�~�=���H�
~�?�VJ�!]Hvϼ���^Ｒ�й�\m׮׻��|{ka3]Ko֛Uw�z�����]�?V��F��R��ךi��ܩ�u6��Z�_��2D�A���K�Nw���1�~@)���.������`��J�)n�7�n� m�Dn&K�:�k� F�Aަ����֘����<���ל�tr�@q��'�
�C(N2��j^Ec$t#%Tցi���1�c��%dLa�!ϖ����c�5GhP\�H�Qr�쓑K�D�t���|���ӭ�_�OOD�X&zE�S��
�Z�;iX��C�������)q*GƜ�Q+������5r���P�yu�%�p��[�MTk�5���d5�ע�C��c�S+y���m5���"�:��C�;xu���G��f���� 4��w��._�.��zwk�f]}ǆ��{���'�쁐�,l�Tc��X��92	�V`�
��Ё��y�;���5�>(A���Y�%�{�Y�M~L^�zgg��Q�������ݻ ��MOը�h7��+��?Ӝf��wI��AzBf�3����F��?�a~VX��R�`5����Jk��h���A|���֖[����f�Y�ڝ�q<7
dhI��*X8�˯�ҁ��X/3l4b䮜��8,�7ޱ��Q\�ϥ����9#����t���/�ܭ:��`�}OZ�3\\ӟ�	��x8�nɯ�Et�f�A�Tu���+�E�ŋ��bDoa�Nk˛"U�!�����O������+�ɯ��@���|���)h'S���7$�eҫ�h���yHb�k��a��f?�&����:����������OzRegv�!�t�LMi��Jѥ���匐������sH
��������e�
�
V���p��?�Y��J�p��EA�p�E"�_Q�EQ	��Ԣ��q���9j=���$�H��6��t�d��k�θ��b��k�f��KKt�ޢ����|��[�Q��^{ ���38�x<�q϶��m�d�H��']ƽ�`�����W-A�ʝ��ye�mƊ篼	{��c��Q�j�P���K�u��n�}#��kW޵��>�j/sJ�s:�whS����Eg<>Y�]Z�����k�f��0(3v�t��"�Z\#�|���C�.���Jo�sW���m*�rnc��\ېR��[A����co�|����?��c�=��C䞗����	��#���[��C��^�^oA�^��v�D.xB���Nt�$:F�P2F�ֿ�1C[���%��ж����jy������/B�n!��76	NjO���.t:��כ`Q�Ad��R���@9<PN��ƌuM��NԺ�]�ȟ��{w�B�d�'��" �_c3��4���V��o�fD�(���z�T�.W0AR��}g1�B���y� ���IY�p;]n�ݨ7�)E�R���!��7T�kc}����T0��X�+��.�B��� վ7$k[g/�Z�C��e \�R�G�Y|#�F1:��X�jA1�G��������
�wqp�%h�V[fl��뾫�h�<��GG#_�+��s��}"Ao�V�
H���a������a_����dr!4M�*B9f�ZN9��3���K3Q�Ɉ�bo'�II H�n�Έ��4�����JJ���'Fբ�睆��@/�h���gv� 4�_̵����ɳ舕��䧚�g}�Y�P@=c�������p�2���KL�P��3ch��]��n>�^(���V�`B G��	�d�QMmؐW��-����CJ��2d�p��CG�>�}���x����k4��o؄�K�7u�_����,{�@��~;_�����:Rxc�⋢��r�P�6	�<��H~��65��Ȭ=Ʀ>�C2�F{�̌kW}}�O���|Bᵟ��|m
1�Tj�B�SC�xp�����N�vy�Y�$2FxQ�;2��xx�╆���W�I��Y�<���Oΰ?G�9G)�lDGsIh4l�Y|aim�=��
�no�Jb��-�����P�fMN��j&O0��5,�7L9D�y����!S��)P'_I1?C�EJ/8z�ҋΆ^��³�Qz���WOD�!N(��X�
���Գt�X��s���z��ɉTB{�,��J�9r�'wǝ��������pZ�hlū�<'�;ٹ�(
�}�l΢+ta�T��3e����=�ǚs_���.i0=�qO�d��WФB�}�u.U�V��E��.>�����C��0��]��(2�)�&2%b`x�>�)�*�˵t�\U^��QN��ghO��)zy���(f\���&+:N�Ύ�9?���
OrQ��ON�>����S��uy��������4�i�?�.�G�6�br_k�?�?�ྴd	�̸�����3�lά�+[���lf�-C�*��R$^:cņ��O1k�8y�?��~�'ʼ��j[���0�v�E,���i�;�2�z��!���"�<I�A������g:��������J �t��6[���E}�N<�0v�Uo�ɵ��+((�����5k\�PD�d]c
���N����1D�ȣ�W���RK�
9󩞿*�d�>���d�&���럹�
����G�hV�L���F�b�P�9��3�ω���[m����8~gŝ�T7��!vX�̨n�9����<����?���D#}�n��w\[�)[�ܓ�ѳ�kUX�ݡ
)OWßwa~�5̓ܳbP�,�c|�Zň�n8�R�'|�̧�RF��s�<�+��s\�5�зY�t�izj��p��_��RL;Njh�J;���1�4�� 6X���� ^�$���nt���\� �  �u����<�yQ�٘�J{���6�8�I�����G�g���k��J��j�W:�s����V��ju�1�"�]	��(.x��0#ĳ�Ϲ�"���m|,��0�a��k$%$�6#|EaVdP�Hۅu����}(��S���t,�Y~Y�~�L�/}Z���'��=mpG�K�� �ep��:�lR���*XX�=���ɮ�(Z��K쌋��)����;"Fv�x/!x,��W��C�<�/��P%z����>(�B�s��8�����j�T�7|������fm����:�P1~�/٠"����r+��� Q��Ah+ы�~b���+�c���θ.����2V�9(?��a^\ݍ��p�1Ɉ�h��"�PuA��lx�n6!
�@����(l"b�aiԉg2}�`g�o��f��ù0:�%�5��)����N䴢������ ʖ��ڴ 11
e�$b����P=�z��<Ӌ
E�#�e�BĐ��te1��á�	��٤����L�aR�����;�u)�K`MEu��
�1�g��2(��H~VI��7/����ɰ�UV�dQf5���յ��0��f�-��c�Hv3��rX���f��T�3%���e����}��4�?��]L���l&g�S��������/O�����dνݨ��21�n�}G��þ�&S�\�^e�Ӹد ����ï֜Y!���G����P��e�E����_�6_VU:��4O�?L�U�x����&��(h:��DF�׮]���1�J�&�
p���
�䞅��v�b +gkc�����LR����,��\O���6�lrפl�Fk�:ت�����z���vk��.pm���jc;�nu�
��������u��;F�N��ث�w
sC�
e���-c��Iިiaz��O�W�`z��b����Ռ�} W^[���s��¯\7
�]���1��H����4u\���|Uc����}y�d��Kpԣ�Cތ�9����f�,10֙��	��u$o0��^����:��!�p�k�Y�\�G��W����|��8L%����)k
ވ�E�,r��N@(�>��ݧQ��t�0�[x/�ۚ���)�����>��輦�
�Z�����6�g����kVn��[	�xQYK�H�j�
���>�����׶4�ѷ�B�l�q�C��<?S�i�)�����S,&i���`��8�Ό�6)ћ��2���R�sn���,���"&+�?��<CM�w4����^�W���޵��wԣ^q�$ l\
~?jh=m7�|W�H�q�?�3���N��u=Ա.����D�SA��<w����ҩ�_�����ͭ$NӅ@OWP-�t�.��-E���2���/���st9��O���܃=���S�@�d並�E�q��ą�{ĕ+/�"E���-!2T���t����7�!{<|��
����Dc����?~!w��C��Jt�7��ֱm;�;an���y�H�s''���6^6���û춯4��	����{��c{���á��@L>�~����Ȣ
7D�F�f�x��X����x�8yS8|L�� �����l�2"	N�2j�~@�uN�����F����/�<�/ć�ۧ4��$�q�lw?����q�~�K�4��nD�S��£�x��Z-�U�Bƶ�
�W.���r):\����D2��6��h��>��}�޹.k�P��������g�>�4ޗ��Ң�Q�8)���jΞF݅ˀ}�۩H�b]+�I���p������:��iU3�_���h׃8��1w]Fķt���\6y�2c�=�(#�z���̵P����O_*&zcM�0�*��$I���
EU�ܗu���ߞx�9We?��^q,3D���>6��p=?-�2h�R%��K�Vz��tǎ�<Y3�'_�[7�Ϋ�4D���M�2�SlE�4֦��Mcn�hSw������K/���H�     