#!/bin/bash

python mooc.py "$@" -d "/video"
name=$(ls -t1 /video | head -1)
cd "/video/${name}/Videos" || exit
aria2c -i "/video/${name}/Videos/Videos.txt"
