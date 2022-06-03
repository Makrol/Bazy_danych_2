--Okno obrazujące przyrost pienieczy wraz z każdym zakupem w konkretnej hurtowni
select
    data,
    hu.NAZWA"nazwa hurtowni",
    cena,
    suma_cen
from (
        select
            to_date(concat(concat(to_char(sp.rok),to_char(sp.MIESIAC,'fm09')),to_char(sp.DZIEN,'fm09')),'yyyymmdd')data,
            sp.ID_HURTOWNI hu_id,
            pr.CENA cena,
            Sum(pr.CENA)over ( partition by sp.ID_HURTOWNI order by to_date(concat(concat(to_char(sp.rok),to_char(sp.MIESIAC,'fm09')),to_char(sp.DZIEN,'fm09')),'yyyymmdd')range between UNBOUNDED PRECEDING and current row)suma_cen
        from HUR_SPRZEDAZ sp,HUR_PRODUKTY pr
        where sp.ID_PRODUKTU=pr.ID_PRODUKTU
     ),
    HUR_HURTOWNIE hu
    where  hu.ID_HURTOWNI=hu_id;


--Okno obrazujące przyrost pieniecz generowanych przez pracowników konkretnych stanowisk z sprzedazy produktów
select
    st.NAZWA"nazwa_stanowiska",
    data,
    suma_cen
from(
        select
            sp.ID_STANOWISKA st_id,
            to_date(concat(concat(to_char(sp.rok),to_char(sp.MIESIAC,'fm09')),to_char(sp.DZIEN,'fm09')),'yyyymmdd')data,
            Sum(pr.cena) over(partition by sp.ID_STANOWISKA order by to_date(concat(concat(to_char(sp.rok),to_char(sp.MIESIAC,'fm09')),to_char(sp.DZIEN,'fm09')),'yyyymmdd') range between UNBOUNDED PRECEDING and current row)suma_cen
        from HUR_SPRZEDAZ sp, HUR_PRODUKTY pr
        where sp.ID_PRODUKTU=pr.ID_PRODUKTU
    ),
    HUR_STANOWISKA st
    where st.ID_STANOWISKA=st_id;



--Okno obrazujące przyrost środków z sprzedaży produktów w konkretnych województwach
select
    wo.NAZWA"nazwa wojewodztwa",
    data,
    suma_cen
from (
        select
            sp.ID_WOJEWODZTWA wo_id,
            to_date(concat(concat(to_char(sp.rok),to_char(sp.MIESIAC,'fm09')),to_char(sp.DZIEN,'fm09')),'yyyymmdd')data,
            Sum(pr.cena) over(partition by sp.ID_WOJEWODZTWA order by to_date(concat(concat(to_char(sp.rok),to_char(sp.MIESIAC,'fm09')),to_char(sp.DZIEN,'fm09')),'yyyymmdd') range between UNBOUNDED PRECEDING and current row)suma_cen
        from HUR_SPRZEDAZ sp, HUR_PRODUKTY pr
        where sp.ID_PRODUKTU=pr.ID_PRODUKTU
     ),
    HUR_WOJEWODZTWA wo
    where wo.ID_WOJEWODZTWA=wo_id;

