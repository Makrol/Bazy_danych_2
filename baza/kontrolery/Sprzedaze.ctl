LOAD DATA
INFILE 'dane_csv\Sprzedaze.csv'
INSERT INTO TABLE Sprzedaze
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_sprzedazy,
data DATE "DD/MM/YYYY",
id_dostepnosci,
id_pracownika,
id_firmy_kupujacej
)