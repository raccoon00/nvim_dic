# Neovim for development in containers

## About

This container is a minimalistic environment for running [Neovim](https://github.com/neovim/neovim). 
It is based on [mini.nvim](https://github.com/echasnovski/mini.nvim) package. 
For configuring your neovim edit ``config/init.lua``. It already enables ``mini.completions`` and configures ``ruff`` and ``pyright`` language servers. 

## Requirements

 - ``podman`` on the host
 - ``nvim_dic`` images won't work on ``musl`` systems, so it will not work on base *alpine* linux.

## Usage

In your ``Dockerfile``:

```dockerfile
COPY --from=ghcr.io/raccoon00/nvim_dic:11.3 /nvim /nvim
```

In the container's shell run

```sh
# XDG_CONFIG_HOME=/nvim/config /nvim/bin/nvim [YOURFILE/DIRECTORY]
```

## Testing your changes

Run the ``dev_nvim.sh`` script for quick testing of changes in this ``Dockerfile`` or in ``config/init.lua``

