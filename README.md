# Neovim for development in containers

## About

This container is a minimalistic environment for running [Neovim](https://github.com/neovim/neovim). 
It is based on [mini.nvim](https://github.com/echasnovski/mini.nvim) package. 
For configuring your neovim edit ``config/init.lua``. It already enables ``mini.completions`` and configures ``ruff`` and ``pyright`` language servers. 

## Requirements

 - ``podman`` on the host. You should **not** use ``docker``, because it uses root access to run its containers and building this image downloads 3rd party binaries and code, that can potentially be malicious.
 - ``nvim_dic`` images won't work on ``musl`` systems, so it will not work on base *alpine* linux.

## Usage

In your ``Dockerfile``:

```dockerfile
COPY --from=ghcr.io/raccoon00/nvim_dic:11.3 /nvim /nvim
```

In the container's shell run

```sh
XDG_CONFIG_HOME=/nvim/config /nvim/bin/nvim [YOURFILE/DIRECTORY]
```

## Customizing your Neovim

Change ``config/init.lua`` file. 
Use [mini.nvim](https://github.com/echasnovski/mini.nvim) documentation for customizing the behavior of its plugins.
You can add your plugins the same way as mini.nvim was added, check the ``Dockerfile`` to see how.

Run the ``dev_nvim.sh`` script for quick testing of changes in this ``Dockerfile`` or in ``config/init.lua``

The usage of any plugin managers is not recommended, because of potential security risks for your system.


