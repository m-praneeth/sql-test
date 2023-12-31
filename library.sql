PGDMP     %    '    	        
    {            library    14.9 (Homebrew)    14.9     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    178101    library    DATABASE     R   CREATE DATABASE library WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE library;
                apple    false            �            1255    178136 &   calculate_average_borrow_days(integer)    FUNCTION     o  CREATE FUNCTION public.calculate_average_borrow_days(book_id_input integer) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
    avg_borrow_days FLOAT;
BEGIN
    SELECT AVG(EXTRACT(EPOCH FROM (return_date - borrow_date)) / 86400) INTO avg_borrow_days
    FROM borrowed_books
    WHERE book_id = book_id_input;
    
    RETURN avg_borrow_days;
END;
$$;
 K   DROP FUNCTION public.calculate_average_borrow_days(book_id_input integer);
       public          odoo    false            �            1255    178138    update_return_date()    FUNCTION     �   CREATE FUNCTION public.update_return_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.return_date IS NOT NULL THEN
        NEW.return_date = CURRENT_DATE;
    END IF;
    RETURN NEW;
END;
$$;
 +   DROP FUNCTION public.update_return_date();
       public          odoo    false            �            1259    178103    books    TABLE     �   CREATE TABLE public.books (
    book_id integer NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    publication_year integer NOT NULL,
    isbn character varying(20) NOT NULL
);
    DROP TABLE public.books;
       public         heap    apple    false            �            1259    178102    books_book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.books_book_id_seq;
       public          apple    false    210            ,           0    0    books_book_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.books_book_id_seq OWNED BY public.books.book_id;
          public          apple    false    209            �            1259    178119    borrowed_books    TABLE     �   CREATE TABLE public.borrowed_books (
    borrow_id integer NOT NULL,
    user_id integer,
    book_id integer,
    borrow_date date NOT NULL,
    return_date date
);
 "   DROP TABLE public.borrowed_books;
       public         heap    apple    false            �            1259    178118    borrowed_books_borrow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.borrowed_books_borrow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.borrowed_books_borrow_id_seq;
       public          apple    false    214            -           0    0    borrowed_books_borrow_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.borrowed_books_borrow_id_seq OWNED BY public.borrowed_books.borrow_id;
          public          apple    false    213            �            1259    178112    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    registration_date date NOT NULL
);
    DROP TABLE public.users;
       public         heap    apple    false            �            1259    178111    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          apple    false    212            .           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          apple    false    211            �           2604    178106    books book_id    DEFAULT     n   ALTER TABLE ONLY public.books ALTER COLUMN book_id SET DEFAULT nextval('public.books_book_id_seq'::regclass);
 <   ALTER TABLE public.books ALTER COLUMN book_id DROP DEFAULT;
       public          apple    false    210    209    210            �           2604    178122    borrowed_books borrow_id    DEFAULT     �   ALTER TABLE ONLY public.borrowed_books ALTER COLUMN borrow_id SET DEFAULT nextval('public.borrowed_books_borrow_id_seq'::regclass);
 G   ALTER TABLE public.borrowed_books ALTER COLUMN borrow_id DROP DEFAULT;
       public          apple    false    213    214    214            �           2604    178115    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          apple    false    212    211    212            !          0    178103    books 
   TABLE DATA           O   COPY public.books (book_id, title, author, publication_year, isbn) FROM stdin;
    public          apple    false    210   �$       %          0    178119    borrowed_books 
   TABLE DATA           _   COPY public.borrowed_books (borrow_id, user_id, book_id, borrow_date, return_date) FROM stdin;
    public          apple    false    214   �.       #          0    178112    users 
   TABLE DATA           Y   COPY public.users (user_id, first_name, last_name, email, registration_date) FROM stdin;
    public          apple    false    212   �0       /           0    0    books_book_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.books_book_id_seq', 96, true);
          public          apple    false    209            0           0    0    borrowed_books_borrow_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.borrowed_books_borrow_id_seq', 168, true);
          public          apple    false    213            1           0    0    users_user_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);
          public          apple    false    211            �           2606    178110    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            apple    false    210            �           2606    178124 "   borrowed_books borrowed_books_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.borrowed_books
    ADD CONSTRAINT borrowed_books_pkey PRIMARY KEY (borrow_id);
 L   ALTER TABLE ONLY public.borrowed_books DROP CONSTRAINT borrowed_books_pkey;
       public            apple    false    214            �           2606    178117    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            apple    false    212            �           1259    178137    idx_publication_year    INDEX     R   CREATE INDEX idx_publication_year ON public.books USING btree (publication_year);
 (   DROP INDEX public.idx_publication_year;
       public            apple    false    210            �           2620    178139 )   borrowed_books update_return_date_trigger    TRIGGER     �   CREATE TRIGGER update_return_date_trigger BEFORE UPDATE ON public.borrowed_books FOR EACH ROW EXECUTE FUNCTION public.update_return_date();
 B   DROP TRIGGER update_return_date_trigger ON public.borrowed_books;
       public          apple    false    214    216            �           2606    178130 *   borrowed_books borrowed_books_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrowed_books
    ADD CONSTRAINT borrowed_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(book_id);
 T   ALTER TABLE ONLY public.borrowed_books DROP CONSTRAINT borrowed_books_book_id_fkey;
       public          apple    false    214    210    3468            �           2606    178125 *   borrowed_books borrowed_books_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrowed_books
    ADD CONSTRAINT borrowed_books_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 T   ALTER TABLE ONLY public.borrowed_books DROP CONSTRAINT borrowed_books_user_id_fkey;
       public          apple    false    212    3471    214            !   
  x��X�r�8}&�o�A� ���MlǞț�n�,"V�I+�m�g̏�iB�3Ijv')W%e�>}��n��>�+߶��\�����&����"�v.F癩�<�By^+V����.]����ƭk[�I�i�*EY(#K&�����ف_ڡ�e'|���/����E�6�Y���Jɢ��.��n�Î���:�����q�3�ե��U(Y�be��Fn���9�tٵ�>��vX��wau��0��E߸�!���Ǧ7�s�t��a���;���5��`fvX������_�����A�ع�`���BWڨ�f5�L����jX��w�{}�-�B�� ��}�6y%M�Lv���Ǯ���s6�<|���al\vi�w-��K�sc�F���U�ӕ׵,ꊉ<{����<��Ht��e�J��y.��	1�9~@h��CP�=�bd:[��� 3g���_����&L D���R�j�0�,�����:�Oapٍ�2s��v��3������*/�PӅ�ͳ�1�	���\���Ÿ��.k~���RY��U���d��θmv}�v�<l��W�%%�ȼ6yi��Ӻ3�쑊�5�쌞�O[�һ�3!��OWFI)$@��Y��=�����^�]�B"? �{��9��g2/)L��E���u`��B���
s�S��� �H&L�:�g�ߺ-�!�Ӷɀʧi��őem2�8)�>% ?D;��7a����� <l4��I
��w~I��γ=ԉ�v�m��?��!���� U��ĕŀ�H*�-26@R��'�(0Vd*X!�In���M��ӊ�	�N"ӵ��$�*�0�~��2RZ��o|��c����'��KQ���xN���{#��k���OnN�E�H �U��@(Ɋ��K���F�����w3\�iU���eeX������@�J�K�*%]R���a����w���
��q�����u���`��-_��yv�u�"q���WZ�/<(Q�L<X���r��w���6���K��cbeQ����mI{�	�Ado�nI���@@��вD��/��� (�k ��!-
	���`:B2{�΍��(D�d2���A�}�-�}�s8b�6��֒:
}�R�WB1Y�B����{�Ǐ���le�%��^,5Y`Rg7�?�g�m���ї��UH�LtX@;�Ps��[�vd�s�E������_X�e�@��3�"���I^�IYA�4(��#��F��?(l�ZB��x��z5S�4��v��Ϡ�ǵ�"&�*�	~(������;�B�=<Ҙ���l�Hw��*�H�0��w��Y�((�p�,B~6nlOJ>j�+]0%�d��$�m�3?x\�\�~j%`�����5g���ӓ[v���F�;�h�T"
���7�o��O.O�xm3�HS��9�����V�����C�A2�w���U��q�9@�Aѧ��t��/`Të�O�A�S�\hX)��j/��Ė7�M�O�����=�<�^�����OY"��S>k�o��v*Z�*t�)#6�T��H@]R A����x#���<.��qY�i���d��.��E�t��>�w^S�k���m��G��>�5���/�Z��D�۶A/��G���ee�r�(
ɴ�	֩�\y���Qj�V�a�F�s�L��QZ��L���c���i�:��_���Xb�)0J @�o��7���ȼ�3��� �m��J��E��1��i���6�� U�&�����B\�yJ���2��8e��Ø����^�������x�T���kQ�\�Mk�H1�g���ſ��r��lH�ҥm�'4�a|lm�.�nHlU�T�4��*�ƥ��K�g�>b�������_c~��y(X�?�UE�@�D���4�����.�Q!�d�q��0������Ĉ�F� k|c�k~�А�%1�::$�0S�*��X��ؘ-vh-�k�����8e+�\�*�����0SG[��
Ƕ;j
��p�51�En7���F	�]���A�P���z������@��B��a�uy�]���i8����'���b�l�iP���i�˂�wi�B�|1�oniJ����tsq��b �0>^� �m��m���$beu"Ќ��m�����f'�x�1���]��p�Z|3�^��w�m�nݏ���$�&���=qc��f9�V;�V�!�1���)�C@��i��Դc2�����T��ZE�TvaW��+��P�Y`lC}(=)�>�
�(_��n<���5$�b`������RO��w4������M����i}���3l�:��m�ǘD�����u��
�o}Er;F�ا�rz$��|�u��E�j��$ui�![��u"T*��C!,�L��dI�Cynvh�|����N
VQhf���X �a���پ4��3��)��
a1��Y,��;�T�k�˕u-LkzY���(�Yh���7����:<<a����X&/s������B�E�ml)P�p��[� H;+�I���)��n��e�"�����j�:�B͑5N,^�?����8����T���� <��      %   �  x�}�;�0Dct������+�Û�p�ix���������j�b+��'-����e�	���/=^'� @�5���k�!M��E7P �ZKZ�`@�5IZm�@�5NZ�Ё��(iZt�0�Y"&N�aOh����oh��ߧcO��[��/߅X�x�ߧc/0��u���� X�h��֋�mQ�_ދ:�o�%����}���r_bR���O�۰��=͏�Y��������Y�6I���箴1'M�l�T�� }�J3�9I�$O�!&��+�C�	�%#Ekd�'8�ˢÓ̈,�"axV3!�����@�c���|y~�>��%=}V�t�I����,j.<�jIO��#[x�%IO��G��D���~[����(���ό^uf�j3�W�Y{u����^Mf�*2����1�g�9=K���a.�
��l0�g��=���Y_ޟ��볼��)�� �6<      #   �  x�m��n�0Eף�@���թ��A�M�n�K�E��R��_�Jڴ��3���q<���1h��6������UYUJ�_Q�3y/Ό�\� ef�E'�t�m�0nb�'Έ��+xtƾ�c�!7�ķ3�J��"�Co��x�Hk�6<���k��7�ef�F�o�H��(6��M��Di+��Ys��'ޑ��K��v"��`��oY8��@c+��"�7���[߁n�q��-U&K�)-�(�Ƴ&CZt3f��	U�K�v|��:z�����nid�Us����pe�������@��/���O���J�`�^�Nƞ���}�$(��>�+��zN������'EQm�A{>����G�g�1q�LyT;88͹�Wz�!%�1Q�J�T{x;�p
!j�R��:c�LV%|�(�0��_��%Gk��S'c�p�Ģ(���V%     