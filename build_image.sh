#!/bin/bash
podman build -t learn-k3s-app -f Containerfile --build-arg ARCH=linux/arm64/v8 --build-arg HTTP_PORT=80 .
