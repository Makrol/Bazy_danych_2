LOAD DATA
INFILE 'dane_csv\Zwroty.csv'
INSERT INTO TABLE Zwroty
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_zwrotu,
data DATE "DD/MM/YYYY",
id_sprzedazy,
id_przyczyny_zwrotu
)