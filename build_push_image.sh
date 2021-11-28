#!/bin/bash
podman build -t learn-k3s-app -f Containerfile --build-arg ARCH=linux/arm64/v8 --build-arg HTTP_PORT=80 .
podman tag localhost/learn-k3s-app:latest localhost:5000/learn-k3s-app:latest
podman push localhost:5000/learn-k3s-app:latest

