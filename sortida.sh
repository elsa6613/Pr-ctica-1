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

{
while [[cut -d ',' read -r '$8 $9 $10' ]]
    if [ '$8' != 0 ]; then
        Rlikes='($9*100)/$8 echo $16'
        Rdislikes='($10*100)/$8 echo $17'
    else
        Rlikes=0
        Rdislikes=0
    fi
}views.csv > likes.csv

#Activitat 5
read -p "Introdueix el titol o l'identificador del video: " video

if (grep -w video
      echo '$3 $6 $8 $9 $10 $15 $16 $17'
else
      echo "No s'han trobat coincidencies"
