# Docker Vim PHP

A Docker container to run neovim with plugins to assist PHP development.

## Requirements

- [Docker][docker]

## Installation

1. Clone this repository:

    ```shell
    git clone git@github.com:thled/docker-vim-php.git
    ```

1. Change to project directory:

    ```shell
    cd docker-vim-php
    ```

1. Build image (`arg` for Intelephense premium key is optional):

    ```shell
    docker build --build-arg INTELEPHENSE_KEY=XXX -t pvim .
    ```

## Usage

```shell
docker run --rm -it -v (pwd):/data pvim
```

## Misc

- Useful key bindings: <https://gist.github.com/thled/a6fcf4a02108598ae9ba5a8ab01d84e0#editor-neovim>
- Remap detach keys:

    ```shell
    echo '{ "detachKeys": "ctrl-q,q" }' > ~/.docker/config.json
    ```

- Save as alias "pvim":
  - Fish:

  ```shell
  function pvim
    docker run --rm -it -v (pwd):/data pvim
  end
  funcsave pvim
  ```

  - Bash:

  ```shell
  echo 'alias pvim="docker run --rm -it -v $(pwd):/data pvim"' >> ~/.bashrc
  ```

[docker]: https://docs.docker.com/install

