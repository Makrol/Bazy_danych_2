drop table hur_wojewodztwa cascade constraints ;
drop table hur_miasta cascade constraints ;
drop table hur_ulice cascade constraints ;
drop table hur_hurtownie cascade constraints ;
drop table hur_przyczyny_zwrotu cascade constraints ;
drop table hur_typy_produktow cascade constraints ;
drop table hur_produkty cascade constraints ;
drop table hur_stanowiska cascade constraints ;
drop table hur_pracownicy cascade constraints ;
drop table hur_typ_oprtacji cascade constraints ;
drop table hur_branze cascade constraints ;
drop table hur_firmy_kupujace cascade constraints ;
drop table hur_operacje cascade constraints ;


create table hur_wojewodztwa(
  id_wojewodztwa NUMERIC primary key,
  nazwa VARCHAR2(20)
);
create table hur_miasta(
  id_miasta NUMERIC primary key ,
  nazwa VARCHAR2(20),
  id_wojewodztwa NUMERIC,
  FOREIGN KEY (id_wojewodztwa) references  hur_wojewodztwa(id_wojewodztwa)
);
create table hur_ulice(
    id_ulicy NUMERIC primary key ,
    nazwa varchar2(20)
);
create table hur_hurtownie(
  id_hurtowni NUMERIC primary key ,
  nazwa VARCHAR2(15),
  kod_pocztowy VARCHAR2(6),
  numer_budynku NUMERIC,
  id_miasta NUMERIC,
  id_ulicy NUMERIC,
  FOREIGN KEY (id_miasta) references hur_miasta(id_miasta),
  foreign key (id_ulicy) references hur_ulice(id_ulicy)
);
create table hur_przyczyny_zwrotu(
    id_przyczyny_zwrotu NUMERIC primary key ,
    nazwa varchar2(20)
);
create table hur_typy_produktow(
  id_typu_produktu NUMERIC primary key ,
  nazwa varchar2(20)
);
create table hur_produkty(
    id_produktu NUMERIC primary key ,
    nazwa VARCHAR2(20),
    cena NUMERIC,
    id_typu_produktu NUMERIC,
    FOREIGN KEY (id_typu_produktu) references hur_typy_produktow(id_typu_produktu)
);
create table hur_stanowiska(
    id_stanowiska NUMERIC primary key ,
    nazwa VARCHAR2(10),
    pensja NUMERIC
);
create table hur_pracownicy(
  id_pracownika NUMERIC primary key ,
  imie VARCHAR2(15),
  nazwisko VARCHAR2(15),
  pesel VARCHAR2(11),
  id_stanowiska NUMERIC,
  FOREIGN KEY (id_stanowiska) references hur_stanowiska(id_stanowiska)
);
create table hur_typ_oprtacji(
  id_typu_operaji NUMERIC primary key ,
  typ VARCHAR2(10)
);
create table hur_branze(
    id_branzy NUMERIC primary key ,
    nazwa VARCHAR2(20)
);
create table hur_firmy_kupujace(
  id_firmy_kupujacej NUMERIC primary key ,
  nazwa VARCHAR2(50),
  nip VARCHAR2(10),
  regon VARCHAR2(9),
  id_branzy NUMERIC,
 FOREIGN KEY (id_branzy) references hur_branze(id_branzy)
);
create table hur_operacje(
    id_operacji NUMERIC primary key ,
    dzien NUMERIC,
    miesiac NUMERIC,
    rok NUMERIC,
    id_przyczyny_zwrotu NUMERIC,
    id_firmy_kupujacej NUMERIC,
    id_pracownika NUMERIC,
    id_produktu NUMERIC,
    id_typu_operacji NUMERIC,
    id_hurtowni,
    FOREIGN KEY (id_przyczyny_zwrotu) references hur_przyczyny_zwrotu(id_przyczyny_zwrotu),
    FOREIGN KEY (id_firmy_kupujacej) references hur_firmy_kupujace(id_firmy_kupujacej),
    FOREIGN KEY (id_pracownika) references hur_pracownicy(id_pracownika),
    FOREIGN KEY (id_produktu) references hur_produkty(id_produktu),
    FOREIGN KEY (id_typu_operacji) references hur_typ_oprtacji(id_typu_operaji),
    FOREIGN KEY (id_hurtowni) references hur_hurtownie(id_hurtowni)
)

