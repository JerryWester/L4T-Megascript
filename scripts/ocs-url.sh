#!/bin/bash

clear
echo "ocs-url script started!"
echo 'This will allow you to actually USE that fancy "Install"'
echo "button on the Pling website and any of its derivatives."
sleep 3

cd ~
rm -rf ocs-url/
##using my fork temporarily until the original maintainer merges my changes to fix manual builds
git clone https://www.opencode.net/cobalt2727/ocs-url

cd ocs-url

##switch over to my commits
git checkout patch-1

./scripts/prepare

qmake PREFIX=/usr

make -j$(nproc)

sudo make install

cd ~
rm -rf ocs-url/

echo "Done!"

if [[ $DISPLAY ]]; then
        echo "Find a theme you like and install it - enjoy!"
        sleep 3
        
        #open up the default web browser
        xdg-open 'https://www.pling.com/browse/cat/381/ord/rating/'

else
        echo "Open up https://www.pling.com on your device"
        echo "and find a theme you like - enjoy!"
        sleep 4
fi
