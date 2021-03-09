CLASS zcl_119012_demo_0301 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_119012_demo_0301 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "SELECT FROM <Datenbanktabelle/Datenbankview>
    " FIELDS <Spalte 1>, <Spalte 2>, ...
    " WHERE <Bedingung>
    " ORDER BY <Sortierreihenfolge>
    " INTO @<Zielvariable>.
    " IF sy-subrc <> 0.
    " TO DO: Fehlerbehandlung
    " ENDIF.

    "eine Zeile oder mehrere? weil Struktur oder interne Tabelle als Zielvariable

    DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.
    DATA connection TYPE ZI_119012_Connection.
    DATA connections TYPE TABLE OF ZI_119012_Connection.

    "Einzelsatz lesen

    SELECT SINGLE FROM ZI_119012_Connection
    FIELDS *
    WHERE CarrierId = @carrier_id AND ConnectionId = @connection_id  "würde auch passen '0400'
    INTO @connection.
    IF sy-subrc <> 0.
      " Fehlerbehandlung
    ENDIF.

    "Lesen mehrerer Datensätze
    SELECT FROM ZI_119012_Connection
    FIELDS *
    WHERE CarrierId = @carrier_id "jetzt alles zu 'LH'
    INTO TABLE @connections.
    IF sy-subrc <> 0.
      " Fehlerbehandlung
    ENDIF.

  ENDMETHOD.
ENDCLASS.
