--Ranking szeregujący typy produktów pod względem najchętniej kupowanych
select
    NAZWA"nazwa typu produktu",
    suma_cen,
    ranking
from (
        select
            tp.ID_TYPU_PRODUKTU tp_id,
            count(*)suma_cen,
            Rank() over(order by count(*)desc)ranking
        from sprzedaze sp
        join dostepnosci do
        on sp.id_dostepnosci=do.id_dostepnosci
        join produkty pr
        on do.id_produktu=pr.id_produktu
        join typy_produktow tp
        on pr.id_typu_produktu=tp.id_typu_produktu
        group by tp.ID_TYPU_PRODUKTU
     )
join TYPY_PRODUKTOW tp
on tp.ID_TYPU_PRODUKTU=tp_id;


--Ranking szeregujący pracowników pod względem pieniedzy które zarobili dla firmy sprzedając produkty
select
    pra.ID_PRACOWNIKA,
    pra.IMIE,
    pra.NAZWISKO,
    suma_zysku,
    ranking
from (
        select
            pra.id_pracownika pra_id,
            sum(pr.cena)suma_zysku,
            Rank() over(order by sum(pr.cena) desc)ranking
        from sprzedaze sp
        join dostepnosci do
        on sp.id_dostepnosci=do.id_dostepnosci
        join produkty pr
        on do.id_produktu=pr.id_produktu
        join pracownicy pra
        on pra.id_pracownika=sp.id_pracownika
        group by pra.id_pracownika
     )
join PRACOWNICY pra
on pra.ID_PRACOWNIKA = pra_id;



--Ranking szeregujący województwa pod względem przychodów z sprzedaży w hurtowniach na ich terenie

select
    wo.NAZWA"nazwa wojewodztwa",
    suma_zysku,
    ranking
from (
        select
            wo.ID_WOJEWODZTWA wo_id,
            sum(pr.cena)suma_zysku,
            Rank() over(order by sum(pr.cena)desc)ranking
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
        group by wo.ID_WOJEWODZTWA
     )
join WOJEWODZTWA wo
on wo.ID_WOJEWODZTWA=wo_id;