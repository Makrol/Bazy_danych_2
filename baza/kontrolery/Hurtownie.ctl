LOAD DATA
INFILE 'dane_csv\Hurtownie.csv'
INSERT INTO TABLE Hurtownie
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_hurtowni,
nazwa,
id_ulicy,
id_miasta,
numer_budynku,
kod_pocztowy
)