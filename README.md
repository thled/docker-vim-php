# Docker Vim PHP

A Docker container to run neovim with plugins to assist PHP development.

## Requirements

- [Docker][docker]

## Installation

1. Clone this repository: `$ git clone git@gihub.com:thled/docker-vim-php.git`
1. Change to project directory: `$cd docker-vim-php`
1. Build image: `docker build --build-arg INTELEPHENSE_KEY=XXX -t pvim .` (Arg "XXX" for Intelephense key is not neccessary.)

## Usage

`docker run --rm -it -v (pwd):/data pvim'

## Misc

- Useful key bindings: <https://gist.github.com/thled/a6fcf4a02108598ae9ba5a8ab01d84e0#neovim>

[docker]: https://docs.docker.com/install

