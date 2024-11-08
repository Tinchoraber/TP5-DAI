PGDMP                  
    |            TP5_DAI    16.3    16.3 N    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    16763    TP5_DAI    DATABASE     �   CREATE DATABASE "TP5_DAI" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE "TP5_DAI";
                postgres    false            �            1259    16764    event_categories    TABLE     �   CREATE TABLE public.event_categories (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    display_order integer NOT NULL
);
 $   DROP TABLE public.event_categories;
       public         heap    postgres    false            �            1259    16767    event_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.event_categories_id_seq;
       public          postgres    false    215            E           0    0    event_categories_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.event_categories_id_seq OWNED BY public.event_categories.id;
          public          postgres    false    216            �            1259    16768    event_enrollments    TABLE     .  CREATE TABLE public.event_enrollments (
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
       public         heap    postgres    false            �            1259    16773    event_enrollments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.event_enrollments_id_seq;
       public          postgres    false    217            F           0    0    event_enrollments_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.event_enrollments_id_seq OWNED BY public.event_enrollments.id;
          public          postgres    false    218            �            1259    16774    event_locations    TABLE        CREATE TABLE public.event_locations (
    id integer NOT NULL,
    id_location integer NOT NULL,
    name character varying(100) NOT NULL,
    full_adress character varying(150) NOT NULL,
    max_capacity integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);
 #   DROP TABLE public.event_locations;
       public         heap    postgres    false            �            1259    16779    event_locations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.event_locations_id_seq;
       public          postgres    false    219            G           0    0    event_locations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.event_locations_id_seq OWNED BY public.event_locations.id;
          public          postgres    false    220            �            1259    16780 
   event_tags    TABLE     x   CREATE TABLE public.event_tags (
    id integer NOT NULL,
    id_event integer NOT NULL,
    id_tag integer NOT NULL
);
    DROP TABLE public.event_tags;
       public         heap    postgres    false            �            1259    16783    event_tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.event_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.event_tags_id_seq;
       public          postgres    false    221            H           0    0    event_tags_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.event_tags_id_seq OWNED BY public.event_tags.id;
          public          postgres    false    222            �            1259    16784    events    TABLE     �  CREATE TABLE public.events (
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
    enabled_for_enrollment boolean NOT NULL,
    imagen character varying(200)
);
    DROP TABLE public.events;
       public         heap    postgres    false            �            1259    16787    events_id_seq    SEQUENCE     �   CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.events_id_seq;
       public          postgres    false    223            I           0    0    events_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;
          public          postgres    false    224            �            1259    16788 	   locations    TABLE     �   CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    id_province integer NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    16793    locations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.locations_id_seq;
       public          postgres    false    225            J           0    0    locations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;
          public          postgres    false    226            �            1259    16794 	   provinces    TABLE     �   CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    full_name character varying(100) NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    display_order integer NOT NULL
);
    DROP TABLE public.provinces;
       public         heap    postgres    false            �            1259    16799    provinces_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.provinces_id_seq;
       public          postgres    false    227            K           0    0    provinces_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;
          public          postgres    false    228            �            1259    16800    tags    TABLE     `   CREATE TABLE public.tags (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);
    DROP TABLE public.tags;
       public         heap    postgres    false            �            1259    16803    tags_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.tags_id_seq;
       public          postgres    false    229            L           0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
          public          postgres    false    230            �            1259    16804    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16807    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    231            M           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    232            x           2604    16808    event_categories id    DEFAULT     z   ALTER TABLE ONLY public.event_categories ALTER COLUMN id SET DEFAULT nextval('public.event_categories_id_seq'::regclass);
 B   ALTER TABLE public.event_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            y           2604    16809    event_enrollments id    DEFAULT     |   ALTER TABLE ONLY public.event_enrollments ALTER COLUMN id SET DEFAULT nextval('public.event_enrollments_id_seq'::regclass);
 C   ALTER TABLE public.event_enrollments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            z           2604    16810    event_locations id    DEFAULT     x   ALTER TABLE ONLY public.event_locations ALTER COLUMN id SET DEFAULT nextval('public.event_locations_id_seq'::regclass);
 A   ALTER TABLE public.event_locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            {           2604    16811    event_tags id    DEFAULT     n   ALTER TABLE ONLY public.event_tags ALTER COLUMN id SET DEFAULT nextval('public.event_tags_id_seq'::regclass);
 <   ALTER TABLE public.event_tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            |           2604    16812 	   events id    DEFAULT     f   ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);
 8   ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            }           2604    16813    locations id    DEFAULT     l   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            ~           2604    16814    provinces id    DEFAULT     l   ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);
 ;   ALTER TABLE public.provinces ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227                       2604    16815    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    16816    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231            -          0    16764    event_categories 
   TABLE DATA                 public          postgres    false    215   �X       /          0    16768    event_enrollments 
   TABLE DATA                 public          postgres    false    217   RY       1          0    16774    event_locations 
   TABLE DATA                 public          postgres    false    219   JZ       3          0    16780 
   event_tags 
   TABLE DATA                 public          postgres    false    221   �[       5          0    16784    events 
   TABLE DATA                 public          postgres    false    223   \       7          0    16788 	   locations 
   TABLE DATA                 public          postgres    false    225   ~^       9          0    16794 	   provinces 
   TABLE DATA                 public          postgres    false    227   ]_       ;          0    16800    tags 
   TABLE DATA                 public          postgres    false    229   �b       =          0    16804    users 
   TABLE DATA                 public          postgres    false    231   �b       N           0    0    event_categories_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.event_categories_id_seq', 6, true);
          public          postgres    false    216            O           0    0    event_enrollments_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.event_enrollments_id_seq', 10, true);
          public          postgres    false    218            P           0    0    event_locations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.event_locations_id_seq', 5, true);
          public          postgres    false    220            Q           0    0    event_tags_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.event_tags_id_seq', 4, true);
          public          postgres    false    222            R           0    0    events_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.events_id_seq', 12, true);
          public          postgres    false    224            S           0    0    locations_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.locations_id_seq', 5, true);
          public          postgres    false    226            T           0    0    provinces_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provinces_id_seq', 24, true);
          public          postgres    false    228            U           0    0    tags_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.tags_id_seq', 5, true);
          public          postgres    false    230            V           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    232            �           2606    16818 &   event_categories event_categories_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.event_categories DROP CONSTRAINT event_categories_pkey;
       public            postgres    false    215            �           2606    16820 (   event_enrollments event_enrollments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_pkey;
       public            postgres    false    217            �           2606    16822 $   event_locations event_locations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.event_locations DROP CONSTRAINT event_locations_pkey;
       public            postgres    false    219            �           2606    16824    event_tags event_tags_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_pkey;
       public            postgres    false    221            �           2606    16826    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    223            �           2606    16828    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    225            �           2606    16830    provinces provinces_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provinces DROP CONSTRAINT provinces_pkey;
       public            postgres    false    227            �           2606    16832    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    229            �           2606    16834    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    231            �           1259    16835    fki_event_id_location_fkey    INDEX     ]   CREATE INDEX fki_event_id_location_fkey ON public.event_locations USING btree (id_location);
 .   DROP INDEX public.fki_event_id_location_fkey;
       public            postgres    false    219            �           1259    16836    fki_id_user_fkey    INDEX     R   CREATE INDEX fki_id_user_fkey ON public.event_enrollments USING btree (id_event);
 $   DROP INDEX public.fki_id_user_fkey;
       public            postgres    false    217            �           2606    16837 1   event_enrollments event_enrollments_id_event_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.events(id) NOT VALID;
 [   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_id_event_fkey;
       public          postgres    false    223    217    4748            �           2606    16842 0   event_enrollments event_enrollments_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id) NOT VALID;
 Z   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_id_user_fkey;
       public          postgres    false    217    4756    231            �           2606    16847 &   event_locations event_id_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_id_location_fkey FOREIGN KEY (id_location) REFERENCES public.locations(id) NOT VALID;
 P   ALTER TABLE ONLY public.event_locations DROP CONSTRAINT event_id_location_fkey;
       public          postgres    false    219    225    4750            �           2606    16852 #   event_tags event_tags_id_event_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.events(id) NOT VALID;
 M   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_id_event_fkey;
       public          postgres    false    221    223    4748            �           2606    16857 !   event_tags event_tags_id_tag_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_id_tag_fkey FOREIGN KEY (id_tag) REFERENCES public.tags(id) NOT VALID;
 K   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_id_tag_fkey;
       public          postgres    false    229    4754    221            �           2606    16862 "   events events_id_creator_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_creator_user_fkey FOREIGN KEY (id_creator_user) REFERENCES public.users(id) NOT VALID;
 L   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_creator_user_fkey;
       public          postgres    false    4756    231    223            �           2606    16867 $   events events_id_event_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_event_category_fkey FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id) NOT VALID;
 N   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_event_category_fkey;
       public          postgres    false    223    215    4738            �           2606    16872 $   events events_id_event_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_event_location_fkey FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id) NOT VALID;
 N   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_event_location_fkey;
       public          postgres    false    223    4743    219            �           2606    16877 $   locations locations_id_province_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_id_province_fkey FOREIGN KEY (id_province) REFERENCES public.provinces(id) NOT VALID;
 N   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_id_province_fkey;
       public          postgres    false    225    227    4752            -   }   x���v
Q���W((M��L�K-K�+�ON,IM�/�L-Vs�	uV�0�QP�--�LNT�Q0Դ��$A�P�[iIR~P������CR�2��z�I�k��XT�
�kB�^S���S@�5j�� �}]O      /   �   x����N�0��}
�R����N�v��(�Nf5U�&'��s��ĥ����l�ݶy�A���_�;�ЙB:P�w��$��_���-\U
DV��	��G(���U�r��B[#Y�L�u.9������ºS *e�9��;aH.������Ykc%{EG�����		�'��T�B��V&����F��\xKm�ˍ�C�J���PO%�ң`���4d��C�F��ώ��7=���      1   R  x����N1��<��V��aw[(�bH 	��,;!����.F^˫7^�4�ċ4sh�i��N��j���^�B�-�=��I�-�ʚ
���dWI��IUc�,����s�g#�RXCc5dl�rT�[��+�nƙ�"�;!�Cq}ә�����+Z�{kn�_�u�jSa��6d��`���TҒ}�#՗�ˤ|�,H5�j�3Ѱ�'��?P%�J��ĽBHD ������yHO{~��>g���2o�+�7�鰴m��Ccax+[�S�!;�S6�4�{�����"����?B|�����UP��sU;:��dJ{��/]ʡt�$!|��N��      3   V   x���v
Q���W((M��L�K-K�+�/IL/Vs�	uV�0�Q0�Q0Ҵ��$J�������1��u�uL�Vo��`q �8,      5   \  x����n�0����[�����f᪂V�TDn��dvkH�`;[x^��}1��-���F9(��3��.�o�?������Mo��hc`_ή>�߰W�)[����X�l��v6@��/h�#�hZ3C��!z��a�li�Y�\`г�6�(2?e����5�%��Z�K�#�D?!-��qo�� U��v��(�݄`���ͤPZ�R�ì�d-u��e��RV�9�E�X������c�|D�}w��oO.��gI�]�7��Q,{�l�at��AH����#=�p�G�7$Z�(�g�B�B�ru���ZҘ.�uB�?C��l=�oY��u�>z�D�V���?ـ��a������!�=p�;G��)44J�5��JU��1ՏV�f]<�Ǎ���`��G�#���2�k)qX�fPOQ���SV�f��h���e=���&�C[l�Ū�d��4���!Y	Y�rt�6�Ѿ�e���d�.��Z��l�Gj��Q�:��	[?��8=��1��;(�$�"�V��R���)�%Ws��6Գ塃�3 mg������Y���:���RB���B��ΐ=�����yM���Q�ةO	      7   �   x��ϻ�@�ឧ�M� ��bEA�"�z��ٸa�K��f�9��t�S|�'I��P@�{��)JS��uB�-���1�aa��m�*���p/Q�tp��Im/0`EL�"�r�%sHɌ5������R"���#ަ�:�52h=o:�}r5pd��::ף�������V)�$?�2t�@ɞCHQïu'uǧ���ӡ㡩i_�)rF      9     x����N�@��<���Jx�3�_=Њ��MbQ�Ħ�]���z��b���	8H��f���3�}�>���\]����/⾻Y�sy�Կ�j^��������� �br�U�Ӳ)���u���Ţo��62"�im�����P��Og)@$���hʠ�[�1���SU���9�="��l�5��4s�6_��<e��0H�T��Y�E�L���~���-e)^�3tRke�c���٠�M*�1c��,�=�l�iP��d$��=��RA�AuӔE��QūP��
�mZ�E��,�orR�M!�6�1�u,�(���aQb@Z�T�vrZ7�z=.�v?C#8���DyLŀ�����#��.3 �g)X�1FR���y.���q6;�L{���1X�ZS� ٴ�ꪬ���^Fi@���������
�׋�Z�c�v�EB4��i�V����V`�^�벮��{'��֎F��Z�U��lZ�ZO.��g��S�P;�L��`HJ٨"�l2����zی�xʌ�A9�}�P� �!yHpk'��"Q���v<�����!3�]߭d�B|&�w�[;�Lk�xt� ��ޒz!ٻ�T���{�ۆ2�!:��,�#��$&��?�x�����~8;\�I��~��3��o��\:Y���쿆���a����H�ds#���,�f8O��vL{���V��i�E.
q�^��>:m��Gz�y-f]�wÐ��v��VHv�7L�
|�O��y��'��l��<����7xK��`G	�z9�r�Mq�/J����83�>�&=8��X��      ;   c   x���v
Q���W((M��L�+IL/Vs�	uV�0�QP�=��839Q]Ӛ˓�r#�r�Ғ��bTU���e���ر�$�(Ŧ g秀��� ��C      =     x���AN�0E�9�w	UJZ ��*RPZ��e?uMk�ؑ��m8 �r1�q6$�����7_S���zC���4v'8�Xô!�y�]T�$9#qi���]�n���\!,=����P�j'R/,I���uT��NѐKp���j<$o�2��U��`X�	��<>E��P}�{���7PTy��xEƼ*�?s���>��7�ˀ}Ba�7�á����\:�vL�O�Kڕc���g踷0f?��uC�Q�|�/�dB�!3J�+e�F�:x}i���     