LOAD DATA
INFILE 'Pojazdy.csv'
INSERT INTO TABLE Pojazdy
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_pojazdu,
przebieg,
rocznik,
ladownosc,
id_marki,
id_modelu,
id_hurtowni
)