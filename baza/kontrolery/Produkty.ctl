LOAD DATA
INFILE 'dane_csv\Produkty.csv'
INSERT INTO TABLE Produkty
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_produktu,
nazwa,
cena,
id_typu_produktu
)