#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Ce script doit prendre au moins un argument."
    exit 1
fi

while [ -n "$1" ]
do
    case $1 in

    robert)
        echo "Bonjour Robert."
        ;;
    test)
        echo "Attention, ceci est un compte de test."
        ;;
    root)
        echo "Bienvenue administrateur."
        ;;
    *)
        echo "Erreur."
        exit 1
    esac

    shift
done
