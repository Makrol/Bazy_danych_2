drop table hur_wojewodztwa cascade constraints ;
drop table hur_hurtownie cascade constraints ;
drop table hur_typy_produktow cascade constraints ;
drop table hur_produkty cascade constraints ;
drop table hur_stanowiska cascade constraints ;
drop table hur_pracownicy cascade constraints ;
drop table hur_branze cascade constraints ;
drop table hur_firmy_kupujace cascade constraints ;
drop table hur_sprzedaz cascade constraints ;

create table hur_wojewodztwa(
  id_wojewodztwa NUMERIC primary key,
  nazwa VARCHAR2(20)
);
create table hur_hurtownie(
  id_hurtowni NUMERIC primary key ,
  nazwa VARCHAR2(15)
);

create table hur_typy_produktow(
  id_typu_produktu NUMERIC primary key ,
  nazwa varchar2(20)
);
create table hur_produkty(
    id_produktu NUMERIC primary key ,
    nazwa VARCHAR2(20),
    cena NUMERIC
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
  pesel VARCHAR2(11)
);
create table hur_branze(
    id_branzy NUMERIC primary key ,
    nazwa VARCHAR2(20)
);
create table hur_firmy_kupujace(
  id_firmy_kupujacej NUMERIC primary key ,
  nazwa VARCHAR2(50),
  nip VARCHAR2(10),
  regon VARCHAR2(9)
);

create table hur_sprzedaz(
    id_sprzedazy NUMERIC primary key ,
    dzien NUMERIC,
    miesiac NUMERIC,
    rok NUMERIC,
    id_firmy_kupujacej NUMERIC,
    id_pracownika NUMERIC,
    id_produktu NUMERIC,
    id_hurtowni NUMERIC,
    id_branzy NUMERIC,
    id_stanowiska NUMERIC,
    id_wojewodztwa NUMERIC,
    id_typu_produktu NUMERIC,

    FOREIGN KEY (id_branzy) references  hur_branze(id_branzy),
    FOREIGN KEY (id_stanowiska) references  hur_stanowiska(id_stanowiska),
    FOREIGN KEY (id_wojewodztwa) references  hur_wojewodztwa(id_wojewodztwa),
    FOREIGN KEY (id_typu_produktu) references  hur_typy_produktow(id_typu_produktu),
    FOREIGN KEY (id_firmy_kupujacej) references hur_firmy_kupujace(id_firmy_kupujacej),
    FOREIGN KEY (id_pracownika) references hur_pracownicy(id_pracownika),
    FOREIGN KEY (id_produktu) references hur_produkty(id_produktu),
    FOREIGN KEY (id_hurtowni) references hur_hurtownie(id_hurtowni)
)

