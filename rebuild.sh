#!/bin/bash
#clear; seq 1 94 | sort -R | sparklines | lolcat
make clean
make
sudo make install
make clean