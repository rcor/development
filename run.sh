#!/bin/bash

if [ "$( docker container inspect -f '{{.State.Status}}' development )" == "exited" ];
then
    docker start development
else 
    if [ "$( docker container inspect -f '{{.State.Running}}' development )" == "true" ];
    then
        echo "It is running"
    else 
        docker run -d -p 3000:3000 --name development rcor/term 
    fi 
fi 


#Only on MAC 
open -a "Google Chrome" http://localhost:3000/wetty/
