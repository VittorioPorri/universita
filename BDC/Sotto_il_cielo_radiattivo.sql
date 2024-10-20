PGDMP  ;    5                |           postgres    16.3    16.3 F    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     t   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_GB.UTF-8';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3523                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16932    bunker    TABLE     f   CREATE TABLE public.bunker (
    id_bunker integer NOT NULL,
    ubicazione character varying(255)
);
    DROP TABLE public.bunker;
       public         heap    postgres    false    4            �            1259    16843 
   curaferite    TABLE     �   CREATE TABLE public.curaferite (
    id_ospedale integer NOT NULL,
    id_spedizione integer NOT NULL,
    "gravità" character varying(255)
);
    DROP TABLE public.curaferite;
       public         heap    postgres    false    4            �            1259    16438    infrastruttre    TABLE     �   CREATE TABLE public.infrastruttre (
    id_infrastruttra integer NOT NULL,
    nome character varying(255),
    produzione integer,
    id_bunker integer,
    tipologia character varying(255),
    tipo_di_infrastruttra character varying(255)
);
 !   DROP TABLE public.infrastruttre;
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
       public         heap    postgres    false    4            �            1259    16865    persone    TABLE     �  CREATE TABLE public.persone (
    cf character varying(16) NOT NULL,
    nome character varying(255),
    cognome character varying(255),
    data_di_nascita date,
    genere character varying(255),
    ruolo character varying(255),
    id_bunker integer,
    id_magazzino integer,
    id_infrastruttra integer,
    id_mensa integer,
    id_scuola integer,
    id_ospedale integer
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
   TABLE DATA           7   COPY public.bunker (id_bunker, ubicazione) FROM stdin;
    public          postgres    false    229   ?U       �          0    16843 
   curaferite 
   TABLE DATA           L   COPY public.curaferite (id_ospedale, id_spedizione, "gravità") FROM stdin;
    public          postgres    false    224   V       �          0    16438    infrastruttre 
   TABLE DATA           x   COPY public.infrastruttre (id_infrastruttra, nome, produzione, id_bunker, tipologia, tipo_di_infrastruttra) FROM stdin;
    public          postgres    false    217   �V       �          0    16421 	   magazzino 
   TABLE DATA           I   COPY public.magazzino (id_magazzino, "capacità", id_bunker) FROM stdin;
    public          postgres    false    215   ~Z       �          0    16472    mensa 
   TABLE DATA           G   COPY public.mensa (id_mensa, nome, "capacità", id_bunker) FROM stdin;
    public          postgres    false    218   �[       �          0    16801    ospedale 
   TABLE DATA           M   COPY public.ospedale (id_ospedale, nome, "capacità", id_bunker) FROM stdin;
    public          postgres    false    221   �\       �          0    16902 	   partecipa 
   TABLE DATA           6   COPY public.partecipa (cf, id_spedizione) FROM stdin;
    public          postgres    false    227   �_       �          0    16865    persone 
   TABLE DATA           �   COPY public.persone (cf, nome, cognome, data_di_nascita, genere, ruolo, id_bunker, id_magazzino, id_infrastruttra, id_mensa, id_scuola, id_ospedale) FROM stdin;
    public          postgres    false    226   0`       �          0    16811    produce 
   TABLE DATA           ?   COPY public.produce (id_risorse, id_infrastruttra) FROM stdin;
    public          postgres    false    222   �g       �          0    16431    risorse 
   TABLE DATA           b   COPY public.risorse (id_risorse, nome, condizioni_di_conservazione, data_di_scadenza) FROM stdin;
    public          postgres    false    216   �h       �          0    16826    scambia 
   TABLE DATA           e   COPY public.scambia (id_bunker_mittente, id_bunker_ricevente, data, ora, testomessaggio) FROM stdin;
    public          postgres    false    223   	l       �          0    16509    scuole 
   TABLE DATA           I   COPY public.scuole (id_scuola, nome, "capacità", id_bunker) FROM stdin;
    public          postgres    false    219   Jo       �          0    16519 
   spedizione 
   TABLE DATA           Q   COPY public.spedizione (id_spedizione, tipo, data, esito, id_bunker) FROM stdin;
    public          postgres    false    220   \p       �          0    16937 
   stoccaggio 
   TABLE DATA           V   COPY public.stoccaggio (id_magazzino, id_risorse, ora, data, "quantità") FROM stdin;
    public          postgres    false    230   �q       �          0    16917    utilizza 
   TABLE DATA           C   COPY public.utilizza (id_spedizione, numero_di_telaio) FROM stdin;
    public          postgres    false    228   ~s       �          0    16858    veicolo 
   TABLE DATA           ^   COPY public.veicolo (numero_di_telaio, modello, targa, ultima_manutenzione, tipo) FROM stdin;
    public          postgres    false    225   t                  2606    16936    bunker bunker_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.bunker
    ADD CONSTRAINT bunker_pkey PRIMARY KEY (id_bunker);
 <   ALTER TABLE ONLY public.bunker DROP CONSTRAINT bunker_pkey;
       public            postgres    false    229                       2606    16847    curaferite curaferite_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.curaferite
    ADD CONSTRAINT curaferite_pkey PRIMARY KEY (id_ospedale, id_spedizione);
 D   ALTER TABLE ONLY public.curaferite DROP CONSTRAINT curaferite_pkey;
       public            postgres    false    224    224            �           2606    16444     infrastruttre infrastruttre_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.infrastruttre
    ADD CONSTRAINT infrastruttre_pkey PRIMARY KEY (id_infrastruttra);
 J   ALTER TABLE ONLY public.infrastruttre DROP CONSTRAINT infrastruttre_pkey;
       public            postgres    false    217            �           2606    16425    magazzino magazzino_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.magazzino
    ADD CONSTRAINT magazzino_pkey PRIMARY KEY (id_magazzino);
 B   ALTER TABLE ONLY public.magazzino DROP CONSTRAINT magazzino_pkey;
       public            postgres    false    215            �           2606    16476    mensa mensa_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.mensa
    ADD CONSTRAINT mensa_pkey PRIMARY KEY (id_mensa);
 :   ALTER TABLE ONLY public.mensa DROP CONSTRAINT mensa_pkey;
       public            postgres    false    218            �           2606    16805    ospedale ospedale_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ospedale
    ADD CONSTRAINT ospedale_pkey PRIMARY KEY (id_ospedale);
 @   ALTER TABLE ONLY public.ospedale DROP CONSTRAINT ospedale_pkey;
       public            postgres    false    221            	           2606    16906    partecipa partecipa_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT partecipa_pkey PRIMARY KEY (cf, id_spedizione);
 B   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT partecipa_pkey;
       public            postgres    false    227    227                       2606    16871    persone persone_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persone
    ADD CONSTRAINT persone_pkey PRIMARY KEY (cf);
 >   ALTER TABLE ONLY public.persone DROP CONSTRAINT persone_pkey;
       public            postgres    false    226            �           2606    16815    produce produce_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.produce
    ADD CONSTRAINT produce_pkey PRIMARY KEY (id_risorse, id_infrastruttra);
 >   ALTER TABLE ONLY public.produce DROP CONSTRAINT produce_pkey;
       public            postgres    false    222    222            �           2606    16437    risorse risorse_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.risorse
    ADD CONSTRAINT risorse_pkey PRIMARY KEY (id_risorse);
 >   ALTER TABLE ONLY public.risorse DROP CONSTRAINT risorse_pkey;
       public            postgres    false    216                       2606    16832    scambia scambia_pkey 
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
       public            postgres    false    220                       2606    16941    stoccaggio stoccaggio_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_pkey PRIMARY KEY (id_magazzino, id_risorse, ora, data);
 D   ALTER TABLE ONLY public.stoccaggio DROP CONSTRAINT stoccaggio_pkey;
       public            postgres    false    230    230    230    230                       2606    16921    utilizza utilizza_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.utilizza
    ADD CONSTRAINT utilizza_pkey PRIMARY KEY (id_spedizione, numero_di_telaio);
 @   ALTER TABLE ONLY public.utilizza DROP CONSTRAINT utilizza_pkey;
       public            postgres    false    228    228                       2606    16864    veicolo veicolo_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.veicolo
    ADD CONSTRAINT veicolo_pkey PRIMARY KEY (numero_di_telaio);
 >   ALTER TABLE ONLY public.veicolo DROP CONSTRAINT veicolo_pkey;
       public            postgres    false    225                       2606    16848 &   curaferite curaferite_id_ospedale_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.curaferite
    ADD CONSTRAINT curaferite_id_ospedale_fkey FOREIGN KEY (id_ospedale) REFERENCES public.ospedale(id_ospedale);
 P   ALTER TABLE ONLY public.curaferite DROP CONSTRAINT curaferite_id_ospedale_fkey;
       public          postgres    false    221    3325    224                       2606    16853 (   curaferite curaferite_id_spedizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.curaferite
    ADD CONSTRAINT curaferite_id_spedizione_fkey FOREIGN KEY (id_spedizione) REFERENCES public.spedizione(id_spedizione);
 R   ALTER TABLE ONLY public.curaferite DROP CONSTRAINT curaferite_id_spedizione_fkey;
       public          postgres    false    3323    220    224                       2606    16907    partecipa partecipa_cf_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT partecipa_cf_fkey FOREIGN KEY (cf) REFERENCES public.persone(cf);
 E   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT partecipa_cf_fkey;
       public          postgres    false    227    226    3335                       2606    16912 &   partecipa partecipa_id_spedizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partecipa
    ADD CONSTRAINT partecipa_id_spedizione_fkey FOREIGN KEY (id_spedizione) REFERENCES public.spedizione(id_spedizione);
 P   ALTER TABLE ONLY public.partecipa DROP CONSTRAINT partecipa_id_spedizione_fkey;
       public          postgres    false    220    227    3323                       2606    16882 %   persone persone_id_infrastruttra_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persone
    ADD CONSTRAINT persone_id_infrastruttra_fkey FOREIGN KEY (id_infrastruttra) REFERENCES public.infrastruttre(id_infrastruttra);
 O   ALTER TABLE ONLY public.persone DROP CONSTRAINT persone_id_infrastruttra_fkey;
       public          postgres    false    226    217    3317                       2606    16877 !   persone persone_id_magazzino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persone
    ADD CONSTRAINT persone_id_magazzino_fkey FOREIGN KEY (id_magazzino) REFERENCES public.magazzino(id_magazzino);
 K   ALTER TABLE ONLY public.persone DROP CONSTRAINT persone_id_magazzino_fkey;
       public          postgres    false    215    226    3313                       2606    16887    persone persone_id_mensa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persone
    ADD CONSTRAINT persone_id_mensa_fkey FOREIGN KEY (id_mensa) REFERENCES public.mensa(id_mensa);
 G   ALTER TABLE ONLY public.persone DROP CONSTRAINT persone_id_mensa_fkey;
       public          postgres    false    218    3319    226                       2606    16897     persone persone_id_ospedale_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persone
    ADD CONSTRAINT persone_id_ospedale_fkey FOREIGN KEY (id_ospedale) REFERENCES public.ospedale(id_ospedale);
 J   ALTER TABLE ONLY public.persone DROP CONSTRAINT persone_id_ospedale_fkey;
       public          postgres    false    221    3325    226                       2606    16892    persone persone_id_scuola_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.persone
    ADD CONSTRAINT persone_id_scuola_fkey FOREIGN KEY (id_scuola) REFERENCES public.scuole(id_scuola);
 H   ALTER TABLE ONLY public.persone DROP CONSTRAINT persone_id_scuola_fkey;
       public          postgres    false    219    3321    226                       2606    16821 %   produce produce_id_infrastruttra_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produce
    ADD CONSTRAINT produce_id_infrastruttra_fkey FOREIGN KEY (id_infrastruttra) REFERENCES public.infrastruttre(id_infrastruttra);
 O   ALTER TABLE ONLY public.produce DROP CONSTRAINT produce_id_infrastruttra_fkey;
       public          postgres    false    3317    217    222                       2606    16816    produce produce_id_risorse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produce
    ADD CONSTRAINT produce_id_risorse_fkey FOREIGN KEY (id_risorse) REFERENCES public.risorse(id_risorse);
 I   ALTER TABLE ONLY public.produce DROP CONSTRAINT produce_id_risorse_fkey;
       public          postgres    false    216    222    3315                       2606    16942 '   stoccaggio stoccaggio_id_magazzino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_id_magazzino_fkey FOREIGN KEY (id_magazzino) REFERENCES public.magazzino(id_magazzino);
 Q   ALTER TABLE ONLY public.stoccaggio DROP CONSTRAINT stoccaggio_id_magazzino_fkey;
       public          postgres    false    230    215    3313                       2606    16947 %   stoccaggio stoccaggio_id_risorse_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stoccaggio
    ADD CONSTRAINT stoccaggio_id_risorse_fkey FOREIGN KEY (id_risorse) REFERENCES public.risorse(id_risorse);
 O   ALTER TABLE ONLY public.stoccaggio DROP CONSTRAINT stoccaggio_id_risorse_fkey;
       public          postgres    false    3315    230    216                       2606    16922 $   utilizza utilizza_id_spedizione_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizza
    ADD CONSTRAINT utilizza_id_spedizione_fkey FOREIGN KEY (id_spedizione) REFERENCES public.spedizione(id_spedizione);
 N   ALTER TABLE ONLY public.utilizza DROP CONSTRAINT utilizza_id_spedizione_fkey;
       public          postgres    false    3323    220    228                       2606    16927 '   utilizza utilizza_numero_di_telaio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizza
    ADD CONSTRAINT utilizza_numero_di_telaio_fkey FOREIGN KEY (numero_di_telaio) REFERENCES public.veicolo(numero_di_telaio);
 Q   ALTER TABLE ONLY public.utilizza DROP CONSTRAINT utilizza_numero_di_telaio_fkey;
       public          postgres    false    225    3333    228            �   �   x�5��
1E��+���{����c@p!n�L�@i m�~;Ӹ��$ǌ��q|e�*�"�J���%޾6��Qm}�eikv�<��U).(�a��>&��G�|�L�m��)|
��TE���ui}�<U��bĮf����:F���B�o�v��w$O����;-C����Z��"�& ��]�      �   �   x�Uѽ
A�:�0r�d���F����+���C��^�b�&**���ْ�����.��y�^�{M&>&yLJ u m =.���~��E&�bd��Gf?sdT���Vv�6���6�����ǌ}��g�r�RhY�-kauZXfJF�-8-��(��X13;{��J�m���iy>|���J�������)�����      �   �  x�uVM��8^��	F䗰D��Ռz5'q3%�q�^p���\l����@�]���~+��t�*��(�,V��"x�_N(��֬b��Z��Aq4��Q��J��|A��5�_��j�^��V��1���!���V��ښ��XI�3.�ci��^�ղRP�!��i�����^eY��o�N�����b�w?qG׏�4��'�א�^ڲ�����)�Q��ei<Jh�AՌQʵG�����p�6X�+��a����s8TFk8ȓ�^Q�ڗ3���UB���ws��1C}{���Ż�V��<�7����9�)"Q@�#bc�Y������}t�f�F��M�\�Nf�ċ��_��i6u��m6�'��PNkڷ�� �*e�z�Q��`��!�f
SU�S�U��v�j��@�#���DRH3j8b�y�Ɔ-!�keI�bq�"�4���"v'�U#a㻆����]Q��`*�B8ҸQ���!�_$	$W��"ﱲD�~�В�G7Z���X�G�Xs|�aY��R�Jf]�3]��`�?���R�T/�lj�8��b��I+��IX�S��Sj����4���𫡧�ac�I�>�9�ۧ���7͖��B�Ѹ�u��{d�o�z�)����TeŁ ��P]�*���0�l�]�LP��+v?�\���sޓ�a<�>��d�1I�oZ��;I���I���3U��'z����� ����y�Ʒj�An�a��I1�\F�[c[�/��aN�'}6�i*��,K��\R9���JqH�p�5ZLI�l��Ù	cK�|�x���3g#F����ߜ|u����M���e�c|)ˇ5��i��Ʒ)z�IOH>3X�yoMJ-��C� o��\�c,�JI�:�3{a����G	�đPv�g�f)��i���GQ� ��c�Z�A$�      �   O  x�E�۱�0�ou0[�W.7�8���׸�}J6�sx���&s,�A�l�����'�r$�1�)�%"�,���i����~���eо��}�K�@�_w 2vxV��Z�U������x�os����۞\�i���6VH�ʠXA�U
r�bP`��'օ�LAr� 9R����پ�l������d�]���K#إQ����8viR�,&�D䝈�H���ȃHC�!�m�6D?�6D?�6D����bbb��XC�A�!�k�7����������	z ��?#��_T|!g� �#a���ю�OӉ� �mT�l      �   �   x�m�1R�0E��)t�+[�)!i���8����#+)|���Ђf������a��Bz�|�49h�P�"�ݙ��dݨ��'�O��g�W���+�.9����S���.��2y�����x����@#���y�|uq�D�	����x�1L�$s� �*�=L��/�67�=S�ˑk��A/$�7�9Ĺx���
~�k��BN�Np��c�����
v�wٓ~�t���/��gP}�3��-�X�q���Q�|�      �   �  x�u��n�0E��W�
�!�^�]�6⴫n�q�I�����wHʖ�pvF�9s/���ݛ�k놀L�%\ΕW{ �bi+��[pИb��ц�u'��I�翰�6�γ�d�Ws�ſ�������l g�J����z��`N(ŲE�*�����=�!@�٪d5_�4�/v�<�� U@������N��y �7>P��x&dIH����âB�b��`����|c�B��
�3v���I���k�>�GI�y��`�KWD\E=��Og����SG�bI�/�5� ���>,>|������=x܋�Mb')��\�.�u=|��I.�Yh�W�d��@�������xL���T�� ��|�Q�%��6x�J��M�C�׃J�/�=$^&Ô5���c�ʋHSR�/h���r6�d�dR��n�t��H'�+�#{Y��W�y�f��r;����N)[����ڣ��+���=��b�(�M|�4�����㡼�&S1+���`2?E�m���~��-�4�n���NqI�הݶ��s������ɠ���**��ذض&I���~z^m�A���˥�Z�HLRs]ݷ֮�a�Z%�7�q�|?�I8E��{<`f��)ڝG[`�2X}cJ0�Wן�%{��{��b�$���s���      �   �   x�5��Acn1����\����:B�f"b��+���$��02�N��F��x1_����c�Q�8�*n\�/T^1i�B���8�q-�<[-�@;-��D��\f�[K.3ӣ%��%����Ң0����L�h�0��j�0��i�e�Ny��c���L�      �   �  x��Y�N�:]����*v�^�F#��lL�a,���Y�g�_�?vˎ�t� ��8�S�Qe��yβ��Nf�4錉���lê�NN�ߺSٝ��ݐ���}�cgW�,�_�Zf�Z��cx\䛜ox�m��{���~R���g�q��=�Qd7zx�}���j���&/6EK�޿�jTY�<��G�٣ev�F�t����P�z�W���~����>�Fv|�h�����史��y��W)��:��Gx�V�����7�E���Yͳ��'4��^d?,���#�M�l��U<�]o���6�#�m#t@M����ϲ����ݰ�/j<�d����]tj�d���
��@KE�㬧���ץ�۾u
^�2��[ �|�*���b[R%U��]�w�W�'@*�d�����1-������A�v��:jK��I����V�nVd[������6Lz��h�:������ U 0���0�>Vv�ó���5��5�<:n���/�a��{sD�m0D��ag�=���eu�SB?���lIʬF8�B�P3�t|�R���R��
�J���� w�K5������іe�F3k�>��ǜT-��r�����+���PPq�G���������e8H[�(�fr��G8⏆>�S��C�!�<$�㴳Ĭd�X�AзG�Sd�W��q�;��au�c�\�IDF�����7���nh��"�;�3� 8p����޽����: {5�!��7�\p_k$@G?�#,qV�i�ߟVܵ��uv����s��mHY%	��\�{�^��'���2n|��ۛ�~���ʦU�4��@����}�X)���P��B����}��1� jat�2?t7��Ҹ�b������ ����^�C���`�Zb^,��+�$�[� ��s{���)�&�[`��6��W��9� r��CXmQ���<��uVkă�f��_�*�ۭrfR��3����F�0�,YEu��8LP`6��p8�i0�{7���e�N����|F�ˁ�(+�G����h�kWXȂ�6rb�$Q��B���	�=��HoM��	�l� �d�=��q�ȇ�	��0�IPq l��۲ '���`��W(�{B��K(	�-K���0K��6�g���PV>�n~��}����~����.�~��1�*�M`���cc%tjk���oF�,".v��t�2�^������̴�d�&Ь���a`��I�����xV�<��Z֪/yk8�O����y*�_ů)܈��a�[�Y�ݪ�KZH��&):
�*�9Vn����  R�m-l[�>v�X��U�9��
fF�3��R@��^(5�-����ҥ�F���SP�*Ok����`*&ݲ^�h#�6���' ��O��"�@ō�هzCpz��ܻ��; �h�# ����i�0����4��A�r�-�6�dS\YOzRW>��-�H�"U���a��.��Y��{@ݠ1T��U�C��m,Jlr���.Pa�C6��lk>��s�<���l�����a�<�zT�k	*$	�6<N1A{�K��e1�7�2���VISBF;kS��mWFv|5�?O�j��������O��;�]4d���x���m0Cݕ��v�(G\`(/ŁP�S��ɴ~O����jCR���(�����%އ�D����
��Mjb�P��oy�n}�������m�g�@��ʄ�h[����|L���u
�*8G��T�u�0l}���Y��_|�q��H�B�	K�z��,	�dVBt���>䧼���0�$�a�0N�/��/�j+��Y��gZ�����:1��}�����[>_�{TQ,���&��)��s�#~}��[��r�:EE\(�)��LQG�(s�/���MԆ7�������S`:J�r��BmKh�j���$u��<�N�'����k4��������\F      �   �   x�ϹDACA[
fk�1G.?�80�ޣ
A���v��a�մ�!5�y�P6�:ͥ�Z[T]�h��|�a9n*`g�6a��j7\c��c��c�~�K[��Ƣ	����|�#rܴ@���D�6��?�,'      �   m  x��VKr�8]7O�p��G���){g�Uve�M��eT���^h5���r���dǪ��g!m�ht����>2]��5.���xe�c��gy��<-t�ӥ���NG��qN�Wi�J�,)�imcw��M�7��X5��໎#K}�j��*)�q�ӥw�	O�\%����U��Y9h�Se�4�I%[��h��]/3�^a�f���o;X�`bd��c�m�gɚ.�;�6>Ev�gC�8�}ש�d�-ݘ���U��-6���DgteB�3]䩦;�L_�C��ŀ�l-�蜾��#fuÖ�]��2eP�1��.�CύUR���?@ﰟ$���6�֪}��W�o�9��̦�Vt�Cc8�1X,4 ��)�k�ctV���[xC_�� ��fX�Tn��8�� ��Y 7M�h�Q�y��]��7h��m��<e�k�e�Lס?XK$��(?�@��JYA���B˯>3�l���4�����<>�]j�@E7#DnMo�./p��	�i��L�P�Y[��x��-Y'φ�ϪZ�o&<N�\ז�:m������I�,2�g'ⓦ<�'�a/� !�=�..h����=#�D�b;o�<�����q0e5(*�c����p8���{��D.\T��C]]��>�$P���'�8��j;���6Y�m��*P�C�������	;.�qz#����Ώod���/�p{pgV9�>	�̎�=[k��R�5�1�g�a&*aBނ9ݏ��ΰ��(�D��r�:E|Y��7p�N�Դ�;P�>��wy*�'Bp�F?/���[�颃Tk�4A������SǣG����b�!L�+_,������b#�ȡ���Bֻ���(��o%I�����      �   1  x��V�r� =;_�$%(3�=�u��T2�VaV1����F1IU������ׯ!�hA����� ).�d?Շ�y's���y.�V6��D�2����Ki���]��p1f�;7�(�At�?�|��PRd�ZN���$��"�B�>��A(�G��*�hV�^C����b��f��ld�2>�x�vdo$wš}ZdE}�خ����ۨ�����V��Q�`8�\��'!g�T��r�{�uf;�4��J���V�Ia��K�1��:�V���e�k�c��c3�\�?��A�Sg�t�ic �.�!4@�2��=�"��k:�D]k!'�?i�-|���4�#�
�U��v���V+=�6ua����$�\��_��`}����>A�T x�F���`3n�\�w,:�q�K���8p���<��+c���%&��Íw���&̨{�����B��턿x)�qB 8���l1u��`Ԕ���QN=�� 4l�s'�x�g���U�j��Bq�&�<��ژs%��h@`�ӽ�]\�@2�AG0K�Ϗ���s/��FD�ED�;��g_�O�IȖM��t=b�#�KFk:���#t��6b��V��*�'�|H�2��}O/^?jm���WJ�p�	��M1��A��E���L%���i�k��OW�B��:ගa���
h��n�qG�-���i*�'B��7��O)� U��Æ��$k�4�{��btY��>�/������J�9�ʨ��'y�Yl�"hj�=Y�װ\�;~����-e�s"3���K��w�����t�~��u      �     x�]�Aj�0E��)|�b9qff9�(M��G3{p�MV�F�ד�
����KO��9N=8b�.�0Z�f#��	�ZYm�n�c�X��E%k�N��zM��D1��`�E-�x,�ST=��F���[�^+�mE�����Ն�K18��a�����հ�q+�!c
�xi,˝��{��HN�S�bZ�'�����ی�� ;p�'N4l ��Ԃ��cb��=�ڥ�{LY@�
P�@9��Z �v��a���V~<H) �}�      �   �  x�u��N�0E��W���i�� [�l�h@��̓_���8�me������)�.�9�����c�t~�;�]�?��_=����v��+/��Z�eSpw�t>旋���q��.���K�H�F�Z�[��\�bv������e+��g-�L�u�6��Z���L�@����������H����<y�^w�-���ه"@a�G� ��y� R͆%����.t A��)�mCb"1� ����1��W��B�-0��fCbc���X!�B���A�B_"�Z�B��,�A(`}��Ѡ�� D
��`���E@��ٰ��BPRh!5�,�B*"	���sd!5I��d�Y���9g����Z�sdal���" �kn!"k]y�ϷD��1      �   q  x�m�KR1�u�]B��7g���@Ҭ�r�cB��dd��[
����?�|JF��d�(ǭ�[Z��!��n=6iDV�x�ƌlN�*mEv��wRc㯺혤9�NR��e�,˃c����k�Ԋ^�
U�a�-S-f=�L������C*�l�j��1D����1ܪ�r?���Yη1C�#�e2���dم��0k��j�� ��l��C�Q/�av���0��t�� ^�S5��2f8Ȋ����+�e>ZUw@��z�]�}>��;���|h���zho;@_�]��C<ZȎ���n����CL��!V� ���n�|<��^��"�1����N^K�χ����C��?O��ztP��	Aq�P����<�3��      �   }   x���� �V1l̑^�Y}���TF�8+�&���ݱ��c���w��E�sW��`)�tʹ�εx4��p���s�9W��^r�+w��rh�; ����˫����%�      �   �  x�m��R�@E��W��rK�k�����l���0U�������Xdŭrל�Z:�j���yl^C�]�mׅ�:����Я�>j���?�捪M\��M�󧚫��_��杫òKggƖ:|��(`��:���:���U>Ճ�6X���`�`mG�F�+k*��	��X�:+kV��֌3}K����eN���je�E�J���V^�Cm�x��J�mɷR"�x��Jd#���w)��P�u��M���{��Ļ�V�`�I	c!�S(�щZ���Q;O-MF�A|�i%�^��f��y�c���ևΦ���W"i�×�!�)�L$�;#r!R(D�]%Q�s��(F�@��%����0�;�P��S(��kDWiT�k��8z�N�@|�i%N_�Ĺ�S(�و����Ę�dm>���A���a�W��f�!&��L6��-�5���d��9C7캱�d�&^0�ýAuGؔ/�������։W��hݵ�d�'^3�ÓC�RsO�a؇g�Z����;�~��cO*�O��G�Aun���2(��U@q/0��؛
�
<B6�b
�Io��uP|HH�Z��P\�Ѡ:�b�O�����P<<$�A��<�{����J|�������     