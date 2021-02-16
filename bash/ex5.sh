#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Ce script doit prendre un argument"
fi

file=$1

if test -e "$file"; then
    echo "Le fichier $file existe"
fi
