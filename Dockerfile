FROM docker.io/library/debian:bookworm-slim AS builder
LABEL org.opencontainers.image.source https://github.com/raccoon00/nvim_dic

# Installing curl, tar and git
RUN apt update && \
    apt install --yes curl tar git

# Downloading prebuilt neovim binaries into /nvim
RUN curl -Lo /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz && \
    tar -xzf /tmp/nvim.tar.gz --directory /tmp && \
    mv /tmp/nvim-linux-x86_64 /nvim && \
    rm /tmp/nvim.tar.gz

# Copying config files into image
RUN mkdir -p /nvim/config/nvim/start
COPY ./config/init.lua /nvim/config/nvim/init.lua

# Packages can be installed by cloning their repos into
# /nvim/config/nvim/start directory
ENV VIM_PACK_DIR=/nvim/config/nvim/start

# Downloading and unpacking mini.nvim
RUN cd /tmp && \
    git clone https://github.com/echasnovski/mini.nvim && \
    cd mini.nvim && \
    git reset --hard 0e9d1f972a91acf5a0513319099ba41f7c09c30a && \
    mv /tmp/mini.nvim "$VIM_PACK_DIR/mini.nvim"
CMD ["/bin/sh"]

FROM scratch as final

COPY --from=builder /nvim /nvim

