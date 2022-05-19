LOAD DATA
INFILE 'Sprzedaze.csv'
INSERT INTO TABLE Sprzedaze
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
id_sprzedazy,
ilosc,
data DATE "DD/MM/YYYY",
id_dostepnosci,
id_pracownika,
id_firmy_kupujacej
)