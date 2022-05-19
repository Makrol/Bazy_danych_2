select 
case when pr.nazwa is null then 'suma zysku w branzy' else pr.nazwa end nazwa_produktu,
case when br.nazwa is null then 'wszystkie branze'else br.nazwa end nazwa_branzy,
sum(pr.cena) Suma
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join firmy_kupujace fk
on fk.id_firmy_kupujacej=sp.id_firmy_kupujacej
join branze br
on br.id_branzy=fk.id_branzy
GROUP BY
rollup(br.nazwa,pr.nazwa)
order by br.nazwa,pr.nazwa;



select 
case when pr.nazwa is null then 'ilosc sprzedazy w wojewodztwie' else pr.nazwa end nazwa_produktu,
case when wo.nazwa is null then 'wszystkie wojewodztwa' else wo.nazwa end nazwa_wojewodztwa,
count(*)Suma
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
group by
rollup (wo.nazwa,pr.nazwa)
order by wo.nazwa,pr.nazwa;


select 
case when pr.nazwa is null then 'zysk na stanowisku' else pr.nazwa end nazwa_produktu,
case when st.nazwa is null then 'wszystkie stanowiska' else st.nazwa end nazwa_stanowiska,
sum(cena)Suma
from sprzedaze sp
join dostepnosci do
on sp.id_dostepnosci=do.id_dostepnosci
join produkty pr
on do.id_produktu=pr.id_produktu
join pracownicy pr
on pr.id_pracownika=sp.id_pracownika
join stanowiska st
on st.id_stanowiska=pr.id_stanowiska
group by
rollup (st.nazwa,pr.nazwa)
order by st.nazwa,pr.nazwa;


