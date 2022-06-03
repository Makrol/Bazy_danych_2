LOAD DATA
INFILE 'dane_csv\Dostepnosci.csv'
INSERT INTO TABLE Dostepnosci
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_dostepnosci,
id_hurtowni,
id_produktu
)