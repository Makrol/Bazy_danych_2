LOAD DATA
INFILE 'dane_csv\Ulice.csv'
INSERT INTO TABLE Ulice
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_ulicy,
nazwa
)