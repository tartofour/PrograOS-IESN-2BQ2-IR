#!/bin/bash

if [ $# -le 1 ]; then
    echo "Ce script doit prendre au moins un argument."
fi

while [ -n "$1" ]
do
    if [ $1 == "robert" ]; then
        echo "Bonjour Robert."
    elif [ $1 == "test" ]; then
        echo "Attention, ceci est un compte de test."
    elif [ $1 == "root" ]; then
        echo "Bienvenue administrateur."
    else
        echo "Erreur."
        exit 1
    fi
    shift
done
