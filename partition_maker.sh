#!/bin/bash
startdate=20170731
enddate=20171231
d=0
n=0
until [ "$d" = "$enddate" ]
do
    d=$(date -d "$startdate + $n days" +%Y%m%d)
    e=$(date -d "$startdate + $(($n +1))  days" +%Y-%m-%d)
    echo "alter table [table_name]  add partition P$d values less than (TO_DATE(' $e 00:00:00', 'SYYYY-MM-DD
 HH24:MI:SS', 'NLS_CALENDAR=GREGORIAN'))  ;" 
    ((n++))
done
