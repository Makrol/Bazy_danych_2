--Okno obrazujące przyrost pienieczy wraz z każdym zakupem w konkretnej hurtowni
select
    data,
    hu.NAZWA"nazwa hurtowni",
    cena,
    suma_cen
from (
        select
            sp.data data,
            hu.ID_HURTOWNI hu_id,
            pr.cena cena,
            Sum(pr.cena) over(partition by hu.ID_HURTOWNI order by data range between UNBOUNDED PRECEDING and current row)suma_cen
        from sprzedaze sp
        join dostepnosci do
        on sp.id_dostepnosci=do.id_dostepnosci
        join produkty pr
        on do.id_produktu=pr.id_produktu
        join hurtownie hu
        on hu.id_hurtowni=do.id_hurtowni
     )
join HURTOWNIE hu
on hu.ID_HURTOWNI=hu_id;

--Okno obrazujące przyrost pieniecz generowanych przez pracowników konkretnych stanowisk z sprzedazy produktów

select
    st.NAZWA"nazwa stanowiska",
    data,
    suma_cen
from(
        select
            st.ID_STANOWISKA st_id,
            data data,
            Sum(pr.cena) over(partition by st.ID_STANOWISKA order by data range between UNBOUNDED PRECEDING and current row)suma_cen
        from sprzedaze sp
        join dostepnosci do
        on sp.id_dostepnosci=do.id_dostepnosci
        join produkty pr
        on do.id_produktu=pr.id_produktu
        join pracownicy pr
        on pr.id_pracownika=sp.id_pracownika
        join stanowiska st
        on st.id_stanowiska=pr.id_stanowiska
    )
join STANOWISKA st
on st.ID_STANOWISKA = st_id;




--Okno obrazujące przyrost środków z sprzedaży produktów w konkretnych województwach
select
    wo.NAZWA"nazwa wojewodztwa",
    data,
    suma_cen
from (
        select
            wo.ID_WOJEWODZTWA wo_id,
            data data,
            Sum(pr.cena) over(partition by wo.ID_WOJEWODZTWA order by data range between UNBOUNDED PRECEDING and current row)suma_cen
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
     )
join WOJEWODZTWA wo
on wo.ID_WOJEWODZTWA = wo_id;

