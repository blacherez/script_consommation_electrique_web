#!/bin/sh
. ./env.sh

. ./env_statique.sh
sh script_test.sh


. ./env_wp.sh
sh script_test.sh

. ./env_grav.sh
sh script_test.sh
