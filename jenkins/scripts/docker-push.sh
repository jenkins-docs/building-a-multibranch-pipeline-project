#!/bin/bash
echo "$DOCKERHUB_CREDENTIALS_PSW" | sudo docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin
#docker push USER/REPO
