
INSERT /* +APPEND */ INTO HUR_TYPY_PRODUKTOW (id_typu_produktu, nazwa)
SELECT * from TYPY_PRODUKTOW;

INSERT /* +APPEND */ INTO HUR_PRODUKTY (ID_PRODUKTU, NAZWA, CENA, ID_TYPU_PRODUKTU)
SELECT * from PRODUKTY;

INSERT  /* +APPEND*/ INTO HUR_STANOWISKA(ID_STANOWISKA, NAZWA, PENSJA)
SELECT * from STANOWISKA;

INSERT  /* +APPEND*/ INTO HUR_PRACOWNICY(id_pracownika, imie, nazwisko, pesel, id_stanowiska)
SELECT ID_PRACOWNIKA,imie,NAZWISKO,PESEL,ID_STANOWISKA from PRACOWNICY;

INSERT  /* +APPEND*/ INTO HUR_BRANZE(id_branzy, nazwa)
SELECT * from BRANZE;

INSERT  /* +APPEND*/ INTO HUR_FIRMY_KUPUJACE(ID_FIRMY_KUPUJACEJ, NAZWA, NIP, REGON, ID_BRANZY)
SELECT * from FIRMY_KUPUJACE;

INSERT  /* +APPEND*/ INTO HUR_WOJEWODZTWA(id_wojewodztwa, nazwa)
SELECT * from WOJEWODZTWA;

INSERT  /* +APPEND*/ INTO HUR_ULICE(id_ulicy, nazwa)
SELECT * from ULICE;

INSERT  /* +APPEND*/ INTO HUR_MIASTA(id_miasta, nazwa, id_wojewodztwa)
SELECT * from MIASTA;

INSERT  /* +APPEND*/ INTO HUR_HURTOWNIE(id_hurtowni, nazwa, kod_pocztowy, numer_budynku, id_miasta, id_ulicy)
SELECT ID_HURTOWNI,NAZWA,KOD_POCZTOWY,NUMER_BUDYNKU,ID_MIASTA,ID_ULICY from HURTOWNIE;

INSERT  /* +APPEND*/ INTO HUR_PRZYCZYNY_ZWROTU(id_przyczyny_zwrotu, nazwa)
SELECT * from PRZYCZYNY_ZWROTOW;

INSERT INTO HUR_TYP_OPRTACJI values (1,'zwrot');
INSERT INTO HUR_TYP_OPRTACJI values (2,'zakup');

CREATE SEQUENCE seq_id
  START WITH 1
  INCREMENT BY 1;

INSERT  /* +APPEND*/ INTO HUR_OPERACJE(id_operacji, dzien, miesiac, rok, id_przyczyny_zwrotu, id_firmy_kupujacej, id_pracownika, id_produktu, id_typu_operacji, id_hurtowni)
select seq_id.nextval,
       EXTRACT(day from sp.DATA),
       EXTRACT(month from sp.DATA),
       EXTRACT(year from sp.DATA),
       null,
       sp.ID_FIRMY_KUPUJACEJ,
       sp.ID_PRACOWNIKA,
       do.ID_PRODUKTU,
       2,
       do.ID_HURTOWNI

from SPRZEDAZE sp,DOSTEPNOSCI do
where sp.ID_DOSTEPNOSCI=do.ID_DOSTEPNOSCI;

INSERT  /* +APPEND*/ INTO HUR_OPERACJE(id_operacji, dzien, miesiac, rok, id_przyczyny_zwrotu, id_firmy_kupujacej, id_pracownika, id_produktu, id_typu_operacji, id_hurtowni)
select seq_id.nextval,
       EXTRACT(day from zw.DATA),
       EXTRACT(month from zw.DATA),
       EXTRACT(year from zw.DATA),
       zw.ID_PRZYCZYNY_ZWROTU,
       sp.ID_FIRMY_KUPUJACEJ,
       sp.ID_PRACOWNIKA,
       do.ID_PRODUKTU,
       1,
       do.ID_HURTOWNI

from SPRZEDAZE sp,DOSTEPNOSCI do,ZWROTY zw, PRZYCZYNY_ZWROTOW pzw
where sp.ID_DOSTEPNOSCI=do.ID_DOSTEPNOSCI
and zw.ID_SPRZEDAZY=sp.ID_SPRZEDAZY
and pzw.ID_PRZYCZYNY_ZWROTU = zw.ID_PRZYCZYNY_ZWROTU;

drop sequence seq_id;
commit;



