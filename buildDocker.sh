#!/bin/bash

if [ "$1" == "" ] || [ $# -gt 1 ]; then
	echo "Creating the minio-test-server docker image locally"
	docker build --tag eu.gcr.io/pagero-build/minio-test-server:1.0 .
elif [ "$1" == "--push" ]; then
	echo "Creating the minio-test-server and pushing to eu.gcr.io/pagero-build"
	docker build --tag eu.gcr.io/pagero-build/minio-test-server:1.0 .
	docker push eu.gcr.io/pagero-build/minio-test-server:1.0
else
	echo "usage buildDocker [options]"
	echo "Options:"
	echo "	--push	push the local build image to cloud"
fi




#docker build --tag eu.gcr.io/pagero-build/minio-test-server:1.0 .
