#!/bin/bash

podman build --tag nvim --target builder . && \
podman create -i --name nvim nvim && \
podman start nvim && \
podman exec -it nvim /bin/sh && \
podman stop --all && \
podman rm nvim

