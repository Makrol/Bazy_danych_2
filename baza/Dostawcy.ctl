LOAD DATA
INFILE 'Dostawcy.csv'
INSERT INTO TABLE Dostawcy
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_dostawcy,
nazwa
)