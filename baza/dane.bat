set login=system
set password=12345
sqlldr %login%/%password% control='kontrolery\Modele.ctl'
sqlldr %login%/%password% control='kontrolery\Marki.ctl'
sqlldr %login%/%password% control='kontrolery\Dostawcy.ctl'
sqlldr %login%/%password% control='kontrolery\Wojewodztwa.ctl'
sqlldr %login%/%password% control='kontrolery\Ulice.ctl'
sqlldr %login%/%password% control='kontrolery\Stanowiska.ctl'
sqlldr %login%/%password% control='kontrolery\Branze.ctl'
sqlldr %login%/%password% control='kontrolery\Przyczyny_zwrotow.ctl'
sqlldr %login%/%password% control='kontrolery\Typy_produktow.ctl'
sqlldr %login%/%password% control='kontrolery\Produkty.ctl'
sqlldr %login%/%password% control='kontrolery\Miasta.ctl'
sqlldr %login%/%password% control='kontrolery\Hurtownie.ctl'
sqlldr %login%/%password% control='kontrolery\Dostepnosci.ctl'
sqlldr %login%/%password% control='kontrolery\Promocje.ctl'
sqlldr %login%/%password% control='kontrolery\Dostawy.ctl'
sqlldr %login%/%password% control='kontrolery\Pojazdy.ctl'
sqlldr %login%/%password% control='kontrolery\Pracownicy.ctl'
sqlldr %login%/%password% control='kontrolery\Firmy_kupujace.ctl'
sqlldr %login%/%password% control='kontrolery\Sprzedaze.ctl'
sqlldr %login%/%password% control='kontrolery\Zwroty.ctl'
del *.bad
del *.log
pause