DROP TABLE Modele CASCADE CONSTRAINTS;
DROP TABLE Marki CASCADE CONSTRAINTS;
DROP TABLE Dostawcy CASCADE CONSTRAINTS;
DROP TABLE Wojewodztwa CASCADE CONSTRAINTS;
DROP TABLE Ulice CASCADE CONSTRAINTS;
DROP TABLE Stanowiska CASCADE CONSTRAINTS;
DROP TABLE Branze CASCADE CONSTRAINTS;
DROP TABLE Przyczyny_zwrotow CASCADE CONSTRAINTS;
DROP TABLE Typy_produktow CASCADE CONSTRAINTS;
DROP TABLE Produkty CASCADE CONSTRAINTS;
DROP TABLE Miasta CASCADE CONSTRAINTS;
DROP TABLE Hurtownie CASCADE CONSTRAINTS;
DROP TABLE Dostepnosci CASCADE CONSTRAINTS;
DROP TABLE Promocje CASCADE CONSTRAINTS;
DROP TABLE Dostawy CASCADE CONSTRAINTS;
DROP TABLE Pojazdy CASCADE CONSTRAINTS;
DROP TABLE Pracownicy CASCADE CONSTRAINTS;
DROP TABLE Firmy_kupujace CASCADE CONSTRAINTS;
DROP TABLE Sprzedaze CASCADE CONSTRAINTS;
DROP TABLE Zwroty CASCADE CONSTRAINTS;




CREATE TABLE Modele(
id_modelu NUMERIC PRIMARY KEY,
nazwa  VARCHAR2(15)
);
CREATE TABLE Marki(
id_marki NUMERIC PRIMARY KEY,
nazwa  VARCHAR2(15)
);
CREATE TABLE Dostawcy (
id_dostawcy NUMERIC PRIMARY KEY,
nazwa VARCHAR2(15)
);
CREATE TABLE Wojewodztwa(
id_wojewodztwa NUMERIC PRIMARY KEY,
nazwa VARCHAR2(20)
);
CREATE TABLE Ulice(
id_ulicy NUMERIC PRIMARY KEY,
nazwa VARCHAR2(20)
);
CREATE TABLE Stanowiska(
id_stanowiska NUMERIC PRIMARY KEY,
nazwa VARCHAR2(10),
pensja NUMERIC
);
CREATE TABLE Branze(
id_branzy NUMERIC PRIMARY KEY,
nazwa VARCHAR2(20)
);
CREATE TABLE Przyczyny_zwrotow(
id_przyczyny_zwrotu NUMERIC PRIMARY KEY,
nazwa VARCHAR2(20)
);
CREATE TABLE Typy_produktow(
id_typu_produktu NUMERIC PRIMARY KEY,
nazwa VARCHAR2(20)
);
CREATE TABLE Produkty(
id_produktu NUMERIC PRIMARY KEY, 
nazwa VARCHAR2(20),
cena NUMERIC,
id_typu_produktu NUMERIC,
FOREIGN KEY (id_typu_produktu) REFERENCES Typy_produktow(id_typu_produktu)
);
CREATE TABLE Miasta(
id_miasta NUMERIC PRIMARY KEY,
nazwa  VARCHAR2(20),
id_wojewodztwa NUMERIC,
FOREIGN KEY (id_wojewodztwa) REFERENCES Wojewodztwa(id_wojewodztwa)
);
CREATE TABLE Hurtownie(
id_hurtowni NUMERIC PRIMARY KEY,
nazwa  VARCHAR2(15),
id_ulicy NUMERIC,
id_miasta NUMERIC,
numer_budynku NUMERIC,
kod_pocztowy NUMERIC,
FOREIGN KEY (id_ulicy) REFERENCES Ulice(id_ulicy),
FOREIGN KEY (id_miasta) REFERENCES Miasta(id_miasta)
);
CREATE TABLE Dostepnosci(
id_dostepnosci NUMERIC PRIMARY KEY,
id_hurtowni NUMERIC,
id_produktu NUMERIC,
FOREIGN KEY (id_hurtowni) REFERENCES Hurtownie(id_hurtowni),
FOREIGN KEY (id_produktu) REFERENCES Produkty(id_produktu)
);
CREATE TABLE Promocje(
id_promocji NUMERIC PRIMARY KEY,
promocja_w_procentach NUMERIC,
id_dostepnosci NUMERIC,
FOREIGN KEY (id_dostepnosci) REFERENCES Dostepnosci(id_dostepnosci)
);
CREATE TABLE Dostawy(
id_dostawy NUMERIC PRIMARY KEY,
id_dostepnosci NUMERIC,
ilosc NUMERIC,
id_dostawcy NUMERIC,
FOREIGN KEY (id_dostawcy) REFERENCES Dostawcy(id_dostawcy),
FOREIGN KEY (id_dostepnosci) REFERENCES Dostepnosci(id_dostepnosci)
);
CREATE TABLE Pojazdy(
id_pojazdu NUMERIC PRIMARY KEY,
przebieg NUMERIC,
rocznik NUMERIC,
ladownosc NUMERIC,
id_marki NUMERIC,
id_modelu NUMERIC,
id_hurtowni NUMERIC,
FOREIGN KEY (id_marki) REFERENCES Marki(id_marki),
FOREIGN KEY (id_modelu) REFERENCES Modele(id_modelu),
FOREIGN KEY (id_hurtowni) REFERENCES Hurtownie(id_hurtowni)

);


CREATE TABLE Pracownicy(
id_pracownika NUMERIC PRIMARY KEY,
imie VARCHAR2(15),
nazwisko VARCHAR2(15),
pesel NUMERIC(11),
id_miasta NUMERIC,
id_ulicy NUMERIC,
numer_budynku NUMERIC,
numer_mieszkania NUMERIC,
kod_pocztowy  VARCHAR2(6),
id_hurtowni NUMERIC,
id_stanowiska NUMERIC,
FOREIGN KEY (id_miasta) REFERENCES Miasta(id_miasta),
FOREIGN KEY (id_ulicy) REFERENCES Ulice(id_ulicy),
FOREIGN KEY (id_hurtowni) REFERENCES Hurtownie(id_hurtowni),
FOREIGN KEY (id_stanowiska) REFERENCES Stanowiska(id_stanowiska)
);
CREATE TABLE Firmy_kupujace(
id_firmy_kupujacej NUMERIC PRIMARY KEY,
nazwa VARCHAR2(50),
nip VARCHAR2(10),
regon VARCHAR2(9),
id_branzy NUMERIC,
FOREIGN KEY (id_branzy) REFERENCES Branze(id_branzy)
);

CREATE TABLE Sprzedaze(
id_sprzedazy NUMERIC PRIMARY KEY,
ilosc NUMERIC,
data DATE,
id_dostepnosci NUMERIC,
id_pracownika NUMERIC,
id_firmy_kupujacej NUMERIC,
FOREIGN KEY (id_dostepnosci) REFERENCES Dostepnosci(id_dostepnosci),
FOREIGN KEY (id_pracownika) REFERENCES Pracownicy(id_pracownika),
FOREIGN KEY (id_firmy_kupujacej) REFERENCES Firmy_kupujace(id_firmy_kupujacej)
);
CREATE TABLE Zwroty(
id_zwrotu NUMERIC PRIMARY KEY,
data DATE,
id_sprzedazy NUMERIC,
id_przyczyny_zwrotu NUMERIC,
FOREIGN KEY (id_sprzedazy) REFERENCES Sprzedaze(id_sprzedazy),
FOREIGN KEY (id_przyczyny_zwrotu) REFERENCES Przyczyny_zwrotow(id_przyczyny_zwrotu)
);

