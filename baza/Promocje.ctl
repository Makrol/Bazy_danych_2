LOAD DATA
INFILE 'Promocje.csv'
INSERT INTO TABLE Promocje
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_promocji,
promocja_w_procentach,
id_dostepnosci
)