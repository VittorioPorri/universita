PGDMP                      |            postgres    16.3    16.3 I    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     t   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_GB.UTF-8';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3530                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16932    bunker    TABLE     f   CREATE TABLE public.bunker (
    id_bunker integer NOT NULL,
    ubicazione character varying(255)
);
    DROP TABLE public.bunker;
       public         heap    postgres    false    4            �            1259    24580    cura    TABLE     �   CREATE TABLE public.cura (
    id_ospedale integer,
    cf character varying(16) NOT NULL,
    "gravità" character varying(255),
    tipo_di_ferite character varying(255)
);
    DROP TABLE public.cura;
       public         heap    postgres    false    4            �            1259    16438    infrastruttre    TABLE     �   CREATE TABLE public.infrastruttre (
    id_infrastruttra integer NOT NULL,
    nome character varying(255),
    produzione integer,
    id_bunker integer,
    tipologia character varying(255),
    tipo_di_infrastruttra character varying(255)
);
 !   DROP TABLE public.infrastruttre;
       public         heap    postgres    false    4            �            1259    24882    lavorano    TABLE     �   CREATE TABLE public.lavorano (
    cf character varying(16) NOT NULL,
    id_scuola integer,
    id_mensa integer,
    id_ospedale integer,
    id_magazzino integer,
    id_infrastruttura integer,
    ruolo character varying(255)
);
    DROP TABLE public.lavorano;
       public         heap    postgres    false    4            �            1259    16421 	   magazzino    TABLE     u   CREATE TABLE public.magazzino (
    id_magazzino integer NOT NULL,
    "capacità" integer,
    id_bunker integer
);
    DROP TABLE public.magazzino;
       public         heap    postgres    false    4            �            1259    16472    mensa    TABLE     �   CREATE TABLE public.mensa (
    id_mensa integer NOT NULL,
    nome character varying(255),
    "capacità" integer,
    id_bunker integer
);
    DROP TABLE public.mensa;
       public         heap    postgres    false    4            �            1259    16801    ospedale    TABLE     �   CREATE TABLE public.ospedale (
    id_ospedale integer NOT NULL,
    nome character varying(255),
    "capacità" integer,
    id_bunker integer
);
    DROP TABLE public.ospedale;
       public         heap    postgres    false    4            �            1259    16902 	   partecipa    TABLE     m   CREATE TABLE public.partecipa (
    cf character varying(16) NOT NULL,
    id_spedizione integer NOT NULL
);
    DROP TABLE public.partecipa;
       public         heap    postgres    false    4            �            1259    16865    persone    TABLE     �   CREATE TABLE public.persone (
    cf character varying(16) NOT NULL,
    nome character varying(255),
    cognome character varying(255),
    data_di_nascita date,
    genere character varying(255),
    id_bunker integer
);
    DROP TABLE public.persone;
       public         heap    postgres    false    4            �            1259    16811    produce    TABLE     h   CREATE TABLE public.produce (
    id_risorse integer NOT NULL,
    id_infrastruttra integer NOT NULL
);
    DROP TABLE public.produce;
       public         heap    postgres    false    4            �            1259    16431    risorse    TABLE     �   CREATE TABLE public.risorse (
    id_risorse integer NOT NULL,
    nome character varying(255),
    condizioni_di_conservazione character varying(255),
    data_di_scadenza date
);
    DROP TABLE public.risorse;
       public         heap    postgres    false    4            �            1259    16826    scambia    TABLE     �   CREATE TABLE public.scambia (
    id_bunker_mittente integer NOT NULL,
    id_bunker_ricevente integer NOT NULL,
    data date NOT NULL,
    ora time without time zone NOT NULL,
    testomessaggio text
);
    DROP TABLE public.scambia;
       public         heap    postgres    false    4            �            1259    16509    scuole    TABLE     �   CREATE TABLE public.scuole (
    id_scuola integer NOT NULL,
    nome character varying(255),
    "capacità" integer,
    id_bunker integer
);
    DROP TABLE public.scuole;
       public         heap    postgres    false    4            �            1259    16519 
   spedizione    TABLE     �   CREATE TABLE public.spedizione (
    id_spedizione integer NOT NULL,
    tipo character varying(255),
    data date,
    esito character varying(255),
    id_bunker integer
);
    DROP TABLE public.spedizione;
       public         heap    postgres    false    4            �            1259    16937 
   stoccaggio    TABLE     �   CREATE TABLE public.stoccaggio (
    id_magazzino integer NOT NULL,
    id_risorse integer NOT NULL,
    ora time without time zone NOT NULL,
    data date NOT NULL,
    "quantità" integer
);
    DROP TABLE public.stoccaggio;
       public         heap    postgres    false    4            �            1259    16917    utilizza    TABLE     l   CREATE TABLE public.utilizza (
    id_spedizione integer NOT NULL,
    numero_di_telaio integer NOT NULL
);
    DROP TABLE public.utilizza;
       public         heap    postgres    false    4            �            1259    16858    veicolo    TABLE     �   CREATE TABLE public.veicolo (
    numero_di_telaio integer NOT NULL,
    modello character varying(255),
    targa character varying(255),
    ultima_manutenzione date,
    tipo character varying(255)
);
    DROP TABLE public.veicolo;
       public         heap    postgres    false    4            �          0    16932    bunker 
   TABLE DATA                 public          postgres    false    228   R       �          0    24580    cura 
   TABLE DATA                 public          postgres    false    230   S       �          0    16438    infrastruttre 
   TABLE DATA                 public          postgres    false    217   �T       �          0    24882    lavorano 
   TABLE DATA                 public          postgres    false    231   �X       �          0    16421 	   magazzino 
   TABLE DATA                 public          postgres    false    215   �Z       �          0    16472    mensa 
   TABLE DATA                 public          postgres    false    218   �\       �          0    16801    ospedale 
   TABLE DATA                 public          postgres    false    221   �]       �          0    16902 	   partecipa 
   TABLE DATA                 public          postgres    false    226   �`       �          0    16865    persone 
   TABLE DATA                 public          postgres    false    225   �a       �          0    16811    produce 
   TABLE DATA                 public          postgres    false    222   �h       �          0    16431    risorse 
   TABLE DATA                 public          postgres    false    216   �i       �          0    16826    scambia 
   TABLE DATA                 public          postgres    false    223   �m       �          0    16509    scuole 
   TABLE DATA                 public          postgres    false    219   �q       �          0    16519 
   spedizione 
   TABLE DATA                 public          postgres    false    220   �r       �          0    16937 
   stoccaggio 
   TABLE DATA                 public          postgres    false    229   �t       �          0    16917    utilizza 
   TABLE DATA                 public          postgres    false    227   w       �          0    16858    veicolo 
   TABLE DATA                 public          postgres    false    224   �w                  2606    16936    bunker bunker_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.bunker
    ADD CONSTRAINT bunker_pkey PRIMARY KEY (id_bunker);
 <   ALTER TABLE ONLY public.bunker DROP CONSTRAINT bunker_pkey;
       public            postgres    false    228                       2606    24584    cura cura_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cura
    ADD CONSTRAINT cura_pkey PRIMARY KEY (cf);
 8   ALTER TABLE ONLY public.cura DROP CONSTRAINT cura_pkey;
       public            postgres    false    230            �           2606    16444     infrastruttre infrastruttre_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.infrastruttre
    ADD CONSTRAINT infrastruttre_pkey PRIMARY KEY (id_infrastruttra);
 J   ALTER TABLE ONLY public.infrastruttre DROP CONSTRAINT infrastruttre_pkey;
       public            postgres    false    217                       2606    24886    lavorano lavorano_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.lavorano
    ADD CONSTRAINT lavorano_pkey PRIMARY KEY (cf);
 @   ALTER TABLE ONLY public.lavorano DROP CONSTRAINT lavorano_pkey;
       public            postgres    false    231            �           2606    16425    magazzino magazzino_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.magazzino
    ADD CONSTRAINT magazzino_pkey PRIMARY KEY (id_magazzino);
 B   ALTER TABLE ONLY public.magazzino DROP CONSTRAINT magazzino_pkey;
       public            postgres    false    215            �           2606    16476    mensa mensa_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.mensa
    ADD CONSTRAINT mensa_pkey PRIMARY KEY (id_mensa);
 :   ALTER TABLE ONLY public.mensa DROP CONSTRAINT mensa_pkey;
       public            postgres    false    218                       2606    16805    ospedale ospedale_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ospedale
    ADD CONSTRAINT ospedale_pkey PRIMARY KEY (id_ospedale);
 @   ALTER TABLE ONLY public.ospedale DROP CONSTRAINT ospedale_pkey;
       public            postgres    false    221                       2606    16906    partecipa partecipa_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT partecipa_pkey PRIMARY KEY (cf, id_spedizione);
 B   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT partecipa_pkey;
       public            postgres    false    226    226            	           2606    16871    persone persone_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persone
    ADD CONSTRAINT persone_pkey PRIMARY KEY (cf);
 >   ALTER TABLE ONLY public.persone DROP CONSTRAINT persone_pkey;
       public            postgres    false    225                       2606    16815    produce produce_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.produce
    ADD CONSTRAINT produce_pkey PRIMARY KEY (id_risorse, id_infrastruttra);
 >   ALTER TABLE ONLY public.produce DROP CONSTRAINT produce_pkey;
       public            postgres    false    222    222            �           2606    16437    risorse risorse_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.risorse
    ADD CONSTRAINT risorse_pkey PRIMARY KEY (id_risorse);
 >   ALTER TABLE ONLY public.risorse DROP CONSTRAINT risorse_pkey;
       public            postgres    false    216                       2606    16832    scambia scambia_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.scambia
    ADD CONSTRAINT scambia_pkey PRIMARY KEY (id_bunker_mittente, id_bunker_ricevente, data, ora);
 >   ALTER TABLE ONLY public.scambia DROP CONSTRAINT scambia_pkey;
       public            postgres    false    223    223    223    223            �           2606    16513    scuole scuole_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.scuole
    ADD CONSTRAINT scuole_pkey PRIMARY KEY (id_scuola);
 <   ALTER TABLE ONLY public.scuole DROP CONSTRAINT scuole_pkey;
       public            postgres    false    219            �           2606    16525    spedizione spedizione_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.spedizione
    ADD CONSTRAINT spedizione_pkey PRIMARY KEY (id_spedizione);
 D   ALTER TABLE ONLY public.spedizione DROP CONSTRAINT spedizione_pkey;
       public            postgres    false    220                       2606    16941    stoccaggio stoccaggio_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_pkey PRIMARY KEY (id_magazzino, id_risorse, ora, data);
 D   ALTER TABLE ONLY public.stoccaggio DROP CONSTRAINT stoccaggio_pkey;
       public            postgres    false    229    229    229    229                       2606    16921    utilizza utilizza_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.utilizza
    ADD CONSTRAINT utilizza_pkey PRIMARY KEY (id_spedizione, numero_di_telaio);
 @   ALTER TABLE ONLY public.utilizza DROP CONSTRAINT utilizza_pkey;
       public            postgres    false    227    227                       2606    16864    veicolo veicolo_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.veicolo
    ADD CONSTRAINT veicolo_pkey PRIMARY KEY (numero_di_telaio);
 >   ALTER TABLE ONLY public.veicolo DROP CONSTRAINT veicolo_pkey;
       public            postgres    false    224                       2606    24590    cura cura_cf_fkey    FK CONSTRAINT     m   ALTER TABLE ONLY public.cura
    ADD CONSTRAINT cura_cf_fkey FOREIGN KEY (cf) REFERENCES public.persone(cf);
 ;   ALTER TABLE ONLY public.cura DROP CONSTRAINT cura_cf_fkey;
       public          postgres    false    225    3337    230                       2606    24585    cura cura_id_ospedale_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cura
    ADD CONSTRAINT cura_id_ospedale_fkey FOREIGN KEY (id_ospedale) REFERENCES public.ospedale(id_ospedale);
 D   ALTER TABLE ONLY public.cura DROP CONSTRAINT cura_id_ospedale_fkey;
       public          postgres    false    230    221    3329                        2606    24907 (   lavorano lavorano_id_infrastruttura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lavorano
    ADD CONSTRAINT lavorano_id_infrastruttura_fkey FOREIGN KEY (id_infrastruttura) REFERENCES public.infrastruttre(id_infrastruttra);
 R   ALTER TABLE ONLY public.lavorano DROP CONSTRAINT lavorano_id_infrastruttura_fkey;
       public          postgres    false    3321    231    217            !           2606    24902 #   lavorano lavorano_id_magazzino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lavorano
    ADD CONSTRAINT lavorano_id_magazzino_fkey FOREIGN KEY (id_magazzino) REFERENCES public.magazzino(id_magazzino);
 M   ALTER TABLE ONLY public.lavorano DROP CONSTRAINT lavorano_id_magazzino_fkey;
       public          postgres    false    215    231    3317            "           2606    24892    lavorano lavorano_id_mensa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lavorano
    ADD CONSTRAINT lavorano_id_mensa_fkey FOREIGN KEY (id_mensa) REFERENCES public.mensa(id_mensa);
 I   ALTER TABLE ONLY public.lavorano DROP CONSTRAINT lavorano_id_mensa_fkey;
       public          postgres    false    231    3323    218            #           2606    24897 "   lavorano lavorano_id_ospedale_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lavorano
    ADD CONSTRAINT lavorano_id_ospedale_fkey FOREIGN KEY (id_ospedale) REFERENCES public.ospedale(id_ospedale);
 L   ALTER TABLE ONLY public.lavorano DROP CONSTRAINT lavorano_id_ospedale_fkey;
       public          postgres    false    3329    221    231            $           2606    24887     lavorano lavorano_id_scuola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lavorano
    ADD CONSTRAINT lavorano_id_scuola_fkey FOREIGN KEY (id_scuola) REFERENCES public.scuole(id_scuola);
 J   ALTER TABLE ONLY public.lavorano DROP CONSTRAINT lavorano_id_scuola_fkey;
       public          postgres    false    231    219    3325                       2606    16907    partecipa partecipa_cf_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT partecipa_cf_fkey FOREIGN KEY (cf) REFERENCES public.persone(cf);
 E   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT partecipa_cf_fkey;
       public          postgres    false    226    3337    225                       2606    16912 &   partecipa partecipa_id_spedizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT partecipa_id_spedizione_fkey FOREIGN KEY (id_spedizione) REFERENCES public.spedizione(id_spedizione);
 P   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT partecipa_id_spedizione_fkey;
       public          postgres    false    3327    226    220                       2606    16821 %   produce produce_id_infrastruttra_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produce
    ADD CONSTRAINT produce_id_infrastruttra_fkey FOREIGN KEY (id_infrastruttra) REFERENCES public.infrastruttre(id_infrastruttra);
 O   ALTER TABLE ONLY public.produce DROP CONSTRAINT produce_id_infrastruttra_fkey;
       public          postgres    false    217    222    3321                       2606    16816    produce produce_id_risorse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produce
    ADD CONSTRAINT produce_id_risorse_fkey FOREIGN KEY (id_risorse) REFERENCES public.risorse(id_risorse);
 I   ALTER TABLE ONLY public.produce DROP CONSTRAINT produce_id_risorse_fkey;
       public          postgres    false    216    222    3319                       2606    16942 '   stoccaggio stoccaggio_id_magazzino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_id_magazzino_fkey FOREIGN KEY (id_magazzino) REFERENCES public.magazzino(id_magazzino);
 Q   ALTER TABLE ONLY public.stoccaggio DROP CONSTRAINT stoccaggio_id_magazzino_fkey;
       public          postgres    false    3317    215    229                       2606    16947 %   stoccaggio stoccaggio_id_risorse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_id_risorse_fkey FOREIGN KEY (id_risorse) REFERENCES public.risorse(id_risorse);
 O   ALTER TABLE ONLY public.stoccaggio DROP CONSTRAINT stoccaggio_id_risorse_fkey;
       public          postgres    false    229    3319    216                       2606    16922 $   utilizza utilizza_id_spedizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizza
    ADD CONSTRAINT utilizza_id_spedizione_fkey FOREIGN KEY (id_spedizione) REFERENCES public.spedizione(id_spedizione);
 N   ALTER TABLE ONLY public.utilizza DROP CONSTRAINT utilizza_id_spedizione_fkey;
       public          postgres    false    227    220    3327                       2606    16927 '   utilizza utilizza_numero_di_telaio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizza
    ADD CONSTRAINT utilizza_numero_di_telaio_fkey FOREIGN KEY (numero_di_telaio) REFERENCES public.veicolo(numero_di_telaio);
 Q   ALTER TABLE ONLY public.utilizza DROP CONSTRAINT utilizza_numero_di_telaio_fkey;
       public          postgres    false    227    224    3335            �   �   x���AK1�����ڂ�im��T�궸�oi6����I��w2=:�|<��]߼U���;�=��s_��i�{oz5�7j���i��6U�/���$�"�,̸/b��)���.$B��Uɨ�{���=�jhd2�f�!e�B�X��X�P�]t���hC�K�x;s�!�E��L�,�E)�Aܾ^��c"0^xm�39 �,w<������.8q5��'�Vx�9�䔽5�_ZU��7G      �   �  x���MK�@����UAd�#_x��J�V���X�J#�������4���ag�g���r5}]G���%�:�����t(����f��n�.Of!��|XT�O���箪Ƿ��?��znʞ��P��<;��}��HS�t(.�����黪�e�����k���H�"i���OQ��!2tȮ!�M3G��2�!.-(�"�I�C!(Jlg��$V�I�Y��;���(%VHJ���R�a�������)��3Le2�=CQ�ǰa0$e���TV+$���'P���3L�Լ�M9��#���"�T��E��X�^������'���=���#��J�a���Z��J'���J�`Qh���/
M����'�0U��QU�,�T;�?���'��jbg�����,0U=��U��C�����~�o��      �     x��X�n�8��)x�.,�_���𺅁�Xi��x�I��r���]��v���E4A+�)�3����m��l���v����@�j^]�{Y=~�d����Rhn>ޔ_C��X8�=0z���G����3T�������W����R�%�L�\.$S��W���4���-*^��˅_@IA����U�Y&Ư2�5gۃVg%���¤]z��rB_)-yA{]�zt����N0bٔ��y����� {�
%���n���6z�s�iZMe�Go��j).Nm[s���cO�S9��j,�G�+�OPl':�B�%��~�;���
(J��Ƴ�W��[?�ѩ��_. m��	�.� �����iP5�
i-�Ѷ��p�?��O�(t��ډ{�*X��5�֢Ӌt
�.��j�c(��&���Xă����u���+i�󤩳�686�3%�l�	#�V%�h����h+�����, �=ʲ-�E�`>�ZQ�c	-���.'����J.ҟ�V\�)�AQ[ �,�������fY�z�7�9вCe�#9kI��]��Rh��WZGeD��@O��.�_Pd �ܪeйl��מ1���Oug�$y?��3IO���yAS��*��b_�><<k~ {D>�r�xp�:���4�g$��cQ+�Zi�V�Z���Uc���J�H� � ґ&/��������v/m5�K6iCC���`�}�U��V�qpM��,4�! �}���[ޢ���\wv���@� y=��ꍣ�~e=5!��	�����(q�-��J���J|#A�*DfTQX#e����C ��@\�&a�UTU/{I��i4Z�5a}�ҕ谾� ����H�x�<���ݼ�V��i���T��sa��T�n9^�h*�[�h90���M�f��pjr��'~��xz/��kY�O�q���^Q�N��kvx��\�
�G�����>5��;������}e���em:hϽ+�������u;|��w�x��)X��6���B�|#2E�֧��Gq��� �N�      �   �  x����J�@��}�"�Q��$Mp%�B�?`��1K &%I]��e���D�_6��o�yx��f�����v��/y������tQz�����ƻb�����[=-?���[L���2�R���%���$��b�������2c�MQ�Aےu�����6�B��6�̇�+�q����체�����tnm�տ�a[�v<)^+]7ձi�հ��O�]l�`#ֱ
��Y�M���X��t���b%��b�U,w��@ؾb%�.V�`�b�K�B`�bV�� ��.6@���� +l��*V��@ؾb,]l�m�ᰶXr��`e_�!V��/Ř��r�û��px:�)�(�;���Z�Ul�:n�uku��*:���b#4��Œ�X��`U_��.6�����pX[,�
�u����}��؀.����N&��^�      �   �  x���;O1�>��%H'tk{�E�H(H$�
�WC�_�⥝�>����g+�lw�ǽ�l�������z�qx;�N��/�|w��޹+�������v�A|���'<:&��t �G����N��RPt M�P���*���/���]�{�RK����V&��«2�%���s�J�o�K���ֹ�ȥ��.}�Q��~f7��	�0��<a�+<2����w����ޛy���C���c/p������_����x��x����
�����o���q�D��a �������v ��� 0�h' �� �?�� �D;�P;��W��W��W��W��W��W����ǯ<���O<�� ����?���?-��x�y�L��4����<����4����<���/<���/�Y������������_�m���A2���o���^���(�f�Wo-�����?/��^�j�l��      �   4  x����j1����ق'��JOV� �W��k���D���}��K_�ɖ
�5������ȷ;���>��z��|��nP�}^�'�Ѻ?Y(�Z��h,��d,��-Z>��ߪ3���>/9�8�O$�Zٳ�:�sI@�͑���ߟp�i_�s�jr���@6 �c}� ���5��n�6Ԣ%�@�\���(JSa�R�K�r%�cLe��c̸*ar��-�[��s��;ɸF�9�ց��
r0�
o�bk�� �j�A=��jj��<#暅d����Q�,���2����#
Wۿ������D,�      �   �  x��WKo�@��W��V���	���@���C��!#�]km���﬍�Zi�A}��^�Y�e���[�mS�l>
�骔{QH����n�y?��>�9��6���������w+�`��ЪC�2@B�� ���Q��T'�0	��0�xę�c�#F��#c��h��S$�e�e-(a��"J�2!�l@�,P�2lG� X�6���Dm ���%qD��ŬM�������֩3���nY)s�N�v�]���>��#Ngw���~@�v�'��|�����E�}�o�M��t���_p�A������S�w��sP��N.��k�1�4S?)Yղjs1r�O	Ы(D]��V�S�oy��3��6ZBc,�v8����m���RU�ݷ�+�������R���k�U��z}��1�v�6��*!AzqP���M]�h����{��sm�!���7'�졵�`Z?Hԛl̀4ax?���F��J`��<��}�������0^��`F�T9��	i ��܎���u�a�\0�|H��b��Z\�J}H��J^V��z?5�.���NM�V����Y���],�"�Z~t��!u{�7Tug�)�q��toۦ���z��G���
�����ϙ�@�.�
�G��xo]��4����㇃��U	U5�?	]�����Ci�o�ւ`(جԦ���M�7�k�VM8z� lu�^��Y	�Lc���e� �)|
��oqW�c���9O���������k�t�      �   �   x���=
1E�~V�N���M�X��0 #�׫X������,���v�ftmwܹ�s}>n���z�o���Ϋ��9��h��>��.L�U��,� 	ŢDD"a1�"��X�&"x,�yBB���s$k��HXX�k<!�9)KG��ĺ4]QN�|@�ĉ�h��9)�р���G��I��F��R�8&NJ}4�9�������/h�*���GCV����&N���!k��GC���T�9�З      �   �  x��Z�n�F��+���DN�,	,��*���R2.)�\�Y���Xf�g�y0��<I�������}}��<>��><��{�����ꇮ�vϟ��}���vu}����շˑ˯��0��Vi����{>�M%�g�����/�g���\�V����aFAʟn��n���p|,?|Ww�m���?�� ��8t��	�'�{�C�U�O.�0	�ԍ<!���;�o��E�ӀEN�)��������u�8;X�NA4����o����L�y�N�H1�^J5`E�v��[�� P-�UV�SSoO=��Z�}Q��_�p1��� E��zʐ�D̍��/�����r�Gp�	Ʋ���»�/R��>u�(KE���e@�[~�!����QW~!�9���,Ad�#$�;o.�NM,��H�5�E��گ[u~�K�an�Sp�>sQ7�^T�[�hA+�N���x}!��+�����[��jO����-X�p�}��p�'J)A�'A�K]��?u����Y�s�V��?��^�3�ї�T��S~ʑ"�8b�o/�Q熁�d�ً�q��V=�^��$=%HO�1� o�|��]��?��y���(�X��ܾVץz��I�����صA���o���M�7��~9a�|�v�Z��J�����e��ޠ��7�l�Lb@o_�����?yH�q����T����ԟ�M?^��S��V��뫦14[H?ߘ9=�r'���~��v�Z@�����mr���C[+D�<��s�@ ���O=`���,h�o�S��}�f�OՇ.��2���Q��L�Շ�.���;�� ��y��Ǯ7
�)�^G�����a��=r�{��b�����  �(y]3�](�I��K�CY�����7p�X$EȓPʉ�﹐P�����H�8�Q�E���͏��WqC�s�!��$��؋�Z��I�](�Զ@w?�q4J��D��?�];�J)@��H�67i�cΎ9H���l�O�}�z>�c���2�&���^�{�ã0U��(����0�� A@8e�̇�;�c��j��l�K��h�)�w0�J	���4Q=rڊ�.�a<J!6��:����lJ�қ,۴�Hs�_�����	�§��q{��p�� qG}�tZ.P� n�ԭ��UY�wW�G���//\��'R�ق� �"��N�s���v^sEc�/R�Bo'��Amh5�6XRآM�*Kmc���g�n2���~q�����T��H
D��^�`\��i;\�o[(��L#�ݾr0o[��y8�P�?����<�9sZ��gJ��J�J�<e�2�.n����R�	WX~�͡6�!�^bI������oj�+Ӝ���n%�s���TNw�o)�����Jx��;
���'������î�M�MGE�ꏹ�`��:��2@N��0_�`���9_N.ȊM���;���0� <^�	�P|�ۚ�]�r�'\��;�����g��Ba-��ި���>j���K��f����z�g?���|u��~Wz6�&K�K7r�a-�q�6	Ȗl.�+ט���3�ҵ�ƻ/<�y�RXKxc���Ζ~[&��;-Tǫ{
���ky6�x��*��U}s�e��|o�������C`�:Oc��Xr<����7xŲ��:�,1-�R��g%�|�+H�?|���]�      �     x���;
B1����bJ� f��+���k>
AP���*3쎛�Ɇ�io�����M>���w{�e�=o�6���x�H:���`Y�,�fX.���z,�L�ɖX�)�3QX)(�4����PQ��Aaԥ(,~�<����:�c+tVaa���8L�,l���њ�ղv�0[����㴛l�ݴ�B���ݴ�B���ݴ�B���ݴ�B����\*�[�
��6Ta�f�!��DOYX�͵�
�5��6Ta�fi7m��n�}t�?��t�      �   �  x��XMo�6��W�-P��zJ�Mԛ�޽�$��"U������������vv�$2��������{ouw���e-��ןE�
��,:c�߮�_?�ć�WqyU���%���K�h�+��\����M�t%i�%���~qw;�E�X�Z��Qo����F�4��@�}���A!C�e�H�� J��5J��=z%I�L�sZ��[���F;i��J~���(n�������(��d�M%�����9^�s��YO¡���Ot���@p}���E���~��Z��d� �̹'��5Ϣ$?�-Zʍ�����"���].�В�0n���
`� ?+4ī�h��w�ĺY�t��'*��z�{��31�9��(o[ PA?)���mV��J�YE]x$��>�I���P4k#�)K��wzo��.�4�ƖR����H�O'��S�³<W@U�TcP�5�M5�O��e .��Vj�� �		�ݲ,��k��VY��i�Z�5u-�pK�Ҝ5Z�L���} ��RT;�ގA������/$y���,��Ax���t�7�y��s<�$�����ƫ	D2�g�.[�ҩ���Ь0��V�N;��aԵ��y�n��1I����8�������5�AQ �Q%��H(�[R���J(7ci�A�r��Yr��	�$8 &;
��7��>��&�P7@��͕g���>4���O�����Х�`e�!��F����i��Z?�Xl���(`������� �lz��s�5��a��<p,�k*�=
RM��mԴԥ9��H��|�C�F��l�H�Cz��f�է���� c�リci]�,�[p�Lz �'���kx��C�q�9���2i����"z���Uu!w��Y�+�guȠF����/�t� �ܚ>[Y����+E�GTRw�����o�Oa~H1�vT����t�xY��d����w���9_7��`]!��)�=��=����GN�b      �   �  x��XKO�0��+|cW;I)��jšҊ��ݻ��bm�t�����q'��-v���V��3�c������3Y?<�"�&�dzS�<O$'���}�D��+®�%Xt�]�>�`�?�~��dA6���_É �L��˯�.�N�C\=n��Uh�?��U���-B]�����M)H.6�pE�CP�D��4��P�تh+�(/��P5/�J�Q��ܭhܣ<����+-�j��̹~�w��_�4��HŽj�I��^�\E�me�_ve��TE�e�<�h�;G8�}8�f��@��ȸ@��-@<6
��$a�ο>F�����g-ߖ2-2g��CŽ�BmS^&M�U�\~���U��)�@^e��@`�(�ޫ�(SAD&�g>꾝N�t7���)�u�(�a�e���� $X��q��r�����YI�=��)B��QS��s^A�K����M��K���1Z��28�pp��.�wYx!aJu�J�C#��su`.Q��؞�w|�&;Q�E�n"�b�Y�2z�j��'^o��c�Τ�1(g}�C�}/�-���.�ܥ��a��bI����0�i�q솓��\m�����q�z8�1��O%�J�3c\�}��V��=�TB�lN�j���e�O���L���o4���G&�w��lV:x}�}$ 3ҧ�AiH�n>z��@��0�6�s��V>�oY�t�6 f :mcs�7�(&]>oQ�źaF���qǕ������v���Oxzg����-�-���U�$N]���a�����9+:J׶:5�����.�p�<�ۥ�S�xIn�����zG��Q�Ǘ��n�`_Q��qf�>ƫ�R~�Kl�}҅;F�/_��~&a��Y�쐦�^^O�͎���{.c��#�N>��q�2��������߂tq��}�&      �   >  x����J�@��}��U�H7���H�@[�����T�ݲ�\r�5|=��M����s]�}�����o�d��	.�[E�V��^7��m7b�{������I�������,���=�$}Z�>���ΛZ2��"���E�<!���x��uMF˪���8��<x�@I�h�Y��������L��J�����L��n{K)[�j��4�^r���L;���l�&�٦��QJ�x&	��kﻬٖ��J	���{��X��
1!�z萰u��ze<�H
� 5bK�G~1�u���SD�_�n�~�
�wO�(B���vVg�o94�      �   �  x���KK1��������&��D+D�׾�Uu����_�hMN��]N�\��Η������s6�~Ȗ����.�����vm3�^��^FOى:ˆ��]5�s�l�a�L9��\��|�t�~.��d��:��Y��{u�5�m'���7��su��[oVn��'��Ӹɮ��:��&�Ah�`�<k?睗�I�N�C;���k؃Kč�т>T�[7�?1?�F�������!8�����Wa���A�?*G��ѩ�s�w�O�|r
K�CmK����}ێ���Ӳ�RA�t�	G��}/��{gB��)6�x��H�<��7��y&��1E�3><~+�ge�<a��<�������yVfE̳>���a�
<��+<x	;6���g��yE�o:b^��K��W���k��y�6��!x	G�+}x	���U���`�*��W�ͫdצ��WI�ͫe���Ղ��`�j��b�y�^ļZ��r�7�B�v��`��      �     x����J1�}�bvU���d~�+]���R*���=��rs`��̹��nؾ�����}�}~]N�?�����|�\��������w�^k7=8��Z_���qi㼮�s����RK`%�]	g��w�����",oXQWE��Ġz]��[5�
5�
e���a��Wk��֤��������Eyk�-���˱��ϩ�ԏ=e��ז���a%�5��O�Ub_[�}⬒��B���ɗ���@�6���C�=�(�����D�$��K\�DL���G��>GiU�xr���:_r�#��J_r�k��Dn�a�j_O��f_Z�/9�D-k5���0kU������X���,�B���#���+����|�!�Y����%`f���9�l`�L`f��3�,��k�r�lXl�����m`f�Kdc+��Wl>���]E���y2���&\��2�y��e�?�H�%0���������h�?��;�e̬`#�٬��mb�B3 �%2h�z�'@�|�#�Z���      �   �   x��ձ�0Fᝧ訉1�)qr` 1���	��,<��op��i�ͥ�0v����ts���̟����y�^�y�>������������L+H+~�L#���5�Қ_��g=��� mx��_+�X�6���@�����l���^fi0x������A%t�B�(�MX3����hf�܄U3��&�o�
�f����@��o��,��}3Kg�}3��F����2k}�����k      �   �  x���MO�@���
��Ju���zZ @
Hn-����*�����w�T�7���ggv/���j�-�����ˏ���翏ۇ��.�	g��u��>e��߻���f��j���#�y��TΆ����_��/ʯ?�쎻���kMF�6���{�%�����v���K��������h�s1�o�����A_���7~9��/�L����T�_�h5��+~�ֈ_[��ߌ���76~���E���[-s�ǧ"�?���?��߷� �H��(" Jx;����ҁ��D_I A,vw���B`oP	g=���.����Ω�ʎ��"�z������@��̌q΍B!\Rm�	�mP������2*���	VL�)�)W"s��f��m'~2Bذ ��N�8��5+ ��0a-r!����Y5a1r5B�� TI'xǁk@���&@h"��~�zM��	��[@h-���B�鍂�1�a�\���(��{IJ��p �Dᄃ��xb8����0�^��s�,J"���A�-�#�/Ji9��a�e��r�p5�1��Qj;~_���a!Gi�~0��
�Qڄ���N�<�������d9�7�{�
}T�d��1,���j���1\(R1nD�e�F å� լ6�b�
�W
��*���a�pH�-��P�a��Hm,�	[S!�a��Hm-�	��"�u	�,��C�{{� �7q�     