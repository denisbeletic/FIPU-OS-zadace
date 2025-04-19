#!/bin/bash

# Napišite bash skriptu koja će primiti 1 argument: broj od 1 do 10.
# Skripta mora provjeriti je li argument unutar zadanog raspona, a ako nije, prekida s radom i ispisuje
# odgovarajuću poruku. Ako je argument unutar zadanog raspona, skripta izrađuje novu datoteku
# brojevi.txt u koju će pohraniti niz koji sadrži sve brojeve od 1 do zadanog broja.

br="$1"

if [[ "$br" -lt 1 || "$br" -gt 10 ]]; then
	echo "Niste odabrali broj u rasponu (1 - 10). Pokušajte ponovno."
	exit 1
else
	touch brojevi.txt
	for (( i=1; i<="$br"; i++ )); do
		echo "$i" >> brojevi.txt
	done
fi
