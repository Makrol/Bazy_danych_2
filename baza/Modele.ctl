LOAD DATA
INFILE 'Modele.csv'
INSERT INTO TABLE Modele
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_modelu,
nazwa
)