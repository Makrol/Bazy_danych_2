LOAD DATA
INFILE 'dane_csv\Typy_produktow.csv'
INSERT INTO TABLE Typy_produktow
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_typu_produktu,
nazwa
)