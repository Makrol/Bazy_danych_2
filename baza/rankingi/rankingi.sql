--Ranking szeregujący typy produktów pod względem najchętniej kupowanych
select tp.nazwa nazwa_typu_produktu,count(*)suma_cen, Rank() over(order by count(*)desc)ranking
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join typy_produktow tp
on pr.id_typu_produktu=tp.id_typu_produktu
group by tp.nazwa;


--Ranking szeregujący pracowników pod względem pieniedzy które zarobili dla firmy sprzedając produkty
select pra.id_pracownika,pra.imie,pra.nazwisko,sum(pr.cena)suma_zysku,Rank() over(order by sum(pr.cena) desc)ranking
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join pracownicy pra
on pra.id_pracownika=sp.id_pracownika
group by pra.id_pracownika,pra.imie,pra.nazwisko;


--Ranking szeregujący województwa pod względem przychodów z sprzedaży w hurtowniach na ich terenie
select wo.nazwa,sum(pr.cena)suma_zysku,Rank() over(order by sum(pr.cena)desc)ranking
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join hurtownie hu
on hu.id_hurtowni=do.id_hurtowni
join miasta mi
on mi.id_miasta=hu.id_miasta
join wojewodztwa wo
on wo.id_wojewodztwa=mi.id_wojewodztwa
group by wo.nazwa;