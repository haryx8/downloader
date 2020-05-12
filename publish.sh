#!/bin/bash
git pull
git commit -m "$1 $2" -m "$1 $2 from $(hostname) at $(date +"%d-%m-%y %H:%I:%S")" $2
git push origin master
