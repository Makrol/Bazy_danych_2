LOAD DATA
INFILE 'Dostawy.csv'
INSERT INTO TABLE Dostawy
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_dostawy,
id_dostepnosci,
ilosc,
id_dostawcy
)