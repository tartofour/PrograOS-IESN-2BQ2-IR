#!/bin/bash

logFolder="/var/log"

display_help() {
  echo "UTILISATION : $0 [OPTION]... [FICHIER]"
  echo "  Liste les fichiers logs présents dans le dossier $logFolder."
  echo "OPTIONS : "
  echo "  -a : Affiche le contenu de tous les fichiers log présents dans le dossier $logFolder."
  echo "  -l <fichier_log> : Affiche le contenu du fichier donné en argument."
  echo "  -h : Affiche le menu d'aide."
}

if [ $# -le 0 ]; then
  find $logFolder -name '*.log' 2> /dev/null
  exit 0
fi

while getopts "hal:" opt; do
  case ${opt} in
    h)
      display_help
      ;;
    a)
      logFiles=$(find $logFolder -name '*.log' 2> /dev/null)
      cat $logFiles
      ;;
    l)
      logFile=$OPTARG
      cat $logFile
      ;;
    \?)
      exit 1
      ;;
  esac
done

exit 0
