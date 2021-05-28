### build image
podman build -f ./Containerfile -t ilhammhdd/learn-k3s --build-arg ARCH=<ARCH_NAME> --build-arg HTTP_PORT=<HTTP_CONTAINER_PORT> --build-arg DOMAIN=<DOMAIN_NAME> .

### run container
podman run -it --name ilhammhdd_learn_k3s --rm --detach -p <HTTP_HOST_PORT>:<HTTP_CONTAINER_PORT> localhost/ilhammhdd/learn-k3s