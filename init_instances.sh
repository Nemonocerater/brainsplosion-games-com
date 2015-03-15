#!/bin/sh

gcloud compute instances create www1 \
	--zone us-central1-f \
	--image centos-7 \
	--tags www-tag \
	--metadata-from-file startup-script=./www_startup.sh
