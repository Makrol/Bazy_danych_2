--Ranking szeregujący typy produktów pod względem najchętniej kupowanych
select
    NAZWA"nazwa typu produktu",
    suma_cen,
    ranking
from (
        select
            sp.ID_TYPU_PRODUKTU tp_id,
            count(*)suma_cen,
            Rank() over(order by count(*)desc)ranking
        from
            HUR_SPRZEDAZ sp
            group by sp.ID_TYPU_PRODUKTU
     ),
    HUR_TYPY_PRODUKTOW tp
    where tp.ID_TYPU_PRODUKTU=tp_id;


--Ranking szeregujący pracowników pod względem pieniedzy które zarobili dla firmy sprzedając produkty
select
    pra.ID_PRACOWNIKA,
    pra.IMIE,
    pra.NAZWISKO,
    suma_zysku,
    ranking
from (
        select
            sp.ID_PRACOWNIKA pra_id,
            sum(pr.cena)suma_zysku,
            Rank() over(order by sum(pr.cena) desc)ranking
        from HUR_SPRZEDAZ sp,HUR_PRODUKTY pr
        where pr.ID_PRODUKTU=sp.ID_PRODUKTU
        group by sp.ID_PRACOWNIKA
     ),
    HUR_PRACOWNICY pra
    where pra.ID_PRACOWNIKA=pra_id;




--Ranking szeregujący województwa pod względem przychodów z sprzedaży w hurtowniach na ich terenie

select
    wo.NAZWA"nazwa wojewodztwa",
    suma_zysku,
    ranking
from (
        select
            sp.ID_WOJEWODZTWA wo_id,
            sum(pr.cena)suma_zysku,
            Rank() over(order by sum(pr.cena)desc)ranking
        from HUR_SPRZEDAZ sp,HUR_PRODUKTY pr
        where sp.ID_PRODUKTU=pr.ID_PRODUKTU
        group by sp.ID_WOJEWODZTWA
     ),
    HUR_WOJEWODZTWA wo
    where wo.ID_WOJEWODZTWA=wo_id;