#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Ce script doit prendre trois arguments."
fi

if [ $1 != "a" ] || [ $2 != "b" ] || [ $3 != "c" ]; then
    echo "Erreur."
    exit 1
fi  

echo "Ok."


