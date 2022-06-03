--Partcja demonstrująca stosunek procentowy pieniędzy wydanych przez firmy w danej branży

select
    br.NAZWA"nazwa branzy",
    fk.NAZWA"nazwa firmy kupujacej",
    kwota,
    suma_kwot,
    udzial
from (
    select br.ID_BRANZY br_id,
       fk.ID_FIRMY_KUPUJACEJ fk_id,
       sum(pr.cena)kwota,
       sum(sum(pr.cena)) over( partition BY br.ID_BRANZY)suma_kwot,
       Round(100*sum(pr.cena)/sum(sum(pr.cena)) over( partition BY br.ID_BRANZY))udzial
    from sprzedaze sp
    join dostepnosci do
    on sp.id_dostepnosci=do.id_dostepnosci
    join produkty pr
    on do.id_produktu=pr.id_produktu
    join firmy_kupujace fk
    on fk.id_firmy_kupujacej=sp.id_firmy_kupujacej
    join branze br
    on br.id_branzy=fk.id_branzy
    group by br.ID_BRANZY, fk.ID_FIRMY_KUPUJACEJ
     )
left join BRANZE br
on br.ID_BRANZY = br_id
join FIRMY_KUPUJACE fk
on fk.ID_FIRMY_KUPUJACEJ = fk_id;





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
            st.ID_STANOWISKA st_id,
            pra.id_pracownika pra_id,
        sum(pr.cena)suma1,
        sum(sum(pr.cena)) over (PARTITION by st.ID_STANOWISKA)suma2 ,
        Round(100*sum(pr.cena)/sum(sum(pr.cena)) over (PARTITION by st.ID_STANOWISKA))udzial
        from sprzedaze sp
        join dostepnosci do
        on sp.id_dostepnosci=do.id_dostepnosci
        join produkty pr
        on do.id_produktu=pr.id_produktu
        join pracownicy pra
        on pra.id_pracownika=sp.id_pracownika
        join stanowiska st
        on st.id_stanowiska=pra.id_stanowiska
        group by st.ID_STANOWISKA,pra.id_pracownika
     )
join STANOWISKA st
on st.ID_STANOWISKA=st_id
join PRACOWNICY pra
on pra.ID_PRACOWNIKA = pra_id;


--Partycja demonstrująca stosunek sprzedanych produktów danego typu do wszystkich sprzedanych produktów tego typu
select
    tp.NAZWA"nazwa typu produktu",
    pr.NAZWA"nazwa produktu",
    count1 "suma ilosci sprzedanych produktow konkretnego typu",
    suma1 "suma wszystkich produktow danego typu",
    udzial "udzial w %"
from(
    select
        tp.ID_TYPU_PRODUKTU tp_id,
        pr.ID_PRODUKTU pr_id,
        count(*)count1,
        sum(count(*)) over (partition by tp.ID_TYPU_PRODUKTU)suma1,
        Round(100*count(*)/sum(count(*)) over (partition by tp.ID_TYPU_PRODUKTU))udzial
    from sprzedaze sp
    join dostepnosci do
    on sp.id_dostepnosci=do.id_dostepnosci
    join produkty pr
    on do.id_produktu=pr.id_produktu
    join typy_produktow tp
    on pr.id_typu_produktu=tp.id_typu_produktu
    group by tp.ID_TYPU_PRODUKTU, pr.ID_PRODUKTU
    )
join TYPY_PRODUKTOW tp
on tp.ID_TYPU_PRODUKTU=tp_id
join PRODUKTY pr
on pr.ID_PRODUKTU = pr_id;
