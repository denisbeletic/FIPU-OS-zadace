#!/bin/bash

# Skripta mora proći kroz sve datoteke u direktoriju i ispisati samo one datoteke koje imaju zadani nastavak.
# Ako ne postoji nijedna datoteka s tim nastavkom, skripta mora ispisati poruku da nema takvih datoteka.
# U ispisu moraju biti uključene samo datoteke i to njihovi nazivi bez korijenskih direktorija (apsolutnih
# putanja). Ako korisnik ne proslijedi točno 2 argumenta, prekinite rad skripte i ispišite poruku da je potrebno
# proslijediti točno 2 argumenta.


abs_dir=$1
dat_ext=$2

if [[ "$#" -ne 2 ]]; then
	echo "Netočan broj argumenata ("$#"), očekivani broj: 2"
	exit 1
fi

echo "Putanja: "$abs_dir""
echo "Datotecna ekstenzija: "$dat_ext""

check=1

if [[ -d "$abs_dir" ]]; then				# ako direktorij postoji, onda...
	echo "Direktorij pronaden. Trazim datoteke..."
	for item in "$abs_dir"/*; do
		if [[ -f "$item" ]]; then		# ako bilo kakva datoteka postoji, onda...
			item="$(basename "$item")"
			if [[ "$item" == *"$dat_ext" ]]; then
				check=0
				echo "$item"
			fi
		fi
	done
	if [[ "$check" -ne 0 ]]; then
		echo "Nema datoteka s navedenom ekstenzijom."
		exit 1
	fi
else
	echo "Direktorij ne postoji."
	exit 1
fi
