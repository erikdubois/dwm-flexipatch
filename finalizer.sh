#!/bin/bash

set -x

rm -rf ~/flexi
make clean
rm patches.h
make
sudo make install

mkdir ~/flexi
./flexipatch-finalizer.sh -r -o ~/flexi