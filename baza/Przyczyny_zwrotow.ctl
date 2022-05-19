LOAD DATA
INFILE 'Przyczyny_zwrotow.csv'
INSERT INTO TABLE Przyczyny_zwrotow
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_przyczyny_zwrotu,
nazwa
)