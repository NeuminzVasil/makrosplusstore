PGDMP     *    (            
    x            de1h0kf5obhvs4     12.4 (Ubuntu 12.4-1.pgdg16.04+1)    12.2 '    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    8845032    de1h0kf5obhvs4    DATABASE     �   CREATE DATABASE de1h0kf5obhvs4 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE de1h0kf5obhvs4;
                vyunydlrwviido    false            =           0    0    DATABASE de1h0kf5obhvs4    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE de1h0kf5obhvs4 FROM PUBLIC;
                   vyunydlrwviido    false    3900            >           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO vyunydlrwviido;
                   postgres    false    659            �            1259    8845442    authorities    TABLE     �   CREATE TABLE public.authorities (
    id bigint NOT NULL,
    customerid bigint NOT NULL,
    authority character varying(50) NOT NULL
);
    DROP TABLE public.authorities;
       public         heap    vyunydlrwviido    false            �            1259    8845445 
   categories    TABLE     �   CREATE TABLE public.categories (
    id bigint NOT NULL,
    category character varying(50) NOT NULL,
    parentid bigint NOT NULL
);
    DROP TABLE public.categories;
       public         heap    vyunydlrwviido    false            �            1259    8845448 	   customers    TABLE     �   CREATE TABLE public.customers (
    id bigint NOT NULL,
    login character varying(80) NOT NULL,
    firstname character varying(40),
    lastname character varying(40),
    password character varying(255),
    active boolean DEFAULT false NOT NULL
);
    DROP TABLE public.customers;
       public         heap    vyunydlrwviido    false            �            1259    8845452    customers_id_seq    SEQUENCE     y   CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          vyunydlrwviido    false    204            ?           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          vyunydlrwviido    false    205            �            1259    8845454    invoices_id_seq    SEQUENCE     x   CREATE SEQUENCE public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.invoices_id_seq;
       public          vyunydlrwviido    false            �            1259    8845456    invoices    TABLE     �  CREATE TABLE public.invoices (
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
       public         heap    vyunydlrwviido    false    206            �            1259    8845464    nomenclatures_id_seq    SEQUENCE     }   CREATE SEQUENCE public.nomenclatures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.nomenclatures_id_seq;
       public          vyunydlrwviido    false            �            1259    8845466    nomenclatures    TABLE     �  CREATE TABLE public.nomenclatures (
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
       public         heap    vyunydlrwviido    false    208            �            1259    8845473    purchases_id_seq    SEQUENCE     y   CREATE SEQUENCE public.purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.purchases_id_seq;
       public          vyunydlrwviido    false            �            1259    8845475 	   purchases    TABLE     i  CREATE TABLE public.purchases (
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
       public         heap    vyunydlrwviido    false    210            �            1259    9133715 
   warehouses    TABLE     �   CREATE TABLE public.warehouses (
    id bigint NOT NULL,
    nomenclatureid bigint NOT NULL,
    count bigint,
    location character varying(50)
);
    DROP TABLE public.warehouses;
       public         heap    vyunydlrwviido    false            �           2604    8845482    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          vyunydlrwviido    false    205    204            ,          0    8845442    authorities 
   TABLE DATA           @   COPY public.authorities (id, customerid, authority) FROM stdin;
    public          vyunydlrwviido    false    202   �.       -          0    8845445 
   categories 
   TABLE DATA           <   COPY public.categories (id, category, parentid) FROM stdin;
    public          vyunydlrwviido    false    203   �.       .          0    8845448 	   customers 
   TABLE DATA           U   COPY public.customers (id, login, firstname, lastname, password, active) FROM stdin;
    public          vyunydlrwviido    false    204   �/       1          0    8845456    invoices 
   TABLE DATA           �   COPY public.invoices (id, datacreate, department, comment, ordernumber, senttoapprove, senttopurchase, invoicenumber, totalprice, resolveddate, customerid, senttoprice) FROM stdin;
    public          vyunydlrwviido    false    207   /1       3          0    8845466    nomenclatures 
   TABLE DATA           �   COPY public.nomenclatures (id, comment, price, manufacturer, nomenclature, code, submitdate, expireddate, categoryid) FROM stdin;
    public          vyunydlrwviido    false    209   @       5          0    8845475 	   purchases 
   TABLE DATA           �   COPY public.purchases (id, invoiceid, nomenclatureid, count, approver, resolvingdate, comment, buyingprice, commentnumenclature) FROM stdin;
    public          vyunydlrwviido    false    211   �h       6          0    9133715 
   warehouses 
   TABLE DATA           I   COPY public.warehouses (id, nomenclatureid, count, location) FROM stdin;
    public          vyunydlrwviido    false    212   ��       @           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 15, true);
          public          vyunydlrwviido    false    205            A           0    0    invoices_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.invoices_id_seq', 1554, true);
          public          vyunydlrwviido    false    206            B           0    0    nomenclatures_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.nomenclatures_id_seq', 607, true);
          public          vyunydlrwviido    false    208            C           0    0    purchases_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.purchases_id_seq', 3827, true);
          public          vyunydlrwviido    false    210            �           2606    8845484    purchases assetelements_pkey 
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
       public            vyunydlrwviido    false    204            �           2606    8845486    invoices invoice_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.invoices DROP CONSTRAINT invoice_pkey;
       public            vyunydlrwviido    false    207            �           2606    8996816     nomenclatures nomenclatures_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.nomenclatures
    ADD CONSTRAINT nomenclatures_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.nomenclatures DROP CONSTRAINT nomenclatures_pkey;
       public            vyunydlrwviido    false    209            �           2606    9133720    warehouses warehouses_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.warehouses DROP CONSTRAINT warehouses_pkey;
       public            vyunydlrwviido    false    212            �           2606    8845493    authorities customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id);
 E   ALTER TABLE ONLY public.authorities DROP CONSTRAINT customerid_fkey;
       public          vyunydlrwviido    false    202    3747    204            �           2606    8845498    purchases invoiceid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT invoiceid_fkey FOREIGN KEY (invoiceid) REFERENCES public.invoices(id) NOT VALID;
 B   ALTER TABLE ONLY public.purchases DROP CONSTRAINT invoiceid_fkey;
       public          vyunydlrwviido    false    207    3749    211            ,   M   x�3�4���q�wt����2�4�p�C]�C��9���&�&�\SNSd�̨Ϝ��Yւ���o�ih�̏���� _!d      -   �   x�-���@C��W�8��X��p�oZ��2���B~GfWn��$�LpG������U0H����`���"��Z��X�\C�Y�ޥ�D���M�B0�B2��9F�;���0F�^r-�p�B7B���<����	nyL�:���n镺]��=��o      .   x  x���Oo�0 ���sxF[@��M�N���.���4���gv����%��6�a�9|ϒ+f�(`����-\�n���n����,:mz<���1�������=I�,�A=����Ɔ���5�Gt.�&TZ�Uo�;	��H"`��xN|AؒsA"y����F��(�4���6���GJ�v�T)�.Iz�S1�]�����F���,�+���V*���^*�-d5�T�[�j]`I��19��<UE^o��-���fB���X��J����_��µ���X��1���^��t���D��BAg���%_������"1�KN�^=(Ǡ�g�p-����E�:uY�R&��χ&ב9���?L�UQ�^z��      1   �  x��[[�T�~~�y\�̨����C�8�N$$��Mb��+������q˱����%�v`��������TU�����5V`�朙�uu�W_U���'w}��'al�~V��_������ທ=ʾ�'�g�hvsvkv3�f;ٳl�d�f{�!�u'ًl����|���O�,�1Z����<N3)��>����ލc\���E�i'��P&ٓ٭l��>̦��I�M�Ѝ�1��d��
 ݙm%�d����>� ߄;�f���xnʝ��e��I���}nbpu������l\�|��S��1Y� �Nf7��_���L��a�"{����{{���l��9a	����6��.���[h�d�=�xl�b`U ��Bv��lt��	x��	�� {	Ghn܃d�����&fmu�1��'9�:-�<
Z���vӿ��_�n�M4o��up����=xcx�7��>��n�n���l�v
�t0���k�{�)��(����S<l���l��O�'�� K�]��p�>ܵٲ�1ʃT�g�����%�E|���ݲ��6+OWWW{\)���i+������.��Nx��3r��˺ݾ���\G?x
ڥOl{_��w!�J��5n��mp��lY�����y�	0{�ʹb�����9|cH��R:�>�"{Páh�Hm� ޓ�Vag�b0���\�Ejv�8��`�gd?�.��e�+�hnxy�W�A�(�X��A�ڥ�~	�x�;��P6i�^?���0���� Y��0'�}���ই�Ղ�1�iq�� M��%~�����{���`u_���~�	a��3�r�I�*͊ǋ�ǆ4�R��޿1n 3L����h
[����x ����MZJR2�&d*r?�͏�5�m!G7l[��G�g�a����tv����oi�>�J홌.K�g<�d#L0D&X��j
�Hl8T�L_e�g����A:<��NJ��h��\�z!��� �����]�J%P�č�d�9����@��1�&��&2�r�#Z�2�t�ly�%%�-T"� D�c=O�Ǔ�2�&$\6g��;`�;H���Z"|l�k�a�,츗�������Y�5����VnKo��WZRHRZ9�BZ����+�p�'(?���D�}z�
U+��32�[Z�D�Tx��t׃���ިN����5���kW��I*` �=�	n�
ak l���(�lJ� ��ci�p��>M�r�l�6U�C`h�yˍ�t�Xӝ[x�������$��盏�VyɆ�!�a��8N��<<�4� �g�R*�?�
Mr@�H���F������`���"8S?{��"��W=�aKM9�1�+!ϡ�UA�~�-$��>}�Q؊�|ϧUy�6�~W9j0�x%4e,�U�\�h5�S��O�(#�2dbS�ec d����@���~����wg�	���`�����e� ��.��R9!����ޞ���:��j�"�6���n�;��=]m���^�q�i�Ȳ��..*xZZv�/|w˶��Z}.��ZVƾ���BNQN�7��]����o��Ğ�6��\����W��@1�ȳ�߾}#�'���j��ͪl�u��h�q~l� ���?
�{�oc^�I�����>�7����m�/`25:��;3E�/��������g�����<�E��l�W�=K�M���ʠX/ȵ�T�H�W��e��Ãsm=�,Q�:�hJA�:(�DL���(�ɋ�B�x&�1(o[�4����$��Y��l�
�ӥ*�G��x���W"@�`w6�]�+�Szc�(m��>0��^�OE\�ej�l��QZ7�C��6Y��"Y�v��+�~GuƇH�����j�^�*�)�
p]Uz�eb]$-���H���<�4ZjJ��b8�g�T��.�Um�b�b�R�|�����7��&�wIϖ�Df�>)ʜ��Ҋ��B�i`�r�ʖ�����f��0��q�,E4��.�4�5g�%%O��vJ�c4��=�,0Navh�iE�PEfπ��DƤ�i�1�zN�}߇��P}�W�ɉ�=�)���pL��iz��N������ƞNN$l�����	�f���vkM�MP�X��乨i�ÌG�lD�E���S�Qrf��fQYF9��?��j5}c�a�@��_�wu�xhN8��sܖ㩘���N1�	�Є�������kn��)��m_v�mu��H�PP?��H�,�J��Z�Ek�iY��܆���3�2�>��=܆�H�Fy�	_��-��;QS ���K6�yA��J���#�T�9t6�`\��A@���G���:HEN8�B��ԋu�mZ����Q�GA1P�":l̈��b}eM���ǧ$��	%�o���-,-���1&�TlZ��`�y�Wu�X[�ż⎳��J��Ǡ�����UeLZt��T"
�T���Ԁ���X�ܷ.tW��]��,0��bX:�B�b�_M6�����s�N���9�� �5U��i>$�)���b��e����q���}�a�dH|E�����Q�Ψ9kvӇ�RI��xܘƕ��V���mre��Z���<?��UA#8n�5�����-�.{�$Y>��a&*���VҤaf�"�G4�r����]c��g.i�@=˛/tJ�%�	N́��O�u~[)V���)���@E)�j�� E�	�E��ԚdKvB��1N2�ږ3F�=l�����{?{���^N~�aZk�A�5�U愪�"\nׄHB{�ǯ���xz>^��-x/��ĳ��K����hcy� ���(���<&X͚��/��*
0�AK��#]�.~�({Q6G��Ԁ�5iքp�Զ���N�7}�8��ɜ�iXZ�eTy�U��~J���vSr��A��\eᘋS�gb�!�SߴɅ��%q�W�QN�R%'%�}�߼'p��S�������V�L�`���d�f]i�@��f-�T<:615��j��O���䩰��x	�ӹ�~�����ӧ���*�q��͢q��*�n~��4{��# ��Hc� �ٚׄ� ����:�$OXu�0�V��[crM�����וWNWy�������>��fQ���M8h �MI�w������$�s�$��9/z���e��t��HW��t�n���DG#m���UO��|'W��tW�[<t�}��[�>[��PN6vԫ�?ܦ/�ր<M���f'���y���8�G��#�Eq��9a�a"h���f�J��s19��?\����fwC'�Xl�O�;�Ɏ�ƨ�E_�
�A���vL�p�EE���� \j�`��N�r�CTMI|�V�6�k��@[��'���m��A��ҙ���ݺE�ޮ�^G�e�A�1lюopbDL����Bxo:��Z�{���ȒKi�I&Ӓ�K�]e��7���V-s2���3o��Z2�����W.����(�NO$�Ǵ3��w:��l���|�C�KK��]2�\v���u��i��b�z�f0�VH,�^����f�$���e�ԭ�*��Fs��i0��V�+'䒅��1�&Í_^�~�ݷ��&�x������v��ˤ��eNҼ�,���GفT�%� ��2��dDcE���tH�n�O������F�N��Tb�.�a����4���o���	�[��Hfa���O��I���Y���'�; *� �#ȆCu�R<+z*n8�b\^�G<C���uX����R`� ��7�j��� |Q_;v���D      3      x��}�s#Ǒ�g�(qpNl����r( ����P9kgc����pf��sHc��ڵ���݅ow����}������G�9b��?���ntuw5��֐`?2둕�ˬ������7��WOg�g�������ٷW�&W?��t�b��셺�.}:���n�����;���#����/�>��ށ'��Ur:��OީVO&k���ḷ6����G���Ӡ��pxi��I�g�i��=�Xg㋓ѣ�2�<�ۮ������$����V�Y���b���l���ﲭX%���[����	��)��,.	�������*�-�{�ٿ��w�vߧ��<���p(�����k��c���H>\Z��������#�0�cM{�`hɶ���I��ѭu��������φ������'Ѕ�g"��{���-{{�����9�z}���|g{�=�?q+��X;>c�8��e����r���0��a@|���3E�<��2�$ye������&��t$w:�!޿}9��2������01ߢ���|�1S�8��	�9%�����U��@l*jЅ��Yz�{x�5�KZ�7o�c�El|ـ��O3S�e����GV�M-�����]ʨ>��d7�����)��3�dF��6Ϸ�r!��R��-3SqS��ɲ������)Km�LY�)/c�ܔiF2R����-��K��H���|gQW�A^(N�V4m
��I��d������F-�0.���C�Rqub�.�)���ȕ
����������op��#�پTl��#��}S6v��G�!�M�rD��I����gL|8ul�j|������rD\�U����1��O[c��0�l>�~ȏ�4>��������H��3�U���P ���1g���Mc��T�����lL����܀�.b���p�l�:IM�l�줌l�(kD���,2�(��T�~�dN�(�5��)���m��@CB'�)�ӇhlX���z(~�<��R�o�.�'�SA��
��:����\'��� -GHxL.�R�q��� ?!�%�?�����eĻ_]�z��ً�����~ox�ȶL���~����3������<h�/��h4=�2�ta��\��5�>
��
c6�����A��:�3"%G��y6��9������;�]ԉq��k��ǹ^��� �8~$����tM�;&��V~b�����vB��4
,�Bj�5��9	�j/�Y{:�b����؝J��+������N�hu�kr::O�Ƌδ�=dwvy�lۦճ���n�����&����|4�Z�u��,�Y�*��Jc��~�=�O�l7�;��y���A��$L��p�^�&a���AҺ>J�x.Y���)��e�2�|Ǧk�I�|Gӟ"FK��%`�>5�-��?������Ղ�L�˫�ا0�x�+�S޸۰n�{{��`V�3YyC����f ��	h)�r���kpP^]�fe.`� ���8���Z�������ɸq�ۀ��nIX�66³� FP�j�Ԇ���a�&LM����w%���>���\�o
����'��%<���g� O�,��}:�f$�nڛ^t������`66vway����pLZ���KR�Tk;�~�O��CpLa�?'d�
L�?\}v�K��'U�c>���&��?S��/мoq�Q{�+Un��a�+c�V�&��&	d�y<�_�R��j�]
�3rfl	�ԃ0�@����gQۙt�],}�H�f��FC)|5�/�_�,�U��WI�vX#�V�:Y%.������BmҾx�0k]Aj����{%l��~����%,U��Nփ)F���������XY۝J3��FC��^}r��k\��0�����a�1�=B)������� R�"�wW�"p�����9]�h��o������$��{��<9��҃�
���I%�n&��8}�_ղ�� +T��Q�O�}�P��$V�vh�� (]u\C��x� ��CR%�:i�I�Χ#�{0�}|��c��������޵@�%�n�#2������������m�r�6��/�
��f?���3Ȝ�u��f�kfn���l^N�+��E��RTjB����F�g��)yOV�n�P�>WJ?�G�� ]|8w�L���X���W���J�&��r�7�mW7���6�sh���p�A��l��!���5-pŹ�T�/�s�_"9��1*�� ���hT�QʈX��36�l8�T�'����=�<�c�۳v@$Ɖ����>��X)+d"V�F��NY��\p��>#��J��
�el;�����*��Ϡ��"F�/ÚQ�GY�HK��QW56D��:Ϲ���b��c�U?��^�������0���ӏ{�S@M�:���@��RR&��6,���d�֌����Ԋx��25��Q����>�^05G�)Y�T�9y�2�l���0����Y5gU�0�Ss����3�"y��E$�0���_"䦠>��ײ��ؘ�d�)KZ���P4�o�~�d�	� T;�[d}�a��,1�{dmG�z7B��:���j�H�h (O���h�G��I�<O'�A8�/����^?h��w�q�.&���%h��õ��:�}���Q�>�\�vN��UGR�St�I���,��t�dp��T��/#�W�pXE
��k4��x����F� ��o�w6I�6�U�FW�l�9 ��tMf?��d����dnc�N/���\�&���#ʶ�J.˷8��? p|A��[�Jwksa�@yjx�O�����I�0�^�O� 9���h�ܳ�ze� ��[o���Gf�D=呿O������O�eb������V<�["��'Ș����
� Q���'�F5�C�d灏����pWv	'=����|���t��ٷ���؀�)#����W�	{����泹H_.i�Lp@x�vDz20��V��3��`��,�*4�W`d����P�w�{��v�%��<�G���Ūt�r�^)�:{�sE�٫��ӏ��ׅɰ�LK~������,i�5�Pw+��\e��T�TyMj@<b������hr�7�_x��33[pqsΘ�aass�4���d��jp�$Zx�DA 5�`��G��3�Bb���� ��� .@����Y��wrj�a�I؜��q�Jծ���|�=�mQ���0hG
>j���L�C���J��O���&}����+�\���W�����^��
�޸[��&������A�4\��GJBE8�D������� 
�}K�-�~�T��QmyN�v~�i7R����	��'��(t�f+&� �,�|#D������4]$�%�O*Ά�g��*�,�Y�F�̿�g^�<��~ٕ���5d���;M��5t`Ihr�NĨsNkM�����e�az���\
[���!��f�x �V���`��[1<��ܾ{��=ƪjZo��'��h�m�Kᔆa6[������=�`9�l�����K\�-�v�yoЎ���<����H�h	�����c�%�<��<#[���}9��]����ޝ�ŷv�A��qg���KzDe����ڽ�*ق ��qwgU�k�G�u��w��Xc��k雛+�Rs�a�Zw,��U�PNZ��Z��-	B~���Dj���d]��c��0��$)�(�Z�"��5')߄;��8�O�+̮��R-@�"j��hP���E���uߏ��s�����`kco�E�Cͣ��D��h���3)�g�Y�|a0�cj�Ī�o�����3R����:��c�|j:"�;%z����I�-�~:9�m�0��]N�PW�p̳4��Y�?Pz���Na�@9�qX&��x`S�j� i�\[3�k�q3xBZa÷r�����!����^+���
8}�ܼy��J�yǒ[��2���`؃�Y��JZȰ�KLv�������Ԩ��1b}���Y���V	�d�oʕ��[�*�f�+�8��;�J� �P^�7t?[E    ���J��"#��{��z�Mxސ�]VߎpG�E ��wЊm����4Oe�>�v�aԠ�b�U��F��oJv��`뇌���@�݇+���V2�*̩<��Q���x���tP��8����u|o�f]������ݲ��wvw�[VB�:ܵ֙U�Mr�y�g]��`r�nol�^�U�s���O�Z�N�qx,����ޞ�Z8L�+��.���l���W��k�t���@6ڂ����cNw��c���[0�d�3dK���2�Є>��=��K�KX�E\�'g�A��H��(N���H�%�{K�d��%�]�C]��$�m;�n��K��Q�����Iu\LN����5O�NϭS�c�ܢ �4?$&[�(Y�mm�k�>a�>
I7��J����$\۩(��ڨ����Ҟ�f$�[��Dڒ9�H�����\�����P�-��MLN&��9hY�V��L��1*�f|�$���t��Ť]e06^����lR�ބ�*G*܎�J̌�N��m'����)���cN��=_�hi(ơv~��pt�9�t��F�����s`Iڞp�d�L0o��p;M��'�h�E�2�ב��,M�����2�VT���|�9��$�� B��D�`8��_W� i�{�;ȥ�Z�l탃���m*ް	r��`GM����?B.w{���6�e�(��B�Q�����	�Q&��\��b~�
�V��F��k��s$C[�tMo0�fq��{k ���u0�ך|E,��6:�6v/�~���b�lV��40�!TѨ���b�Yl.�*i��p^��b#��F���b�`7�Z�A�Iol4��b?��x�� �t�Ƞw6������unv*:*�G�<$���p��p�K�,G�p���Q��P������l�k�|2ŏ�e�N����41M ��|���g؜����	 �'�i�h-�"ԅdg�e�iAW�Ez�e��6�b0Bh���px`�?���1A|��c!��%��jYu��cBV�����fc�H��E�"�n�긿��87������F����|��̘a��������·��h���\Xy��p�~���rz��C�o����)��*��%�`˶��č�F�\#���r�j���©39k�X}��*p�P�j�;Q�M:#,(��4 ���C�~8��ٷT��6xN����[*�n�Kr�� �V���QH:<u6���2/x(p6����������O�aĆ\ۭd=>�>F��_2b�\��^�V�&5���Ç�NHn��d�>#51w@����>W��W���HeI6n}��կ�͘���$K�i�$)��w��[��=�%<��i��B|�1Y>[T

�zIB���I��'�bfOIK��]&X�]&�]�C<o�*5����6��)�}v�i�t<��+f/|�͒����$��c���c!ks�����%��Iߓ��u�<h�<�0�U⋉Z%���?|���QW�����KDB4���'��u�ppL�[�ARI>�ñ��b/F�V��o��U�¡�zb��o	j������*���3�I;	X���	[�0�gj$~�����MG"�C��i��i������T#����KdOSX�Q�#ψۨ���>P��pZ���(��j�6��dr��17g&���8�.���e{�{	�8��4�^�$)��:���B���Y�Mf6�"�R��/���R7�L�9(��bR���7�����o��R!F|���먻e�}�A���7���x4=��G��d|��~d�R��7��8�e�ީ�ʯ���8� t�Qvlt�U��FV����??����Wo�ޫp��a��Ϧ�}<|������u߭����I��;�ͻ�[��,����3����3e���L%	�H�����S�O�mJ~]"���%t�ҹ>':�k�Ų��CJn�,���[J!4ƾ�T91Y���E� �zߺ�Ѵ��v��SE������5�Z5kkw�*(��r�2�^xs�|�g>���)��bF�C�#�d��\w?�08x�-���s��E
|y�n�w�?�S�ݓѨ�iK"�Z�@_�(����<�$5VO�R!�8������>�ea����r�3���N��I��_�����͜vin�-�05��x{�c�l.ד=��MiʊV�aEF$��ԇ�Rt*��
7���x�!<�
+J/q3�?�i*qJir�i�@��g��� ӥk����I�a��($�
�O�{��N�Sssނ9ٯ�9i��Gd;г��(�ڞ����po<�Z�١�:���J�Z�XX��:�XX�p<�����~*���m���:�U:XJv-���������=噳8��&�K�W���}J���g5_/�C+��-q�Vt}�8�+;m������V ��F/��|�;>���~���q5:����jZ5��ƛ̚t\���Zi0W`�X���*f:X��s)����ID��%q���nJ�-����YʦB
����0��x
���5'"���4]?�m1��|�����fL�u<��c8�k�Ҧ���Շ°����H$E���4u��5ƈ�sa�2��5ͫ�7�r�TuN�2�l�;�1n��Y��AZ0�Ut�<f'�4jQ!�����\:7�eFr��i��J<���a) ]1k��U��J5�E�|�S�\�j/Ku�"HO�}ZD(o���d���}�闉�WA���`p�D�E�Ň�їLj��܂7:Ǖcl�OT��Łd2���"��]C7n���'獖 Ru+o�*c���T�"o*�z��v�Rv�qA`E%&[oH�m.�D�\њ����1�z��kJ|(a��Wi�/�h؛���,z�厴�U	M�>T{7I�p\�I2�T��}{ɪ��S�bZ�
����+�^V<B
�D�3�/�d*d,�$`���/Kgd��"���H���Ѝ#ܸ�S-&��==d�*4Ѻ}�Ұ:5V�1�n��qqg1-���Nݿo8V�D�*<f�$YLږ'�82S���5sU#,��5j�2�`�n�jt�i5+��-E�)Z��X@Oh����-S�
�㸘���(��!���v�zp��O�_��%�IOс3�O�̣���]�dZ�^��P2�ea����Q�0�j��Z����d�-���4(��S\�,�M'k�+���I��̀���p���+��pmI��2�%�h�IS���k�U������t3�jű$��+��٩(�d_�N�⡄V#@��C.Ҁ�������>���l5F@�S�_����,\}nP�)��¿�NJW�R�˕�YDȼ�M�Jv�E?�])1Gdq�p�����U������5��k�d�Vj���JႦ�g)R����w)r%ZT!�T�m����歽+�L����*UiB�UP�D�;�c��|���O�?K���}C9�	���q8!��`�i+�-K�L:�ݚ�i0��DW����0�iL�T�3I���H�ъ��g�G�����@��6�&�Z�e�~چ8��a{�4��
U���KU6)58mo��x��V'����WJ�Wq�3olT���80�:���=%�iM��
�k�(�3�"�>_T��ɺ��*&U����{�֭�]�\V��9.���%|����b؃��-$hU�I l�8��4M�`a�����,Im���v�ܛ6���T"&Zщƪ$*:�p+Z����x�W�џ�S�>�uB�L|5�s`���2$�sT���GBZ�s6P�e��LD=bQ��/�1&>��g�s�s�vy���
ӰU>�|��t��~t�V�$O͎���$��&,�`q\�#i̼�>����@o[ҧ�.���T� q)��4�<f�7"U�_�Z�	�f)NQ��egB�7�d��"[�E	�ϧ�S �Dz�)��o,��A[Ux^kji� �6�����ᠶ��������x0Y"E��kPSeܛq1mY,#Aװ0n︎�il��k������m
��R�P��5�t������ս ���dw�㢶� m  �1�HϾ͒�>�l]�=q3���h�1����t�d��<�4��'�� *�)Hy8���<Yd�t�Bt�f,\�h!W��fl���}����/���z0�����oD�f�q[jE��Sщ���4�(?<9R�G4Hh�zw�)�S�¶�:�3��!���+]_go'������P�;���Y���k{F��J�jv�%iB�F����0E1�c�����wf���=��*����,�FW�,jOW��S��:�Q�e\�a��z���خc1�6����������GގJ�b�{����޺E�Akk�n���V0l�&g�,���?�$e��Zʞ)�@I䫺�6_(d1/�_��y |��/�v�_�DM��h�Z�*�������_�0ϯU�WUQ���şT	�Xt`���^�C<�M��,WP�Sa��6����n��E�<r���`q��'���� O�k3O^.|Q�⪳���֌t��wz�*5�rx3���}���]�C݌֑�x���0"h��4�=���a�7 |\m���s���*9�~p�ǧ�U":��ߛ��.��}��'g���]Z�����,:%t:�d2��I58�V�dV���I�>pC?��/���
�JF�v/���)�MA�5��2�j� 
��ͫW�(Q 8%:�smm�	Q(~l�ŏ��<��6&�6�d
}��=+>�E�����#F���9�����L�L`��21�\��~6ܕ> �(��1(JT��]L¸1��ݿ����
@���J�{㰻��P�8�c����O��8��PT���,)#��ò�Di�X��_¶�t�I�Ƈi�S�V>�DZ+Rcf6~e���¨0ߑ M�"+�h���Z�u��~e9��RG_陿/����4'M��-j4a�w=x�~�M���ٖ�Z�U>���帘�Qkl��Q����!��/��lq�Wo��U���3	�����a�ο���!��S!�-l>��:������9���GsP��g-Ut��j�X��G٧���I�	G(!��ƺ�i���K�k(�p�`0Q[�����o��E�� =/:�	X�"�M�SI�������N�Z̊v�~o@0�&�i-�)�$L����Q�7<!q9��^9S�#�����؏�7���vUj7���`����V�u%s�[������=�L��3#�mn�̕�ݾ<�Ђ���!LI>hYq�0�O���x��6��=&���I�C}�����k2b����u'����2]�[��f;`T��Ik���,hW���\�x�0�, :w(���Ma�)�����߫�߿�,Yh�{��%����^�`2�y�g88-���,�N]&H[`� �΃ʹ����<�x6��M�602$F�x��*�(������P	��֘La��"�e&ʻF���a�̖�*�B��2�Zb�/{�nr���;�%��p/7g�w���
�s��!� ~=����n�i���l��֐09j�^����Yq�a;=&��>c�@�Wd�i,�#��,����ѐ��91����T����zR���9�;���.0[`źy0g~#�*�0J$}����.�m�~[��ۼ���Isv`�ʿ/����F�I��W���4j;Z�j6Ȧ��`I����i�#bA�)t���0z~V�4G�^?$��H�.|��D_������{X���NwHI5�oc=>��E#}����e���,���en��__ ����'��(/�ݗH�]@�f��c���w$�M�hJ��܅�`ɩI]�r�L1x���.nghG�a�2���5���ƛ�kh�&�K�7��8��J����b��*��l�B���g�+������솪PcoN�`�9U ���\���w[��i�ImQx~��$-�R�
~aϘt��t�랄��E�T��Ϛ�2�~�P�R�\��|�6J��j��-�Ѳ�x�[�2.f�ǧ�R^����r�����(pk'�pܔa�Hx�pD��.0�TY}7�W"ޔQ�{�9�-�K~�┌�w%~Q��B�-. ���POj�0=O�P_uk�Q2 ����D�	�мC�I��0`�ؼ����P)��$X�.@���vEJH�Y��r�!Դ����4����z�����      5      x��][sב~���Y&@�}&yHɖd�$�^Qq�)V��$L�* dB=�V�򖽒o[Iy��&{y�]�m�F���?��>��z ��ʉ$r��s���c�VP1߫��zŬ���:���j3j�+V�����j�F����ux��y������m[!��W�zũ\����vc{�8�t;����}�.�[�5�~]�����Gx��;��� �kz���j�������a�?�����?��;���x�I|`�{��&<�<��������S �b������lu:���v�`\�;Q'J��A���)� ��D�)�2�AJ�e��_5Z[aŲ| p����V���B{=�ԡ+�dH�. m!/�l�z��e[a,���)0��fb��?����a͈�_=ތ��?����9>4�O�+w��3���	��	<�ؠɄo�7�0� |xڈw��������^��䦖~�ɟ(?Ѭ�W���ş��~�-?ѯ��~�#D�����|m���������VO'��&�� �@�Y �mcyو��/Aڏ����	��b�[��M1���vԃ�q�n����31r²�,���%����O�k�������k�o�k� Y&�5�=?�8:.�2�[gD�b�H���43��Ř��0m�Iz'��?7}KJ*߮��p@{�����K;���-Ek�vk3"��L{3�~�$�C
8�z�<���d���ab�a�V��o7z�wF��$�f��sHkWhf��<�2�*������~�b��mj��S46|���L�C��g�IuS�H�E�Fg��`��^otZ��E���K8�I×�L�M�v��#�?
�bxo&�6��3�w���ܪ,5[�R�oGk�͖���7��r'�u%,l�i���i�5Z9��n��`G��P�./� �mIfmV���X>��T?�g��$�r%���������o�^	�+l�xߘ����ޏ��g�C��ǆ�U1�������k�rC��r*�w�]Ђ�$x�5��#dɘ��BT*K[��h ˰���v#c����&��Ǡ��?�B��Cfq�Cۣ�˜��2�3uh��ݩC��M7f`I�J��]7��`��Yv``����G��O?�~�GG�r/��][����r�\�����f�ւY_@JF���(��.|�qx�g4.�w���1�1R�"W>$Sc�h����獭9���Yї
�U���CFՐ>';��9�$b<�*ʇ���U�t�z�;���v���i+Zx8�� 8�M��ޏ_����@�}����®A��3�Z�z��߼mZ)K�`IL��~�K�If��������w�'S�g�'p���̒��
����{d�܃����K�m1M���I�������m$8��!��)�JȮ�K��2��������֎��
+Ǵ��(Pѧ&A�3P8!��� X����F�#�y��я`����Bn+������t{�2���Y^.*
s�;x�9<B��a��'�ú\+����K�5m��Ը��T��T��D5M������-)`ɒ�K7�+��^���C*�q����2��J��L�<E��N���D�S$��%om�D�S���5sL��&���Y����L�{)�C&��N�|������ͫ��D�(n��b�c�y(� ��xd�Z�j���S�1�<Ηd0\�F`��%��1Fxr_`�8��n�����w�l�t ��,�I0�m)�̀����S	-�����+���_��:��>���%�j}y����Q�N(�uA�	jթ�:�A���!�}�����7r�#�y@��x~y�Jc�qm��vRL�\卶ž������C	��@�@�2�9dN�
 X�~�r��k,��^O��\���L�-��켠�e�y��!�х]v3����xuH�)��U�nH�{4�h�� ���Ġ�( Z�7��K	Ҿ�+�ߩ\�N�̇1ϴ�0�{��b\�����o�m�V;��F���������r��:=}9�	�w���~�=�����Wv�7[�g��'���vw���Ӗ��D�����a��,�J-�g�Ĭ�ά�m���l��KQk-�a�.v�a�/5ჯ�H���3���sK�>��EP�.}p�X��Dh�zr���]�jF��T��(�q�n1z8t[�ӎ�:����,�]��jGP�U��if�&�]t �˓6fN���s\m���A�еioZ�^ߠ�/x��r1�֓����H�B!Q���_ '
y�ѷs1���+�̈́�W��S��:������y�� �+ǧ�k�4��.1��j%�4��>����Oa!,�]��,S�AҪQ���i���F8���k&	-�i��~��<&̜�Ϥ�
��n�Ҵg�6�
�Ʀ�P��R����1L�O�aIr��Ö(KLU�z�A� ���X� ж�(Ey����H�^ ���z	t��X�w�����(8��G×4�X��wLÜ�PҰ�|*�T0�g� u��3y����A�=��G�<8�ǤP�y��  �SBe8 ��{����e�?�K��V#s�'<��'�TY�z�B�ҽ�?N�~�0!����n�q?���	�>���x&��E��*	*���G�Rd`���<���ޕ���:AE�����0�:?E��Gw]��2!:�ρ<��v�˘���j�����Wg�KQG5�u��uv"z��N��
{5A��!�`lD=���%LN�hR� G[8�F��I��a,txg�i>v(=���I�<�d*�R��K���Ԁ�պ5[�D�C�씠�VP�ۑ�][&R2��'��,���E�
Br�����&1:5Gs��Or��yQ�Yp����,zђ�Z��t�e
�a���SQzx������dg2�q��pl��&Ñ��4����i#��x����+�ng�g
֬(LAY�5
��1b&^��b�^��81
��1�b6x���ab
xd�u�;1V�/yx�%@��C���F���b��R�M�#m�Q��u�u����{B�\P:fO7DhV�@����s�5	mi�_ڹN��s�]9�XNe��.Pr	A�!_��	sƄ�$��A�eN�(�E��ªO�\�� �1�90���)�r�ɔg}��)�;)X�`��`n�W>,����'�Ǥ`r�K_�Z��3~?�Ϋ^���־U��\��O������[��(��Q�AQ.DE\J� �x V
� yvei���:z�|^c�\J� B#�Y��F�\J�@�Q���������"��v��t�)c�^�D��x���5Q�#^��uM����l�L�r)E�N2ٔ� B�j@ՙ0a���u6m`D��K	
���<5�_��6DJ2b�I&5��ۢ� |H�dJ��5�_��qЕ�����~Dö/���$���)&�TCԤ����X�F�c���JvT}Ƅ��gΘ�RQ �T��5:kb�m�)A�� Z����)�Ͱx^O�aXo��.��S��%l3���>4�����ʰ�p@�]P.���ک�P�4̗\��U.q��	B���#
�,�A�7��-�D(0+t�Cti�&N�j_Rh/t�:�3�u���ǭt7}ߒ�S�����P�<��ޣoƖ4����ˈδ=Ft���3�7-DΨ{S-B�b�ס��m�9Q0���}��o�4H�TJ��
08�R�j��G�Qdy\�/���a7�>��*����qv��ozuxP�Ә J��[�V4Dum�ʥ��#�x�e\��p��0<�,�����<J{.�rN�����=�ʩFL�>+߷��3��c�:���IFO��m�Y��%_��=�6�����O�*���(�D��� �@���ԏ�ۢq�Eʎɻ]�WNc��.��z�t�LH�WN��'f��I43iW��L�)��r/��8��4�O��������4}��kL}d�y�ѭ\�[ə�fȘ��0���ꔎ�t@
~���<!���ꄑ	��(��J<�XŜo5����J,� �����&�O�����p�    ��td�Ȁ�z�g*����#\��FR�I�U�]�������kE׌F�?�*���+W��	l��n:�S�֛&�_gX���XI�٪�-���R�$>X�s���w:|������:�L��FrS��0-�u}K.0ڄ����uj���F+ט�G��7�ۂ6��!YZm6z+"�$��T�4O'�����ș~�R�>��J��S#�P������o�+T\~0����� y#&'����Mk:���Q�UU�)�n"�R[l�V�e�5�G��@~?)��U07A�b{�'���>ɞ	h��2�y��#�U��ܪ�O� D�hƤsB%9�����7ْ��{�!!�%��<CB� $B�@h����nS��Z4r���e�]�c�1gh�S�$\��C�}���~���F���Z�h&�X`����;�W��#�U7�yP�V��N�GM����^G�~���`�R�|��,Tmޒ��C�>:���s��#;8�q#Z��ɐY����2���v�Ժ����Q�	*?�臄�q�$��н�U���hL����}��~�x¡/D~a3݌މ�כkQ�J�i
h*�x�j� ����0�=^�q.�8�\gh���d�`�Юgu-���C�����u�������$G�ݟ�+yW�����
-|�VI\p�J}���<8��j�]b��ϔCOjE�JeM�^G�
e�L�|^��L.HE�5��B��|�~��d Dm���o����<zA�R��.���+��U÷w�+�#6�z����/4ۇ�X\�'zW�!�G��a�=��S����ؑny���/\X�E뢳�6I�:c���f�M���v�o�7Z;8f�V����С�����CA����*Hj^�0�Z�b��X�M�X
�a@��rN�g��g\��ɺ���-�RC�'�~BR�Q��VӶ��l��O���,�M;��b΂cpvbF�A��0EC����Yt�'^Y�u�j�uO�Nas��%��;1���z32�X`��c��M�
,O?B�b/�t�0֏90�_�*kQ�l%ev����!�e��#|�x(��o�4,�mՌ�`p��������j�q�5h�j����h=���T��k�����`Q������j��މ�Օ~u��Y�׫�z�Kʢ=ʨ�f�âr�C|/���$Nz�����P�?.�#��� A���ȟ��"V��V�xR���3-�gL�V��� ӥ2-e9�Ti�u�(��X��>R�����Q4���a��;)I����j`&$Y0x�R����C�d*�e�SR,�Җ��
31�(�#:��g����G~vLy̔��cԚ�O>�[//���y�n��%��j),����r"ޔs*L����۸<J� V)J�J��0��+Ϫˬ�<��d�!gL��)<3���<�^^�N��|��B��zH�h}S��}��h��[4�ya��w2n���bٴa�&:7?~�LƳ|��e[1�eT��.i��Ģ�7R�X��w���᥯ӯ&I�U�u	��7�i�������|��aΣgBf�������z��AW�5���-6�=�#�����5Y������nz��� ���[�d<�H'��W����q9̩�R���Һ|�?�_�g9q �����`P��|ʻɼ�x��u�Z�8�?�(��Wu���	�I����BKo�^�A��uQe����`�
�#��Qޒ��b�bkHM������Wm�VDe�tK��}�s���Pt����ĸ��Eq#���G\[��G'cg��R�f���
�R��W ��	
2��ךA��U�B9�
���5�5܃wGx$��?^���kw�mڴ�_�UV��w�)m���j�W�#����`T!`�V�Qԣ��3;�Ɔ�p��?M�,*��N���������B�P -�ٙ�D�l;,Ȱ4,F=a1Z���<��P*�u�s�IƟ��%YNҠ��A'��A'�y�(B���+7�%E����%1E���%Fr��p��^�c��gj2�T\]qek��\-5z��.-�4����!�'�0D��]�3wO��U��'��MM��J7�s�� �/发Lli�8{��%w��`k�a������c;��1��N���r��J�I*!0���9JNyz5�aU@�# �8�kW$jV�.o"����<g��pޠ@塈b�F�������3YI�2n�-����`R`��@��ra�c%?��BoӘ=��ZŴCWFG<S�!3�k8�
o��K�`�D�/�4w��}@�-g����!o� ��T2����<K�S�+ț-x�nV�l���;59�����x�ܞhA�����R>̓��C�����e^V�u�,����]�nu�;�b��DN?���N$K�=S���?ih��'5�q�d)��Ȕ��x ���1=��t�:���l�d�C�o��,��"Y
��Y�ɚ�J֒+��3��`��6[�Qf+����f��+_��/r.�� �]�p=�K�VSĥ�Pe=91}p�������#gV������Vg����"�3�;9��X��XtJ�� iڨe�欈�b������.�*��K
�Po�R[�	��}�������Rn]���Ul9_�\��^��^��K�����e@���|����Y�l���0/�G>�|��p���ec>� y��ȏ��J>����$:�K���R�VrlH�!��%�Qr�m�"B{˓͢TN��e*O']m��.��ҩ��%1�2�Kb�Ȩ� C9�:C�g���j$C&�I��i1�/e1���lz�Kf��1��<)��8�h1Ee��,(J����)Qt��yZ�1�Ka�j�_��ط�Q.����ai鬪��)2��Q.h�2��\h���r�1�!�u-� �{[��Be��\��K��<dp�?7ep�.���Ş24i�������`�RMm"��U���>�z26�'JOF %�%�om��iV����4���L����ҏ	"<1D��I!(���^_�9��{TBH�PWyR2s"�����g�Bk�)@F��q�[�LKP��gM��]��s3�9�����>
X0J�pR�IZ�B���T�%V���hn6��=�°�^���b��)�4�uZ���u��҄
'}ͨ�t偨x�#���.wҧ(��)�<�e}�_D���a�Q8�?���/�`F����=�|���!��zbPE=_˅�jS�w���VF�x�*sp<�XǏ��9���#�ʾ��p6b�2�mq���&E�aA/�"	����j�ެ� ��m,,X�>q�<a4LՑ�3*�����4�F#1u�f��V�3|a��\���R�5��)���ֱN�����ꊸ�F��Uq)IO�4Ui�j�_�/��4����Ϟ]D)d��ZFG��N	�5'���'��"�͞��um⟴�J�K΁n%Q�,&V[�g����BR�MԘ�P��9t|�)�z7ͯKDӮTd�� ������BPP��PtZ�L���@�j���S��"`���t�eTF�I�?Q��d=3�~/e$<�x9�K�k�]OU�2��,��h��\a��,���C��A��o�����jks���O��ʧ�eە-hzD���K���P�w��]m
T���Z�kk���g��F��:�u;��>����J{�1�v�EӬ��e-�lق-�n=P�ޑ/�j�I<n�#c�b*��}$'e�mOx��ȖCQ���T�E��6���+�����gR����+N�O��6[3�7_{-�d���ySg:�)!�v�O�p-�-w�M:�)��Ȃ��grJ�J!����ca$l8̆�R�p�沈᱈Co$A��ݳ(�ŭI'9���/'�}AX���\�l\ܺ�i�v�����Hw�R>L5o�2�]�-10�Kd"d&��ǄWg&���Dr�bg��M������PZ^&;{ebo�C�d:.N�[4�/c����U�0<�\��=u7>�NO����h�ف�y�?�1��� ��k�6RJ�I�և3伈ȃ�c$���;�Jl��,P�ØuR����h�=ǎK�2l.�S��S:{� �
  jmD=��l�x�"�Ÿ�tqm���Kim�����J�7���ê�����0_By����h�gXK���1EX�a�i�R�<X�����d���n���dQ{��ɢ{�������9N�Eo�n��)ah���e?����3��2�ૠko�z��Ő^Q�`Ŝ%����Ŏ���d��,	�u�k�/�8
�K��c�@ń:�8��&�m�؊q8&�e�m�m+S��'&�fe!z^��T13��a
��($A�>������S��m�3]o�鱥z᪡	/�"��}��/���3؃��Nx�@aδ��&A	_�x��ix�=)��1W��VΩ�2{�qٛ~w$ߗj�it!���g�9��"q �j�/ۂ�>^it~~�Y�{Xc������ds���qxs>(�y�t~���-MT����O����	�4��Rj�#Rl�,qJ���ԝ��2�7EX���A���	��|�\����P{f��V1���T����{
��x��
 �K~?j�oq���l��T�Ypޏ��X���
�D��=���"��&�1^��>M�$�Ӥ�[��KE����MG���� K�T�z���$��ɷ�4"|!��X����gγy��P��;�P��ïY���!RQIC!	��چ�7	Z�u&���~�`xk���:��u��Ñ��ٻ�;�t�4�$���"gY����)����OL>����7H���JO�����o�o� �$_{�$_M.o@�x�K�Gf����f�If�Ǥ���1y$�u�~��K���@�@�ai�n�?ܣ�E��fr��G���"�d���RN�*E�*a_���r1�֓Q��-�>��_O�1����w�	ʗ\��nsԽdR����|��%�p0���DP�s*p�-�i%��08':��╝���9�P_�
5~����e�Ж�IXR�΁��G4�ҕ%�h�s�A���ihʜ�����&�Ć<��>��Y7W|0�&�����<�i�25H9���.M�'(�j������bY�W� O��L��*�� %��(Q*�j��yc�H0i�n��g���Qv��b]�(A9fYkW�P�p�8��yX<Y�D�;I��T�l��7[2�e'�ނs����.`8o8Tm�,Am��XM�ش0@�Z�3��v�(i����JD����`���glwZ�V�0�7e�Q�����S0Sݨ����W�u�I��b�Z�_�+�[��?Χ�L���%x3#�WTa�����ԃ�Y���M�~^,����Aܺ� T�F�6�`WdC{Fc�cB�0x�"W�BZJ7��x��E�����x��]I4���1Tj`c#�~�0�9b� ��hM���K�ݍ�(�%g�"���!�L{1���0�r�&cZ�H2�P�7C�1�����?s�-�I݌�R]����Y*J|	BF���ZmB?���5w�Qp;#�}��v�4��~w�e�v��l*���@[v�y w�Y	`��gR[Z�W���X@k�x�����8Oҋ���l����"l�]oF�y��-[���Fw�(����"����X��vu{ �X��O��$�n�[m��"�h��-x �X������OxI�0�}�C�i�H���+"iK��˱BFP]t9�����1<2��މQ�J��JW@�Ά��\����j��hld��V��)��`F���`!�"�׋̂������`�Ö92���������A0`��)��}:�:/]{⓯�oTq4)J�En���L�/Y�{��y3aJ����k�=;�>I��҈n{g%�H)�O��oɢ���x r�f��N����&�(쵲1m��e�AG�b."�5�����}~�_)<$=2�gM�bohC?�e;�g�_p��o��߯v7� 
���)�^�3h>t=XQ~�9�lW(YFz�dgS�eЉr#r����BK_�|�ZI��NR��zP���V�o����~�Z��| _����Ǚi6<?�m�Z�젺����^�y�j9���׷� �Q�VQ�0�83N@W��2����%7.��72�;��1w�u�k�o7~��u�s�[0�If%}8����3+k[���l�QGĥ�%j�|*Wɛ�g3W��|�����.�����V�pW�au�[����D�=ʴ3��Wf�eԑI��m�"�[��Nw�X�v7��͵��~��V�]�n-��{{zh�J5Dfx�h�c��юHۧ�=�@�Ke OY�1M��F�Z(F���a\0M��Zi��dY�G;Zߒ,&�yx�����}��v|x{����r|�s?�x�Uէ��W�с/[�Z,Y�V/U���0��j��]:%��.�}z=ە/��C��n��3�d'I�2��L�"�}��J���ˌt�8;й�2��t��G����z�g��}�Y>���4- s�VP�$D��T�]��,\R����i(���c���Kޑ/�&�/�ǠD񡐢��E�D�%���R�Ϋ�����I.����]�nC|��$P!2a!�W'�K�$l�p�krj��%\�x|�ؚ�F�����+��v�'>Yڵ��72�$vP���x����e��l��b9)+"!�G�8t=H��"PlU�5�Rb�R�^Y�R��;�]�y9�FfQ�M�Q���Ge�]�ڲq���{ـK�k���3Y	x8�ef���Ǵ2k{[�*=t��7�����|1���9Nn����5���C:�٭Aȓǻ�Mg܇��S<�١<N��D��e�Y�ZԏR�:+��k������Ct�      6      x������ � �     