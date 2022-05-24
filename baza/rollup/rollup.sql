--Rollup pokazujący sume dochodów z sprzedaży dla firm z konkretnych branż
select
    case when pr.NAZWA is null then 'suma zysku z branzy' else pr.NAZWA end nazwa_produktu,
    case when br.NAZWA is null then 'wszystkie branze' else br.NAZWA end nazwa_branzy,
    Suma
from (
    select
    pr.ID_PRODUKTU pr_id ,
    br.ID_BRANZY   br_id,
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
    rollup(br.ID_BRANZY,pr.ID_PRODUKTU)
    order by br.ID_BRANZY,pr.ID_PRODUKTU
     )
left join BRANZE br
on br.ID_BRANZY=br_id
left join PRODUKTY pr
on pr.ID_PRODUKTU=pr_id;

--Rollup pokazujący ilosc sprzedaży produktow w konkretnych województwach pomiwedzy rokiem 2012 a 2015
select  case when pr.nazwa is null then 'ilosc sprzedazy w wojewodztwie' else pr.nazwa end nazwa_produktu,
        case when wo.nazwa is null then 'wszystkie wojewodztwa' else wo.nazwa end nazwa_wojewodztwa,
        Ilosc
from(
        select
            pr.ID_PRODUKTU pr_id,
            wo.ID_WOJEWODZTWA wo_id,
        count(*)Ilosc
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
        where extract(year from DATA) between 2012 and 2015
        group by
        rollup (wo.ID_WOJEWODZTWA, pr.ID_PRODUKTU)
        order by wo.ID_WOJEWODZTWA,pr.ID_PRODUKTU
    )
left join PRODUKTY pr
on pr.ID_PRODUKTU=pr_id
left join WOJEWODZTWA wo
on wo.ID_WOJEWODZTWA=wo_id;




--Rollup pokazujący sume dochodów z sprzedaży na poszczególnych stanowiskach
select
    case when pr.nazwa is null then 'zysk na stanowisku' else pr.nazwa end nazwa_produktu,
    case when st.nazwa is null then 'wszystkie stanowiska' else st.nazwa end nazwa_stanowiska,
    Suma
from (
        select
            pr.ID_PRODUKTU pr_id,
            st.ID_STANOWISKA st_id,
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
        rollup (st.ID_STANOWISKA, pr.ID_PRODUKTU)
        order by st.ID_STANOWISKA, pr.ID_PRODUKTU
     )
left join PRODUKTY pr
on pr.ID_PRODUKTU=pr_id
left join STANOWISKA st
on st.ID_STANOWISKA=st_id;





