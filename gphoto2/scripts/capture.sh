#! /usr/bin/env bash
export LANG=C 
gphoto() {

gphoto2 --debug --debug-logfile="$@"
}

gphoto "set-bulb.txt" set-config bulb=1
gphoto "wait.txt" wait-event 100s
gphoto "unset-bulb.txt" set-config bulb=0
gphoto "wait-and-dl.txt" wait-event-and-download=5s

