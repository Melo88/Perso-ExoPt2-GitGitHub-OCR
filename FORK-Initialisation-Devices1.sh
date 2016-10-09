#!/bin/bash

# Affichage des devices connectés avec adb
adb devices > DevicesForShutDown-One.txt

# Premier formatage pour recuperer une liste viable du type "n°Serie" seule
grep -w device DevicesForShutDown-One.txt > DevicesForShutDown-Two.txt

# Second formatage pour recuperer une liste viable du type "n°Serie" seule
cut -f 1 DevicesForShutDown-Two.txt > DevicesForShutDown-Three.txt

# Recuperation dans une variable de chacune des lignes du fichier "DevicesForShutDown-Three.txt" avec sed
Device1="XXX - Numero de Serie appareils"
Device2="XXX - Numero de Serie appareils"
Device3="XXX - Numero de Serie appareils"
Device4="XXX - Numero de Serie appareils"
Device5="XXX - Numero de Serie appareils"
end="FIN"

# Tableau[Array] pour la boucle for
tableau=($Device1 $Device2 $Device3 $Device4 $Device5 $end)
#echo ${tableau[*]}

Init_Function(){
#Welcome - Menu Langue
		adb -s $DevicesX shell input tap 666 666
		adb -s $DevicesX shell input swipe 888 888 666 666 100
		adb -s $DevicesX shell input tap 666 666
		adb -s $DevicesX shell input tap 666 666
}

Multiple_Process(){
# Boucle for pour eteindre les devices contenu dans le tableau
for DevicesX in ${tableau[*]}
do
	if [ $DevicesX == "FIN" ]
	then
		echo "Devices eteints !!"
	else
        # Fork faisant un new process grace a "&"
		Init_Function &
		sleep 1
	fi
done
}

Multiple_Process

