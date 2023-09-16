#!/bin/bash

set -o errexit
set -o nounset

ncyl=3099
sec_per_cyl=$((73 * 13))
nsec=$((ncyl * sec_per_cyl))
disk_size=$((nsec * 512))

echo "ncyl=$ncyl"
echo "sec_per_cyl=$sec_per_cyl"
echo "nsec=$nsec"
echo "bytes=$disk_size"

rm -f "$1"
touch "$1"
fallocate -z -l ${disk_size} "$1"
	    
