#!/bin/bash

set -o errexit
set -o nounset

type="$1"
file="$2"

case "${type}" in
    ra81)
	ns=51
	nt=14
	nc=1248
	;;
    ra82)
	ns=57
	nt=15
	nc=1423
	;;
    ra92)
	ns=69
	nt=13
	nc=3279
	;;
    *)
	echo "$0: unknown type ${type}"
	exit 1
	;;
esac

nsectors=$((ns * nt * nc))
disk_size=$((nsectors * 512))

echo "ns=${ns}"
echo "nt=${nt}"
echo "nc=${nc}"
echo "#sectors=${nsectors}"
echo "disk_size=${disk_size}"

rm -f "${file}"
touch "${file}"
fallocate -z -l ${disk_size} "${file}"
	    
