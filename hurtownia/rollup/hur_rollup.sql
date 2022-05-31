--Rollup pokazujący sume dochodów z sprzedaży dla firm z konkretnych branż
select
    case when pr.NAZWA is null then 'suma zysku z branzy' else pr.NAZWA end nazwa_produktu,
    case when br.NAZWA is null then 'wszystkie branze' else br.NAZWA end nazwa_branzy,
    Suma
from (
    select
            sp.ID_PRODUKTU pr_id,
            sp.ID_BRANZY br_id,
            sum(CENA) Suma
        from hur_sprzedaz sp,HUR_PRODUKTY pr
        where pr.ID_PRODUKTU=sp.ID_PRODUKTU
        group by
        rollup(sp.ID_BRANZY,sp.ID_PRODUKTU)
        order by  sp.ID_BRANZY,sp.ID_PRODUKTU
     ),
    HUR_BRANZE br,
    HUR_PRODUKTY pr
    where  br.ID_BRANZY(+)=br_id
    and pr.ID_PRODUKTU(+)=pr_id;

--Rollup pokazujący ilosc sprzedaży produktow w konkretnych województwach pomiwedzy rokiem 2012 a 2015
select  case when pr.nazwa is null then 'ilosc sprzedazy w wojewodztwie' else pr.nazwa end nazwa_produktu,
        case when wo.nazwa is null then 'wszystkie wojewodztwa' else wo.nazwa end nazwa_wojewodztwa,
        Ilosc
from(
        select
            sp.ID_PRODUKTU pr_id,
            sp.ID_WOJEWODZTWA wo_id,
            count(*) Ilosc
        from HUR_SPRZEDAZ sp
        group by rollup (sp.ID_WOJEWODZTWA,sp.ID_PRODUKTU)
        order by sp.ID_WOJEWODZTWA,sp.ID_PRODUKTU
    ),
    HUR_PRODUKTY pr,
    HUR_WOJEWODZTWA wo
    where  pr.ID_PRODUKTU(+)=pr_id
    and wo.ID_WOJEWODZTWA(+)=wo_id;




--Rollup pokazujący sume dochodów z sprzedaży na poszczególnych stanowiskach
select
    case when pr.nazwa is null then 'zysk na stanowisku' else pr.nazwa end nazwa_produktu,
    case when st.nazwa is null then 'wszystkie stanowiska' else st.nazwa end nazwa_stanowiska,
    Suma
from (
         select
        sp.ID_PRODUKTU pr_id,
        sp.ID_STANOWISKA st_id,
        sum(cena)Suma
    from HUR_SPRZEDAZ sp,PRODUKTY pr
    where pr.ID_PRODUKTU=sp.ID_PRODUKTU
    group by
    rollup (sp.ID_STANOWISKA, sp.ID_PRODUKTU)
    order by sp.ID_STANOWISKA, sp.ID_PRODUKTU
     ),
    HUR_PRODUKTY pr,
    HUR_STANOWISKA st
    where pr.ID_PRODUKTU(+)=pr_id
    and st.ID_STANOWISKA(+)=st_id;





