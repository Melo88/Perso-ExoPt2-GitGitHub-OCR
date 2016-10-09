#!/bin/bash

# Creation fichier avec les Serials des devices
adb devices | grep -w device | cut -f 1 | sort > abc.txt

Device1="XXX - Numero de Serie appareils"
Device2="XXX - Numero de Serie appareils"
Device3="XXX - Numero de Serie appareils"
Device4="XXX - Numero de Serie appareils"
Device5="XXX - Numero de Serie appareils"
end='FIN'

# Tableau[Array] pour la boucle for
tableau=($Device1 $Device2 $Device3 $Device4 $Device5 $end)
#echo ${tableau[*]}

Init_Function(){
		adb -s $DevicesX shell reboot -p
		echo "Device N°$DevicesX s'eteint..."
}

Multiple_Process(){
# Boucle for pour eteindre les devices contenu dans le tableau
for DevicesX in ${tableau[*]}
do
	if [ $DevicesX == "FIN" ]
	then
		echo "Devices eteints !!"
	else
		Init_Function &
	fi
done
}

Multiple_Process
