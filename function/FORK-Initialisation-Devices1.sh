#!/bin/bash

# Creation fichier avec les Serials des devices
adb devices | grep -w device | cut -f 1 | sort > abc.txt

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

