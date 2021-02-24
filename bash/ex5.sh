#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Ce script doit prendre un argument"
fi

file=$1

if [ -e "$file" ]; then
    echo "Le fichier $file existe"
fi
