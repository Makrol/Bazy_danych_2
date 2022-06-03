LOAD DATA
INFILE 'dane_csv\Miasta.csv'
INSERT INTO TABLE Miasta
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_miasta,
nazwa,
id_wojewodztwa
)