LOAD DATA
INFILE 'Dostepnosci.csv'
INSERT INTO TABLE Dostepnosci
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_dostepnosci,
ilosc,
id_hurtowni,
id_produktu
)