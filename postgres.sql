PGDMP      9                |            tp-dai    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    tp-dai    DATABASE        CREATE DATABASE "tp-dai" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE "tp-dai";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16399    Usuarios    TABLE     _   CREATE TABLE public."Usuarios" (
    id integer NOT NULL,
    nombre character varying(150)
);
    DROP TABLE public."Usuarios";
       public         heap    postgres    false    4            �            1259    16402    Usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Usuarios_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Usuarios_id_seq";
       public          postgres    false    4    215            �           0    0    Usuarios_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Usuarios_id_seq" OWNED BY public."Usuarios".id;
          public          postgres    false    216                       2604    16403    Usuarios id    DEFAULT     n   ALTER TABLE ONLY public."Usuarios" ALTER COLUMN id SET DEFAULT nextval('public."Usuarios_id_seq"'::regclass);
 <   ALTER TABLE public."Usuarios" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �          0    16399    Usuarios 
   TABLE DATA           0   COPY public."Usuarios" (id, nombre) FROM stdin;
    public          postgres    false    215   �       �           0    0    Usuarios_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Usuarios_id_seq"', 1, true);
          public          postgres    false    216                       2606    16408    Usuarios Usuarios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Usuarios"
    ADD CONSTRAINT "Usuarios_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Usuarios" DROP CONSTRAINT "Usuarios_pkey";
       public            postgres    false    215            �      x�3�,H-H����� ��     