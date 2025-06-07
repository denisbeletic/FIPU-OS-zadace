#!/bin/bash

if ! [[ -e $2 ]]; then
	echo "2. argument nije valjana putanja do direktorija ili datoteke."
	exit 1
fi

path=$2

if [[ $# -ne 2 ]]; then
	echo "Netocan br. argumenata. Ocekivano: 2, proslijedeno: "$#""
	exit 1
elif [[ ${#1} -ne 9 ]]; then
	echo "Netocna duzina zapis dozvola. Treba biti u oktalnome zapisu (npr. rwxrw-r--) i sadrzavati 9 znakova."
	exit 1
fi	# ${#varijabla} vraca duljinu vrijednosti unutar varijable

perm=$1

vlasnik=${perm:0:3}	# substring sintaksa, varijabla:pocetni indeks, duljina substringa koji ce se vratiti nakon indexa (ukljucuje index)
grupa=${perm:3:3}
ostali=${perm:6:3}

vlasniknum=0
grupanum=0
ostalinum=0

for (( i=0; i<3; i++ )); do
	if [[ ${vlasnik:$i:1} = "r" ]]; then
		(( vlasniknum+=4 ))

	fi

	if [[ ${grupa:$i:1} = "r" ]]; then
		(( grupanum+=4 ))
	fi

	if [[ ${ostali:$i:1} = "r" ]]; then
		(( ostalinum+=4 ))

	fi

	

	if [[ ${vlasnik:$i:1} = "w" ]]; then
		(( vlasniknum+=2 ))

	fi

	if [[ ${grupa:$i:1} = "w" ]]; then
		(( grupanum+=2 ))
	fi

	if [[ ${ostali:$i:1} = "w" ]]; then
		(( ostalinum+=2 ))
	fi

	

	if [[ ${vlasnik:$i:1} = "x" ]]; then
		(( vlasniknum+=1 ))

	fi

	if [[ ${grupa:$i:1} = "x" ]]; then
		(( grupanum+=1 ))
	fi

	if [[ ${ostali:$i:1} = "x" ]]; then
		(( ostalinum+=1 ))
	fi
done

final=$vlasniknum$grupanum$ostalinum

chmod $final $path

echo "Uspjesno primjenjena dozvola - "$perm", oktalno: "$final" na putanji: "$path"."
exit 0
