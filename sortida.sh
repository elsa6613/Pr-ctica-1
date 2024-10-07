#!/bin/bash

cut -d ',' -f 1-11,13-15 supervivents.csv > temps.csv

awk -F ',' '{if ($14 == "False") print $0}' temps.csv > error.csv

x=$(wc -l < error.csv) 
y=$(wc -l < temps.csv) 
z=$(($y - $x)) 
echo $z


awk -F ',' '{if ($8 < 1000000) print $0 ",Bo";
             else
                if ($8 <= 10000000) print $0 ",Excel·lent";
                else print $0 ",Estrella";}' error.csv > views.csv


while [[]]
   cut -d ',' '($9*100)/$8 echo $16'
done

while[[]]
   cut -d ',' '($10*100)/$8 echo $17'
done 
   
