#!/bin/bash

trap "rm tempfile; echo -e '\n\n\n\033[01;41;37m Forced termination of testing! \n\n\n\033[00m'; exec /bin/bash" SIGINT

sudo clear;

echo -e '\n\033[01;46;30m DISK SPEED TESTING \033[00m \n';

echo -e '\033[03;032m Start of testing... \033[00m';

touch tempfile;

sync;

echo -e '\n\n\n\033[01;45;37m Test - 1 GB \033[00m \n';

echo -e '\033[01;34m Write speed: \033[00m'; dd if=/dev/zero of=tempfile bs=1M count=1024; sync; 

echo -e '\033[30m'; sudo /sbin/sysctl -w vm.drop_caches=3; echo -e '\033[00m';

echo -e  '\033[01;34m Read speed: \033[00m'; dd if=tempfile of=/dev/null bs=1M count=1024;

sync;

echo -e '\n\n\n\n\n\033[01;45;37m Test - 3 GB \033[00m \n';

echo -e '\033[01;34m Write speed: \033[00m'; dd if=/dev/zero of=tempfile bs=1M count=3072; sync; 

echo -e '\033[30m'; sudo /sbin/sysctl -w vm.drop_caches=3; echo -e '\033[00m';

echo -e  '\033[01;34m Read speed: \033[00m'; dd if=tempfile of=/dev/null bs=1M count=3072;

sync;

echo -e '\n\n\n\n\n\033[01;45;37m Test - 5 GB \033[00m \n';

echo -e '\033[01;34m Write speed: \033[00m'; dd if=/dev/zero of=tempfile bs=1M count=5120; sync; 

echo -e '\033[30m'; sudo /sbin/sysctl -w vm.drop_caches=3; echo -e '\033[00m';

echo -e  '\033[01;34m Read speed: \033[00m'; dd if=tempfile of=/dev/null bs=1M count=5120;

sync;

echo -e '\n\n\n\n\n\033[01;45;37m Test - 10 GB \033[00m \n';

echo -e '\033[01;34m Write speed: \033[00m'; dd if=/dev/zero of=tempfile bs=1M count=10240; sync; 

echo -e '\033[30m'; sudo /sbin/sysctl -w vm.drop_caches=3; echo -e '\033[00m';

echo -e  '\033[01;34m Read speed: \033[00m'; dd if=tempfile of=/dev/null bs=1M count=10240;

rm tempfile;

echo -e '\n\n\n\033[03;031m End of testing \n\n\n\033[00m';

exec /bin/bash
