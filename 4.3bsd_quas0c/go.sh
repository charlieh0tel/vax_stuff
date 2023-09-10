#!/bin/bash

set -o errexit
set -o nounset

rm -f quas.ra92
./mkdisk.sh

./00_install.expect
cp -p quas.ra92 quas.ra92.post00

./01_install.expect
cp -p quas.ra92 quas.ra92.post01
