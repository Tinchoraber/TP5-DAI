PGDMP  6    "                |            TP5_DAI    16.3    16.3 N    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    16398    TP5_DAI    DATABASE     �   CREATE DATABASE "TP5_DAI" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
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
       public          postgres    false    215            E           0    0    event_categories_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.event_categories_id_seq OWNED BY public.event_categories.id;
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
       public          postgres    false    217            F           0    0    event_enrollments_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.event_enrollments_id_seq OWNED BY public.event_enrollments.id;
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
       public          postgres    false    219            G           0    0    event_locations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.event_locations_id_seq OWNED BY public.event_locations.id;
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
       public          postgres    false    221            H           0    0    event_tags_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.event_tags_id_seq OWNED BY public.event_tags.id;
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
       public          postgres    false    223            I           0    0    events_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;
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
       public          postgres    false    225            J           0    0    locations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;
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
       public          postgres    false    227            K           0    0    provinces_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;
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
       public          postgres    false    229            L           0    0    tags_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
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
       public          postgres    false    231            M           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    232            x           2604    16443    event_categories id    DEFAULT     z   ALTER TABLE ONLY public.event_categories ALTER COLUMN id SET DEFAULT nextval('public.event_categories_id_seq'::regclass);
 B   ALTER TABLE public.event_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            y           2604    16444    event_enrollments id    DEFAULT     |   ALTER TABLE ONLY public.event_enrollments ALTER COLUMN id SET DEFAULT nextval('public.event_enrollments_id_seq'::regclass);
 C   ALTER TABLE public.event_enrollments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            z           2604    16445    event_locations id    DEFAULT     x   ALTER TABLE ONLY public.event_locations ALTER COLUMN id SET DEFAULT nextval('public.event_locations_id_seq'::regclass);
 A   ALTER TABLE public.event_locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            {           2604    16446    event_tags id    DEFAULT     n   ALTER TABLE ONLY public.event_tags ALTER COLUMN id SET DEFAULT nextval('public.event_tags_id_seq'::regclass);
 <   ALTER TABLE public.event_tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            |           2604    16447 	   events id    DEFAULT     f   ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);
 8   ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            }           2604    16448    locations id    DEFAULT     l   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            ~           2604    16449    provinces id    DEFAULT     l   ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);
 ;   ALTER TABLE public.provinces ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227                       2604    16450    tags id    DEFAULT     b   ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
 6   ALTER TABLE public.tags ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    16451    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231            -          0    16399    event_categories 
   TABLE DATA           C   COPY public.event_categories (id, name, display_order) FROM stdin;
    public          postgres    false    215   �[       /          0    16403    event_enrollments 
   TABLE DATA           �   COPY public.event_enrollments (id, id_event, id_user, description, registration_date_time, attended, observations, rating) FROM stdin;
    public          postgres    false    217   E\       1          0    16409    event_locations 
   TABLE DATA           p   COPY public.event_locations (id, id_location, name, full_adress, max_capacity, latitude, longitude) FROM stdin;
    public          postgres    false    219   �\       3          0    16415 
   event_tags 
   TABLE DATA           :   COPY public.event_tags (id, id_event, id_tag) FROM stdin;
    public          postgres    false    221   ^       5          0    16419    events 
   TABLE DATA           �   COPY public.events (id, name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, max_assistance, id_creator_user, enabled_for_enrollment) FROM stdin;
    public          postgres    false    223   L^       7          0    16423 	   locations 
   TABLE DATA           O   COPY public.locations (id, name, id_province, latitude, longitude) FROM stdin;
    public          postgres    false    225   �_       9          0    16429 	   provinces 
   TABLE DATA           \   COPY public.provinces (id, name, full_name, latitude, longitude, display_order) FROM stdin;
    public          postgres    false    227   O`       ;          0    16435    tags 
   TABLE DATA           (   COPY public.tags (id, name) FROM stdin;
    public          postgres    false    229   c       =          0    16439    users 
   TABLE DATA           N   COPY public.users (id, first_name, last_name, username, password) FROM stdin;
    public          postgres    false    231   Tc       N           0    0    event_categories_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.event_categories_id_seq', 6, true);
          public          postgres    false    216            O           0    0    event_enrollments_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.event_enrollments_id_seq', 10, true);
          public          postgres    false    218            P           0    0    event_locations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.event_locations_id_seq', 5, true);
          public          postgres    false    220            Q           0    0    event_tags_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.event_tags_id_seq', 4, true);
          public          postgres    false    222            R           0    0    events_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.events_id_seq', 12, true);
          public          postgres    false    224            S           0    0    locations_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.locations_id_seq', 5, true);
          public          postgres    false    226            T           0    0    provinces_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provinces_id_seq', 24, true);
          public          postgres    false    228            U           0    0    tags_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.tags_id_seq', 5, true);
          public          postgres    false    230            V           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    232            �           2606    16453 &   event_categories event_categories_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.event_categories
    ADD CONSTRAINT event_categories_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.event_categories DROP CONSTRAINT event_categories_pkey;
       public            postgres    false    215            �           2606    16455 (   event_enrollments event_enrollments_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_pkey;
       public            postgres    false    217            �           2606    16457 $   event_locations event_locations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_locations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.event_locations DROP CONSTRAINT event_locations_pkey;
       public            postgres    false    219            �           2606    16459    event_tags event_tags_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_pkey;
       public            postgres    false    221            �           2606    16461    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    223            �           2606    16463    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    225            �           2606    16465    provinces provinces_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.provinces DROP CONSTRAINT provinces_pkey;
       public            postgres    false    227            �           2606    16467    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    229            �           2606    16469    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    231            �           1259    16470    fki_event_id_location_fkey    INDEX     ]   CREATE INDEX fki_event_id_location_fkey ON public.event_locations USING btree (id_location);
 .   DROP INDEX public.fki_event_id_location_fkey;
       public            postgres    false    219            �           1259    16471    fki_id_user_fkey    INDEX     R   CREATE INDEX fki_id_user_fkey ON public.event_enrollments USING btree (id_event);
 $   DROP INDEX public.fki_id_user_fkey;
       public            postgres    false    217            �           2606    16472 1   event_enrollments event_enrollments_id_event_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.events(id) NOT VALID;
 [   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_id_event_fkey;
       public          postgres    false    223    217    4748            �           2606    16477 0   event_enrollments event_enrollments_id_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_enrollments
    ADD CONSTRAINT event_enrollments_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id) NOT VALID;
 Z   ALTER TABLE ONLY public.event_enrollments DROP CONSTRAINT event_enrollments_id_user_fkey;
       public          postgres    false    231    4756    217            �           2606    16482 &   event_locations event_id_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_locations
    ADD CONSTRAINT event_id_location_fkey FOREIGN KEY (id_location) REFERENCES public.locations(id) NOT VALID;
 P   ALTER TABLE ONLY public.event_locations DROP CONSTRAINT event_id_location_fkey;
       public          postgres    false    219    225    4750            �           2606    16487 #   event_tags event_tags_id_event_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_id_event_fkey FOREIGN KEY (id_event) REFERENCES public.events(id) NOT VALID;
 M   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_id_event_fkey;
       public          postgres    false    221    223    4748            �           2606    16492 !   event_tags event_tags_id_tag_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event_tags
    ADD CONSTRAINT event_tags_id_tag_fkey FOREIGN KEY (id_tag) REFERENCES public.tags(id) NOT VALID;
 K   ALTER TABLE ONLY public.event_tags DROP CONSTRAINT event_tags_id_tag_fkey;
       public          postgres    false    221    229    4754            �           2606    16497 "   events events_id_creator_user_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_creator_user_fkey FOREIGN KEY (id_creator_user) REFERENCES public.users(id) NOT VALID;
 L   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_creator_user_fkey;
       public          postgres    false    223    231    4756            �           2606    16502 $   events events_id_event_category_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_event_category_fkey FOREIGN KEY (id_event_category) REFERENCES public.event_categories(id) NOT VALID;
 N   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_event_category_fkey;
       public          postgres    false    215    4738    223            �           2606    16507 $   events events_id_event_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_id_event_location_fkey FOREIGN KEY (id_event_location) REFERENCES public.event_locations(id) NOT VALID;
 N   ALTER TABLE ONLY public.events DROP CONSTRAINT events_id_event_location_fkey;
       public          postgres    false    219    4743    223            �           2606    16512 $   locations locations_id_province_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_id_province_fkey FOREIGN KEY (id_province) REFERENCES public.provinces(id) NOT VALID;
 N   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_id_province_fkey;
       public          postgres    false    227    4752    225            -   @   x�3��--�LN�4�2�t+-I���4�2�I��,�4�2�t,*I-�4�2���OI�4����� �y�      /   �   x�M�A
�0����@�6m\�p!�t��M0�(A�D�\��٢H��fFCCas��V�#';�����IE�8��K�؈-j�6�pw3W!�������p�a`�~U�&� ѡ��1��gv����F*=��s�ʜx�{a��A� �}l�2E�����J��59�      1     x�]��N1����)����ӥ�/�l�ċ�!������.F^˫7^������߀���g2z��p
�	6�����I
Op5H�.C��lLkҖlS�4�ª
*h��������{��&���B��8����W�}鍛�jh)=���r��QR���pd���hƶ	�����=��JFS530mH�" ���+����ZI<N�h�;.!C}u*��y5:3�Ye�B����qY�� k�Qp�"X_��$�O��8��#�#�ԣVJ}f�m      3   %   x�3�4�4�2�4�4�2�4�4�2��4����� 5��      5   H  x�U�1r�0E��{�� �'�R�p�f�D3BK$��ur��XVx�I��������8���Ŝ�G�s�˺�'F�Dqq�N�wFk٭�q�g��/�"8��i`=�cd�=M3�Ӊ�(ޱ�D�4��\Lwq?�7=PC
n��1�Z���-��~z�-�֌�O�L�Oy��J>��̔���C��C��Ҩ���, i�������./��)��j��J{������>�A�lj}��Xx���h�U���F��4w`��M�ڊ�����6aW�.OzM	%tJ�(�����r�]�zG4�%�JF���X̬>Vz���nޕ��]�i4��Ȳ��Ԛ�      7   �   x�-�1� ����SpI����q2!qpq!)1DRRJ=������|���T}3���w� @5\	c�@�mȢ��8v�~BJ A�� �--�9��%�kN@���B�y
y+\�}�ohkL'	5��_�g�C����V��N�sD��i.$      9   �  x�m�M��@��է�p�����!b$��K6&������܆%V!��0�LV���\]�U7�˱n�}�j�z���{�n������J��fBNJ�6���!X�^�`݌�j[�����v���q$R>YN(��ú�]�o����咒�!KB(�ؘ�<���\m��8j%��D�"�� ��	�>��ݧe��Z2ZO�%V�[L)� �DXw}����t�^RԃFIs��=:�$x�}]�~w��B�d�DQ8[J$�L����u��qObI�zQO��%�J6����e�qI���$Gk�R�s�� �۪x_��.��Ւ�u�e����,�h�&���<E�jI�zd
:>!�$ d���m�� O�dJJ�O��T�pd���}ӵ�<��Y5G�f5j�ޠ��z�6~���Y-9�c�����r ���t�]9x�#���&<M��U��~	�іo�Vs����4~�">Ε���m2�g���쟒�Z2[v)�3�(��	�bݏO��^
�@p�{?LH���U���t�.H��Zȑ�ҧ�f����j���Ҷ�6L��Dq3�<M�!�M��Ǜ~5�w��-W_�v8��f[u�z_����p���7]q;�ڽ��\H2�Ύ4} 6��|7�N7/*���I.ь�u�(�Y�K���S�����:P�wP�tR0�1�/�a�0      ;   7   x�3��=��839�ˈӭ�$)?�˘3$5/��˄ӱ�$��˔�7?%�+F��� cY`      =   �   x�M�M�0F��Ð ��I\�F�n�R�	�d�j�m<��z1[�t7/yo���:i��d�[�'������	�q=�.�d�
���9x���m�zZYB#��}�Jh�Fm��_�!ၥ�&if4桩��WТ#�� �.�Aw�F����z-��*�(މ�W�~�c?tR�     