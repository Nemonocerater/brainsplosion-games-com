#!/bin/sh

git push origin master
./destroy_instance.sh
./init_instance.sh
