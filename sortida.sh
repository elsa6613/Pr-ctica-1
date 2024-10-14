#!/bin/bash

#Activitat 1

cut -d ',' -f 1-11,13-15 supervivents.csv > temps.csv

#Activitat 2

awk -F ',' '{if ($14 == "False") print $0}' temps.csv > error.csv

x=$(wc -l < error.csv) 
y=$(wc -l < temps.csv) 
z=$(($y - $x)) 
echo $z

#Activitat 3

awk -F ',' '{if ($8 < 1000000) print $0 ",Bo";
             else
                if ($8 <= 10000000) print $0 ",Excel·lent";
                else print $0 ",Estrella";}' error.csv > views.csv

#Activitat 4

while read -r linia; do
    views=$(echo $linia | cut -d ',' -f 8)
    likes=$(echo $linia | cut -d ',' -f 9)
    dislikes=$(echo $linia | cut -d ',' -f 10)

    if [ views != 0 ]; then
        Rlikes=$(((likes*100)/views))
        Rdislikes=$(((dislikes*100)/views))
    else
        Rlikes=0
        Rdislikes=0
    fi
    echo "$linia,$Rlikes,$Rdislikes" >> likes.csv
done < views.csv

#Activitat 5

if [[ ! -f sortida.csv]]; then
    echo "L'arxiu sortida.csv no existeix"
    exit 1
fi

read -p "Introdueix el titol o l'identificador del video: " video

resultat=$(grep -i video sortida.csv)

if [ -n "$resultat" ];then
      echo '$3,$6,$8,$9,$10,$15,$16,$17' > final.csv
else
      echo "No s'han trobat coincidències." > final.csv
