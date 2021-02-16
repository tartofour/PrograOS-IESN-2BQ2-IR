#!/bin/bash

while getopts "abc" opt; do
  case ${opt} in
    a)
      echo "a" 
      ;;
    b)
      echo "b"
      ;;
    c)
      echo "c"
      ;;
    \?)
      exit 1
      ;;
  esac
done

