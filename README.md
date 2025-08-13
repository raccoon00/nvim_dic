# Neovim for development in containers

## About

This container is a minimalistic environment for running [Neovim](https://github.com/neovim/neovim). It is based on [mini.nvim](https://github.com/echasnovski/mini.nvim) package. For configuring your neovim edit ``config/init.lua``. It already enables ``mini.completions`` and configures ``ruff`` and ``pyright`` language servers. 

## Requirements

 - podman

## Usage

## Testing your changes

Run the ``dev_nvim.sh`` script for quick testing of changes in this ``Dockerfile`` or in ``config/init.lua``

