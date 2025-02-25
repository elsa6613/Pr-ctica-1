#!/bin/bash

#Activitat 1

cut -d ',' -f 1-11,13-15 supervivents.csv > temps.csv

#Activitat 2

awk -F ',' '{if ($14 == "False") print $0}' temps.csv > error.csv

x=$(wc -l < error.csv)
y=$(wc -l < temps.csv)
z=$(($y - $x -1))
echo "$z"

#Activitat 3

awk -F ',' '{if ($8 < 1000000) print $0 ",Bo";
             else
                if ($8 <= 10000000) print $0 ",Excel·lent";
                else print $0 ",Estrella";}' error.csv > views.csv

#Activitat 4

while read -r linia; do
    views=$(echo "$linia" | cut -d ',' -f 8)
    likes=$(echo "$linia" | cut -d ',' -f 9)
    dislikes=$(echo "$linia" | cut -d ',' -f 10)

    if [ "$views" -ne 0 ]; then
        Rlikes=$(((likes*100)/views))
        Rdislikes=$(((dislikes*100)/views))
    else
        Rlikes=0
        Rdislikes=0
    fi
    echo "$linia,$Rlikes,$Rdislikes" >> likes.csv
done < views.csv

#Activitat 5

read -p "Introdueix el titol o l'identificador del video: " video

if [[ ! -f likes.csv ]]; then
    echo "L'arxiu sortida.csv no existeix"
    exit 1
fi

resultat=$(grep -i "$video" likes.csv)

if [[ -n "$resultat" ]];then
	while read -r linia; do	
      		Title=$(echo $linia | cut -d ',' -f 3) 
      		Publish_Time=$(echo $linia | cut -d ',' -f 6)
      		views=$(echo $linia | cut -d ',' -f 8)
      		likes=$(echo $linia | cut -d ',' -f 9)
      		dislikes=$(echo $linia | cut -d ',' -f 10)
      		Ranking_views=$(echo $linia | cut -d ',' -f 15)
      		Rlikes=$(echo $linia | cut -d ',' -f 16)
      		Rdislikes=$(echo $linia | cut -d ',' -f 17)
      		echo "$Title,$Publish_Time,$views,$likes,$dislikes,$Ranking_views,$Rlikes,$Rdislikes" >> final.csv
	done < likes.csv
else
      echo "No s'han trobat coincidències." > final.csv
fi
