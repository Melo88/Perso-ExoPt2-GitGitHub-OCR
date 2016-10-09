#!/bin/bash

SerialForDevices(){

adb devices | grep -w device | cut -f 1 | sort > abc.txt

Device1="XXX - Numero de Serie appareils"
Device2="XXX - Numero de Serie appareils"
Device3="XXX - Numero de Serie appareils"
Device4="XXX - Numero de Serie appareils"
Device5="XXX - Numero de Serie appareils"
end="FIN"

# Tableau[Array] pour la boucle for
tableau=($Device1 $Device2 $Device3 $Device4 $Device5 $end)
#echo ${tableau[*]}

}

SerialForDevices

echo -e 'Menu :\n
	(1) : Initialisation01
Mot de passe :
	(2) First Network | (3) Second Network
Divers :
	(4) : Wake
    (O) : Exit
read -p 'Tapez le nombre voulu (0-8 | 10-13) : ' chiffre

case $chiffre in
	"0")
		exit
	;;
		
	"1")
        SerialForDevices
        
		Init_Function(){
			#Welcome - Menu Langue
			adb -s $DevicesX shell input keyevent 69
			adb -s $DevicesX shell input tap 666 666
			adb -s $DevicesX shell input swipe 888 8888 666 6666 75
		}

		Multiple_Process(){
		# Boucle for pour eteindre les devices contenu dans le tableau
		for DevicesX in ${tableau[*]}
		do
			if [ $DevicesX = end ]
				then
					echo "Init01 OK !!"
					./run.sh
				else
					Init_Function &
			fi
		done
		}

		Multiple_Process
	;;
	
	"2")
        mdpFirstNetwork="12345"
        
        SerialForDevices

		Init_Function(){
			adb -s $DevicesX shell input text $mdpFirstNetwork
			adb -s $DevicesX shell input tap 666 666
		}

		Multiple_Process(){
		# Boucle for pour le mot de passe reseau des devices contenu dans le tableau
		for DevicesX in ${tableau[*]}
		do
			if [ $DevicesX = end ]
				then
					echo "First Network OK !!"
					./run.sh
				else
					Init_Function &
			fi
		done
		}

		Multiple_Process
	;;
	
	"3")
        mdpSecondNetwork="54321"
        
		SerialForDevices
		
		Init_Function(){
			adb -s $DevicesX shell input text $mdpSecondNetwork
			adb -s $DevicesX shell input tap 666 666
		}
		
		Multiple_Process(){
			# Boucle for pour eteindre les devices contenu dans le tableau
			for DevicesX in ${tableau[*]}
			do
				if [ $DevicesX = "end" ]
					then
						echo "Second Network OK !!"
						./run.sh
					else
						Init_Function &
				fi
			done
		}
		
		Multiple_Process
	;;
    
    "4")
        #ETC, ETC, ...
    ;;
	
	*)
		echo vous avez rentré une mauvaise valeur !!
		./run.sh
	;;
esac
