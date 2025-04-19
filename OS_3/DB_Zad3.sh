#!/bin/bash

# Napravite sljedeću strukturu direktorija:
# touch OS3.md OS3.pdf
# mkdir screenshots && cd screenshots
# touch bash.png nano.png vim.png

# Napišite bash skriptu koja će proći kroz sve datoteke unutar direktorija screenshots i preimenovati ih na
# način da im doda prefix: screenshot_N_ gdje je N redni broj datoteke (npr. screenshot_1_bash.png ). Na
# kraju, skripta će ispisati sve preimenovane datoteke.

function reset() {	# Ove dvije funkcije sluze samo da se resetira na -prvobitno- stanje
			# Napisao sam ovo tako da .sh datoteka bude u istome direktoriju kao i screenshots folder
echo "Resetting..."

cd ./screenshots
rm -vr ./*
cd ..

}

function create() {

cd ./screenshots
touch bash.png nano.png vim.png
cd ..

echo "Reset complete, original files created."

}

scr_dir=./screenshots
n=1

for item in "$scr_dir"/*; do
	itemname="$(basename "$item")"
	newitem="screenshot_"$n"_"$itemname""
	mv ./screenshots/"$itemname" ./screenshots/"$newitem"
	(( n++ ))
done

echo "Preimenovanje gotovo:"
ls "$scr_dir"

reset
create
ls "$scr_dir"
