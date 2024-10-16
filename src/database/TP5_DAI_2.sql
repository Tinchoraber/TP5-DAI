PGDMP  8        	        	    |            TP5_DAI    16.2    16.0 N               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    TP5_DAI    DATABASE     �   CREATE DATABASE "TP5_DAI" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE "TP5_DAI";
                postgres    false            �            1259    16399    event_categories    TABLE     �   CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    display_order integer NOT NULL
);
 $   DROP TABLE public.event_categories;
       public         heap    postgres    false            �            1259    16402    event_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.event_categories_id_seq;
       public          postgres    false    215                       0    0    event_categories_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.event_categories_id_seq OWNED BY public.event_categories.id;
          public          postgres    false    216            �            1259    16403    event_enrollments    TABLE     .  CREATE TABLE public.event_enrollments (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_user integer NOT NULL,
    description character varying(100) NOT NULL,
    registration_date_time date NOT NULL,
    attended boolean,
    observations character varying(100),
    rating numeric
);
 %   DROP TABLE public.event_enrollments;
       public         heap    postgres    false            �            1259    16408    event_enrollments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.event_enrollments_id_seq;
       public          postgres    false    217                       0    0    event_enrollments_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.event_enrollments_id_seq OWNED BY public.event_enrollments.id;
          public          postgres    false    218            �            1259    16409    event_locations    TABLE        CREATE TABLE public.event_locations (
    id integer NOT NULL,
    id_location integer NOT NULL,
    name character varying(100) NOT NULL,
    full_adress character varying(150) NOT NULL,
    max_capacity integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);
 #   DROP TABLE public.event_locations;
       public         heap    postgres    false            �            1259    16414    event_locations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.event_locations_id_seq;
       public          postgres    false    219                       0    0    event_locations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.event_locations_id_seq OWNED BY public.event_locations.id;
          public          postgres    false    220            �            1259    16415 
   event_tags    TABLE     x   CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);
    DROP TABLE public.event_tags;
       public         heap    postgres    false            �            1259    16418    event_tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.event_tags_id_seq;
       public          postgres    false    221                       0    0    event_tags_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.event_tags_id_seq OWNED BY public.event_tags.id;
          public          postgres    false    222            �            1259    16419    events    TABLE     �  CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    id_event_category integer NOT NULL,
    id_event_location integer NOT NULL,
    start_date date NOT NULL,
    duration_in_minutes integer NOT NULL,
    price integer NOT NULL,
    max_assistance integer NOT NULL,
    id_creator_user integer NOT NULL,
    enabled_for_enrollment boolean NOT NULL
);
    DROP TABLE public.events;
       public         heap    postgres    false            �            1259    16422    events_id_seq    SEQUENCE     �   CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.events_id_seq;
       public          postgres    false    223                       0    0    events_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;
          public          postgres    false    224            �            1259    16423 	   locations    TABLE     �   CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    id_province integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    16428    locations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.locations_id_seq;
       public          postgres    false    225                       0    0    locations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;
          public          postgres    false    226            �            1259    16429 	   provinces    TABLE     �   CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    full_name character varying(100) NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    display_order integer NOT NULL
);
    DROP TABLE public.provinces;
       public         heap    postgres    false            �            1259    16434    provinces_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provinces_id_seq;
       public          postgres    false    227                       0    0    provinces_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;
          public          postgres    false    228            �            1259    16435    tags    TABLE     `   CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.tags;
       public         heap    postgres    false            �            1259    16438    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tags_id_seq;
       public          postgres    false    229                       0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
          public          postgres    false    230            �            1259    16439    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16442    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    231                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    232            B           2604    16443    event_categories id    DEFAULT     z   ALTER TABLE ONLY public.event_categories ALTER COLUMN id SET DEFAULT nextval('public.event_categories_id_seq'::regclass);
 B   ALTER TABLE public.event_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            C           2604    16444    event_enrollments id    DEFAULT     |   ALTER TABLE ONLY public.event_enrollments ALTER COLUMN id SET DEFAULT nextval('public.event_enrollments_id_seq'::regclass);
 C   ALTER TABLE public.event_enrollments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            D           2604    16445    event_locations id    DEFAULT     x   ALTER TABLE ONLY public.event_locations ALTER COLUMN id SET DEFAULT nextval('public.event_locations_id_seq'::regclass);
 A   ALTER TABLE public.event_locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            E           2604    16446    event_tags id    DEFAULT     n   ALTER TABLE ONLY public.event_tags ALTER COLUMN id SET DEFAULT nextval('public.event_tags_id_seq'::regclass);
 <   ALTER TABLE public.event_tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            F           2604    16447 	   events id    DEFAULT     f   ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);
 8   ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            G           2604    16448    locations id    DEFAULT     l   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            H           2604    16449    provinces id    DEFAULT     l   ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);
 ;   ALTER TABLE public.provinces ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227            I           2604    16450    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            J           2604    16451    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231            �          0    16399    event_categories 
   TABLE DATA                 public          postgres    false    215   �X       �          0    16403    event_enrollments 
   TABLE DATA                 public          postgres    false    217   /Y       �          0    16409    event_locations 
   TABLE DATA                 public          postgres    false    219   'Z       �          0    16415 
   event_tags 
   TABLE DATA                 public          postgres    false    221   �[       �          0    16419    events 
   TABLE DATA                 public          postgres    false    223   �[                 0    16423 	   locations 
   TABLE DATA                 public          postgres    false    225   �]                 0    16429 	   provinces 
   TABLE DATA                 public          postgres    false    227   i^                 0    16435    tags 
   TABLE DATA                 public          postgres    false    229   �a                 0    16439    users 
   TABLE DATA                 public          postgres    false    231   b                  0    0    event_categories_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.event_categories_id_seq', 6, true);
          public          postgres    false    216                       0    0    event_enrollments_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.event_enrollments_id_seq', 10, true);
          public          postgres    false    218                       0    0    event_locations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.event_locations_id_seq', 5, true);
          public          postgres    false    220                       0    0    event_tags_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.event_tags_id_seq', 4, true);
          public          postgres    false    222                       0    0    events_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.events_id_seq', 12, true);
          public          postgres    false    224                       0    0    locations_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.locations_id_seq', 5, true);
          public          postgres    false    226                       0    0    provinces_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provinces_id_seq', 24, true);
          public          postgres    false    228                       0    0    tags_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.tags_id_seq', 5, true);
          public          postgres    false    230                        0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    232            L           2606    16453 &   event_categories event_categories_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.event_categories DROP CONSTRAINT event_categories_pkey;
       public            postgres    false    215            N           2606    16455 (   event_enrollments event_enrollments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_pkey;
       public            postgres    false    217            Q           2606    16457 $   event_locations event_locations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.event_locations DROP CONSTRAINT event_locations_pkey;
       public            postgres    false    219            T           2606    16459    event_tags event_tags_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_pkey;
       public            postgres    false    221            V           2606    16461    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    223            X           2606    16463    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    225            Z           2606    16465    provinces provinces_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provinces DROP CONSTRAINT provinces_pkey;
       public            postgres    false    227            \           2606    16467    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    229            ^           2606    16469    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    231            R           1259    16470    fki_event_id_location_fkey    INDEX     ]   CREATE INDEX fki_event_id_location_fkey ON public.event_locations USING btree (id_location);
 .   DROP INDEX public.fki_event_id_location_fkey;
       public            postgres    false    219            O           1259    16471    fki_id_user_fkey    INDEX     R   CREATE INDEX fki_id_user_fkey ON public.event_enrollments USING btree (id_event);
 $   DROP INDEX public.fki_id_user_fkey;
       public            postgres    false    217            _           2606    16472 1   event_enrollments event_enrollments_id_event_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.events(id) NOT VALID;
 [   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_id_event_fkey;
       public          postgres    false    223    217    4694            `           2606    16477 0   event_enrollments event_enrollments_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id) NOT VALID;
 Z   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_id_user_fkey;
       public          postgres    false    231    4702    217            a           2606    16482 &   event_locations event_id_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_id_location_fkey FOREIGN KEY (id_location) REFERENCES public.locations(id) NOT VALID;
 P   ALTER TABLE ONLY public.event_locations DROP CONSTRAINT event_id_location_fkey;
       public          postgres    false    219    225    4696            b           2606    16487 #   event_tags event_tags_id_event_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.events(id) NOT VALID;
 M   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_id_event_fkey;
       public          postgres    false    221    223    4694            c           2606    16492 !   event_tags event_tags_id_tag_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_id_tag_fkey FOREIGN KEY (id_tag) REFERENCES public.tags(id) NOT VALID;
 K   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_id_tag_fkey;
       public          postgres    false    221    229    4700            d           2606    16497 "   events events_id_creator_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_creator_user_fkey FOREIGN KEY (id_creator_user) REFERENCES public.users(id) NOT VALID;
 L   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_creator_user_fkey;
       public          postgres    false    223    231    4702            e           2606    16502 $   events events_id_event_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_event_category_fkey FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id) NOT VALID;
 N   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_event_category_fkey;
       public          postgres    false    215    4684    223            f           2606    16507 $   events events_id_event_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_event_location_fkey FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id) NOT VALID;
 N   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_event_location_fkey;
       public          postgres    false    219    4689    223            g           2606    16512 $   locations locations_id_province_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_id_province_fkey FOREIGN KEY (id_province) REFERENCES public.provinces(id) NOT VALID;
 N   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_id_province_fkey;
       public          postgres    false    227    4698    225            �   }   x���v
Q���W((M��L�K-K�+�ON,IM�/�L-Vs�	uV�0�QP�--�LNT�Q0Դ��$A�P�[iIR~P������CR�2��z�I�k��XT�
�kB�^S���S@�5j�� �}]O      �   �   x����N�0��}
�R����N�v��(�Nf5U�&'��s��ĥ����l�ݶy�A���_�;�ЙB:P�w��$��_���-\U
DV��	��G(���U�r��B[#Y�L�u.9������ºS *e�9��;aH.������Ykc%{EG�����		�'��T�B��V&����F��\xKm�ˍ�C�J���PO%�ң`���4d��C�F��ώ��7=���      �   R  x����N1��<��V��aw[(�bH 	��,;!����.F^˫7^�4�ċ4sh�i��N��j���^�B�-�=��I�-�ʚ
���dWI��IUc�,����s�g#�RXCc5dl�rT�[��+�nƙ�"�;!�Cq}ә�����+Z�{kn�_�u�jSa��6d��`���TҒ}�#՗�ˤ|�,H5�j�3Ѱ�'��?P%�J��ĽBHD ������yHO{~��>g���2o�+�7�鰴m��Ccax+[�S�!;�S6�4�{�����"����?B|�����UP��sU;:��dJ{��/]ʡt�$!|��N��      �   Y   x���v
Q���W((M��L�K-K�+�/IL/Vs�	uV�0�Q0�Q0Ҵ��$J�������1��u�uL�Vo��`��`T�� �8+      �   �  x����J�@���sW�T��j�WE+DE���d�����)����m_�3�_~�!$�df�;g���_ޭiu�����8[�}����zX��A���քd���r��6������1IB_`���v�ImGT��/�r:��2�6�!�M����(���F�_�f8��z��\:CWv�!�FGJ�.l܆>��!/��s�i۫@���$�F<�����>զ�X<GI�g��D�m'���Ң�`ks���餘A+J�+O2����F�5^�Š5{1�$���j�0�{�)�?��Cf���K$��� �<P?9�I>pV
W[Q������0�I��t4��+hv��9�C��7��&	��}m�m���*�l ����S0⪔���u4z
��         �   x��ϻ�@�ឧ�M� ��bEA�"�z��ٸa�K��f�9��t�S|�'I��P@�{��)JS��uB�-���1�aa��m�*���p/Q�tp��Im/0`EL�"�r�%sHɌ5������R"���#ަ�:�52h=o:�}r5pd��::ף�������V)�$?�2t�@ɞCHQïu'uǧ���ӡ㡩i_�)rF           x����N�@��<���Jx�3�_=Њ��MbQ�Ħ�]���z��b���	8H��f���3�}�>���\]����/⾻Y�sy�Կ�j^��������� �br�U�Ӳ)���u���Ţo��62"�im�����P��Og)@$���hʠ�[�1���SU���9�="��l�5��4s�6_��<e��0H�T��Y�E�L���~���-e)^�3tRke�c���٠�M*�1c��,�=�l�iP��d$��=��RA�AuӔE��QūP��
�mZ�E��,�orR�M!�6�1�u,�(���aQb@Z�T�vrZ7�z=.�v?C#8���DyLŀ�����#��.3 �g)X�1FR���y.���q6;�L{���1X�ZS� ٴ�ꪬ���^Fi@���������
�׋�Z�c�v�EB4��i�V����V`�^�벮��{'��֎F��Z�U��lZ�ZO.��g��S�P;�L��`HJ٨"�l2����zی�xʌ�A9�}�P� �!yHpk'��"Q���v<�����!3�]߭d�B|&�w�[;�Lk�xt� ��ޒz!ٻ�T���{�ۆ2�!:��,�#��$&��?�x�����~8;\�I��~��3��o��\:Y���쿆���a����H�ds#���,�f8O��vL{���V��i�E.
q�^��>:m��Gz�y-f]�wÐ��v��VHv�7L�
|�O��y��'��l��<����7xK��`G	�z9�r�Mq�/J����83�>�&=8��X��         c   x���v
Q���W((M��L�+IL/Vs�	uV�0�QP�=��839Q]Ӛ˓�r#�r�Ғ��bTU���e���ر�$�(Ŧ g秀��� ��C           x���AN�0E�9�w	UJZ ��*RPZ��e?uMk�ؑ��m8 �r1�q6$�����7_S���zC���4v'8�Xô!�y�]T�$9#qi���]�n���\!,=����P�j'R/,I���uT��NѐKp���j<$o�2��U��`X�	��<>E��P}�{���7PTy��xEƼ*�?s���>��7�ˀ}Ba�7�á����\:�vL�O�Kڕc���g踷0f?��uC�Q�|�/�dB�!3J�+e�F�:x}i���     