#!/bin/bash

AIRFLOW_VERSION=2.1.2

# Setup QEMU
sudo docker run --privileged --rm tonistiigi/binfmt --install all
sudo docker buildx create --name mybuilder --use

# OpenSSL has issue building armv6/v7 images
#sudo docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm/v6 -t wuuker/docker-airflow:latest -t wuuker/docker-airflow:$AIRFLOW_VERSION .
#sudo docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 -t wuuker/docker-airflow:latest -t wuuker/docker-airflow:$AIRFLOW_VERSION . --push

sudo docker buildx build --platform linux/amd64,linux/arm64 -t wuuker/docker-airflow:latest -t wuuker/docker-airflow:$AIRFLOW_VERSION .
