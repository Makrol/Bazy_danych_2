LOAD DATA
INFILE 'dane_csv\Wojewodztwa.csv'
INSERT INTO TABLE Wojewodztwa
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_wojewodztwa,
nazwa
)