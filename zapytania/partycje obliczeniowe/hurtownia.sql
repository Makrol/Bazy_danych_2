--Partcja demonstrująca stosunek procentowy pieniędzy wydanych przez firmy w danej branży

select
    br.NAZWA"nazwa branzy",
    fk.NAZWA"nazwa firmy kupujacej",
    kwota,
    suma_kwot,
    udzial
from (
        select
            sp.ID_BRANZY br_id,
            sp.ID_FIRMY_KUPUJACEJ fk_id,
            sum(pr.CENA)kwota,
            sum(sum(pr.cena)) over( partition BY sp.ID_BRANZY)suma_kwot,
            Round(100*sum(pr.cena)/sum(sum(pr.cena)) over( partition BY sp.ID_BRANZY))udzial
        from HUR_SPRZEDAZ sp, HUR_PRODUKTY pr
        where sp.ID_PRODUKTU=pr.ID_PRODUKTU
        group by sp.ID_BRANZY, sp.ID_FIRMY_KUPUJACEJ
     ),
    HUR_BRANZE br, HUR_FIRMY_KUPUJACE fk
    where br.ID_BRANZY=br_id
    and fk.ID_FIRMY_KUPUJACEJ=fk_id;


--Partycja demonstrująca jaki wkład ma pracownik pracujący na danymstanowisku w przychodzy wygenerowane przez wszystkich pracowników na tym stanowisku

select
    st.NAZWA"nazwa_stanowiska",
    pra_id"id_pracownika",
    imie,
    nazwisko,
    suma1 "suma z sprzedazy produktow przez pracownika",
    suma2 "suma z sprzedazy produktow na danym stanowisku",
    udzial "udzial w %"
from (
        select
            sp.ID_STANOWISKA st_id,
            sp.ID_PRACOWNIKA pra_id,
            sum(pr.CENA)suma1,
            sum(sum(pr.cena)) over (PARTITION by sp.ID_STANOWISKA)suma2 ,
            Round(100*sum(pr.cena)/sum(sum(pr.cena)) over (PARTITION by sp.ID_STANOWISKA))udzial
        from
            HUR_SPRZEDAZ sp,HUR_PRODUKTY pr
            where sp.ID_PRODUKTU=pr.ID_PRODUKTU
            group by sp.ID_STANOWISKA, sp.ID_PRACOWNIKA
     ),
    HUR_STANOWISKA st,
    HUR_PRACOWNICY pra
    where st.ID_STANOWISKA=st_id
    and pra.ID_PRACOWNIKA=pra_id;


--Partycja demonstrująca stosunek sprzedanych produktów danego typu do wszystkich sprzedanych produktów tego typu
select
    tp.NAZWA"nazwa typu produktu",
    pr.NAZWA"nazwa produktu",
    count1 "suma ilosci sprzedanych produktow konkretnego typu",
    suma1 "suma wszystkich produktow danego typu",
    udzial "udzial w %"
from(
    select
        sp.ID_TYPU_PRODUKTU tp_id,
        sp.ID_PRODUKTU pr_id,
        count(*)count1,
        sum(count(*)) over (partition by sp.ID_TYPU_PRODUKTU)suma1,
        Round(100*count(*)/sum(count(*)) over (partition by sp.ID_TYPU_PRODUKTU))udzial
    from
        HUR_SPRZEDAZ sp
        group by sp.ID_TYPU_PRODUKTU, sp.ID_PRODUKTU
    ),
    HUR_TYPY_PRODUKTOW tp,HUR_PRODUKTY pr
    where tp.ID_TYPU_PRODUKTU=tp_id
    and pr.ID_PRODUKTU=pr_id;
