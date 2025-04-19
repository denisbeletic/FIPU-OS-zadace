#!/bin/bash

# Napišite bash skriptu koja će primiti 1 argument: naziv direktorija. Skripta mora provjeriti nalazi li se
# direktorij u istom direktoriju kao i skripta. Ako se direktorij ne nalazi u istom direktoriju, prekida rad i
# ispisuje poruku da direktorij ne postoji.
# Ako postoji, skripta mora proći kroz sve datoteke unutar direktorija i komprimirati ih naredbom zip u
# jednu zip datoteku. Ime zip datoteke neka bude svi_zapisi.zip . Ako korisnik proslijedi više od jednog
# argumenta, skripta mora prekinuti rad i ispisati poruku da je potrebno proslijediti samo jedan argument.

dir_name="$1"
if [[ "$#" -ne 1 ]]; then
	echo "Ocekivani broj argumenta: 1, uneseni broj argumenta: "$#"."
	exit 1

elif [[ "$dir_name" == "$(pwd)" ]]; then
	zip -r "svi_zapisi.zip" .
	echo "Zippanje uspjeno."
	exit 0
else
	echo "Direktorij ne postoji."
	exit 1
fi
