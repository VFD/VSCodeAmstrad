@ECHO OFF

ECHO config 1 : %1
ECHO config 2 : %2
CD ManageDsk

#ManageDsk -C -S%1\dsk\%2.dsk
ECHO Create:

echo ManageDsk -LDisquette_Vide.dsk -A%1\%2.bas -I%1/%2.bas/BAS/368 -S%1\dsk\%2.dsk

ManageDsk -LDisquette_Vide.dsk  -A%1\%2.bas -I%1/%2.bas/BAS/368 -S%1\dsk\%2.dsk

::ManageDsk -L%1/dsk/%2.dsk -A%1/*.bas -s%1/dsk/%2.dsk

dir %1\dsk\*.*

CD ..

