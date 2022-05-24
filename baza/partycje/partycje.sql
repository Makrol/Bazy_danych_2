--Partcja demonstrująca stosunek procentowy pieniędzy wydanych przez firmy w danej branży
select br.nazwa,fk.nazwa,sum(pr.cena)kowta,sum(sum(pr.cena)) over( partition BY br.nazwa)suma_kwot,Round(100*sum(pr.cena)/sum(sum(pr.cena)) over( partition BY br.nazwa))"usia w %"
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join firmy_kupujace fk
on fk.id_firmy_kupujacej=sp.id_firmy_kupujacej
join branze br
on br.id_branzy=fk.id_branzy
group by br.nazwa,fk.nazwa;



--Partycja demonstrująca jaki wkład ma pracownik pracujący na danymstanowisku w przychodzy wygenerowane przez wszystkich pracowników na tym stanowisku
select st.nazwa,pra.id_pracownika,pra.imie,pra.nazwisko,
sum(pr.cena)"suma z sprzedazy produktow przez pracownika",
sum(sum(pr.cena)) over (PARTITION by st.nazwa) "suma z sprzedazy produktow na danym stanowisku",
Round(100*sum(pr.cena)/sum(sum(pr.cena)) over (PARTITION by st.nazwa))"udzial w %"
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join pracownicy pra
on pra.id_pracownika=sp.id_pracownika
join stanowiska st
on st.id_stanowiska=pra.id_stanowiska
group by st.nazwa,pra.id_pracownika,pra.imie,pra.nazwisko;


--Partycja demonstrująca stosunek sprzedanych produktów danego typu do wszystkich sprzedanych produktów tego typu
select tp.nazwa nazwa_typu,
pr.nazwa nazwa_produktu,
count(*) "suma ilosci sprzedanych produktow konkretnego typu",
sum(count(*)) over (partition by tp.nazwa) "suma wszystkich produktow danego typu",
Round(100*count(*)/sum(count(*)) over (partition by tp.nazwa))"udzial w %"
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join typy_produktow tp
on pr.id_typu_produktu=tp.id_typu_produktu
group by tp.nazwa,pr.nazwa,pr.cena;