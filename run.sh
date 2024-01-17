#!/usr/bin/env bash

docker build -t sample-app .
docker run -d -p 3000:80 sample-app