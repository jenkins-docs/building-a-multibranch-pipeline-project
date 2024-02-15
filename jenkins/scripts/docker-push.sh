#!/usr/bin/env sh

echo "$DOCKERHUB_CREDENTIALS_PSW" | sudo docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin
sudo docker tag "test-image:$BUILD_ID" "goinnova/test-image:$BUILD_ID"
sudo docker push "goinnova/test-image:$BUILD_ID"
