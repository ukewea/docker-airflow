#!/bin/bash

TAG_ARGS="-t wuuker/docker-airflow:latest -t wuuker/docker-airflow:2.1.2"

# Setup QEMU
sudo docker run --privileged --rm tonistiigi/binfmt --install all
sudo docker buildx create --name mybuilder --use

sudo docker buildx build --platform linux/amd64,linux/arm64 -t wuuker/python-talib:latest -t wuuker/python-ta-lib:latest .
sudo docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 -t wuuker/python-talib:latest -t wuuker/python-ta-lib:latest . --push

