#!/bin/bash
sudo apt-get install sox libsox-fmt-mp3
sudo apt-get install python3-pip
sudo apt-get install python-setuptools
sudo apt-get install python3-setuptools
sudo apt-get install git
git clone https://github.com/desbma/GoogleSpeech
cd GoogleSpeech
python3 setup.py install

