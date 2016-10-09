#!/bin/bash

# Optimisation fort possible / 3 commandes use / Peut etre une seule peut faire la meme chose "GREP | CUT | SED"

# Affichage des devices connectés avec adb
adb devices > DevicesForShutDown-One.txt

# Premier formatage pour recuperer une liste viable du type "n°Serie" seule
grep -w device DevicesForShutDown-One.txt > DevicesForShutDown-Two.txt
#grep -n -v -A 15 'List of devices attached' DevicesForShutDown.txt

# Second formatage pour recuperer une liste viable du type "n°Serie" seule
cut -f 1 DevicesForShutDown-Two.txt > DevicesForShutDown-Three.txt

Device1="XXX - Numero de Serie appareils"
Device2="XXX - Numero de Serie appareils"
Device3="XXX - Numero de Serie appareils"
Device4="XXX - Numero de Serie appareils"
Device5="XXX - Numero de Serie appareils"
end='null'

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
