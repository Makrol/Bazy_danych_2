--Okno obrazujące przyrost pienieczy wraz z każdym zakupem w konkretnej hurtowni
select sp.data,hu.nazwa,pr.cena,Sum(pr.cena) over(partition by hu.nazwa order by data range between UNBOUNDED PRECEDING and current row)suma_cen 
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join hurtownie hu
on hu.id_hurtowni=do.id_hurtowni; 

--Okno obrazujące przyrost pieniecz generowanych przez pracowników konkretnych stanowisk z sprzedazy produktów
select st.nazwa,data,Sum(pr.cena) over(partition by st.nazwa order by data range between UNBOUNDED PRECEDING and current row)suma_cen  
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join pracownicy pr
on pr.id_pracownika=sp.id_pracownika
join stanowiska st
on st.id_stanowiska=pr.id_stanowiska


--Okno obrazujące przyrost środków z sprzedaży produktów w konkretnych województwach
select wo.nazwa,data,Sum(pr.cena) over(partition by wo.nazwa order by data range between UNBOUNDED PRECEDING and current row)suma_cen 
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