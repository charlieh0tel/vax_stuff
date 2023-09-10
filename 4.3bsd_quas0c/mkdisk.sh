#!/bin/bash

ncyl=3099
sec_per_cyl=$((73 * 13))
disk_size=$((ncyl * sec_per_cyl * 512))

rm -f quas.ra92
touch quas.ra92
fallocate -z -l ${disk_size} quas.ra92
	    
