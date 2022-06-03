LOAD DATA
INFILE 'dane_csv\Stanowiska.csv'
INSERT INTO TABLE Stanowiska
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_stanowiska,
nazwa,
pensja
)