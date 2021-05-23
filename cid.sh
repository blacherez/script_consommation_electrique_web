#!/bin/sh
. ./env.sh

sudo cgcreate -g perf_event:apache
sudo cgcreate -g perf_event:mysql
sudo cgclassify -g perf_event:apache $(pidof apache2)
sudo cgclassify -g perf_event:mysql $(pidof mysqld)


. ./env_statique.sh
sh script_test.sh


. ./env_wp.sh
sh script_test.sh

. ./env_grav.sh
sh script_test.sh

. ./env_statique2.sh
sh script_test.sh
