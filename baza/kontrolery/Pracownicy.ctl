LOAD DATA
INFILE 'dane_csv\Pracownicy.csv'
INSERT INTO TABLE Pracownicy
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_pracownika,
imie,
nazwisko,
pesel,
id_miasta,
id_ulicy,
numer_budynku,
numer_mieszkania,
kod_pocztowy,
id_hurtowni,
id_stanowiska
)