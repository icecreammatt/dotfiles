#!/bin/bash
git clone https://github.com/icecreammatt/scripts.git ~/scripts
cd ~/scripts
./installScripts.sh
git remote set-url origin git@github.com:icecreammatt/scripts.git
