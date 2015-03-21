#!/bin/sh

gcloud compute instances create www1 \
	--zone us-central1-f \
	--address address-www1 \
	--machine-type n1-standard-1 \
	--image centos-7 \
	--tags www-tag \
	--metadata-from-file startup-script=www_startup.sh
