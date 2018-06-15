#!/bin/bash

cd /home/manish/bin/

# use a counter to restart the process in case it fails or exits
counter=1

while [ $counter -le 11 ]
do
    miner_session="ethminer_$counter" 
    tmux new -s $miner_session "./startminer"
    ((counter++))
done

echo Counter exhausted
