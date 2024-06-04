*&---------------------------------------------------------------------*
*& Report z_id_randomico
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_id_randomico.

TYPES: BEGIN OF ty_cliente,
        id   TYPE sysuuid_c26,
        nome TYPE char20,
       END OF ty_cliente.

DATA: tt_clientes TYPE TABLE OF ty_cliente.
DATA(lo_uuid) = cl_uuid_factory=>create_system_uuid( ).

tt_clientes = VALUE #(
  ( id = lo_uuid->create_uuid_c26( )
    nome = 'José da Silva' )

  ( id = cl_system_uuid=>create_uuid_c26_static( )
    nome = 'João de Souza' )
).

LOOP AT tt_clientes INTO DATA(ls_clientes).
  WRITE: / 'ID:', ls_clientes-id, 'Nome:', ls_clientes-nome.
ENDLOOP.
