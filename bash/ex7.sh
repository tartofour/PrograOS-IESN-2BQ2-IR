#!/bin/bash

root_uid=0 
delim=','
filename=${@: -1}

display_help() {
  echo "UTILISATION : $0 [OPTIONS]... FICHIER" 
  echo "  Crée des comptes utilisateurs via une liste fournie en paramètre."
  echo "FORMAT DU FICHIER : "
  echo "  username,password"
  echo "OPTIONS : "
  echo "  -o : ??"
  echo "  -s <delimiter> : Assigne un nouveau séparateur."
  echo "  -h : Affiche le menu d'aide."
}

while getopts "hos:" opt; do
  case ${opt} in
    h)  
      display_help
      exit 0
      ;;  
    o)  
      echo "???" 
      ;;  
    s)  
      delim=$OPTARG
      ;;  
    \?) 
      exit 1
      ;;  
  esac
done

if [ "$UID" -ne "$root_uid" ]; then
  echo "Les droits root sont nécessaires pour exécuter ce script."
  exit 87
fi

if [ ! -e $filename ]; then
    echo "Le fichier $filename n'existe pas."
    exit 1
fi

while IFS=$delim read username password; do 
    useradd $username -p $password -d /home/$username -m 

done < $filename
