LOAD DATA
INFILE 'Firmy_kupujace.csv'
INSERT INTO TABLE Firmy_kupujace
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_firmy_kupujacej,
nazwa,
nip,
regon,
id_branzy
)