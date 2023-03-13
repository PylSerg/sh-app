#!/bin/bash

trap "rm tempfile; echo -e '\n\n\n\033[01;41;37m Forced termination of testing! \n\n\n\033[00m'; exec /bin/bash" INT

sudo clear;
touch tempfile;

version="v1.1.0"

echo -e '\n\033[01;46;30m DISK SPEED TEST' $version '\033[00m \n';


## Array size (size in GB):
SIZES=(1 3 5 10)


## Custom size

read -p "Volume for testing in GB (or press ENTER to auto test): " customSize

if [ "$customSize" != "" ]; then
	SIZES=($customSize)
fi

clear;
echo -e '\n\033[01;46;30m DISK SPEED TEST' $version '\033[00m \n';

## Test

echo -e '\n\n\033[03;32m Start of testing... \033[00m';

for s in ${SIZES[@]}; do
	let "count=$s*1024"

	
	sync;

	echo -e '\n\n\n\033[01;45;37m Test -' $s 'GB \033[00m \n';

	echo -e '\033[01;34m Write speed: \033[00m'; dd if=/dev/zero of=tempfile bs=1M count=$count; 
	
	sync; 

	echo -e '\033[30m'; sudo /sbin/sysctl -w vm.drop_caches=3; echo -e '\033[00m';

	echo -e  '\033[01;34m Read speed: \033[00m'; dd if=tempfile of=/dev/null bs=1M count=$count;
done



## End of testing

rm tempfile;

echo -e '\n\n\n\033[03;32m End of testing \n\n\n\033[00m';

exec /bin/bash
