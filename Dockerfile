FROM alpine:3.14 as tools

RUN apk add --no-cache \
    git \
    build-base \
    cmake \
    automake \
    autoconf \
    libtool \
    pkgconf \
    coreutils \
    curl \
    unzip \
    gettext-tiny-dev \
    musl-dev

WORKDIR /tools

RUN \
    # build neovim
    cd /tools \
    && git clone https://github.com/neovim/neovim.git \
    && cd neovim \
    && make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/tools/nvim install \
    # fetch plugin manager for neovim
    && cd /tools \
    && curl -fLo /tools/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    # build fzf-native for telescope
    && cd /tools \
    && git clone https://github.com/nvim-telescope/telescope-fzf-native.nvim.git \
    && cd telescope-fzf-native.nvim \
    && make

FROM alpine:3.14

ARG INTELEPHENSE_KEY="override me"

ENV RIPGREP_CONFIG_PATH "/home/neovim/.config/ripgrep/config"

RUN apk add --no-cache \
    # needed by neovim as provider
    python3-dev py-pip musl-dev g++ curl \
    nodejs yarn \
    # needed by telescope
    ripgrep git \
    # needed by lsp
    && yarn global add intelephense --prefix /usr/local

# add neovim
COPY --from=tools /tools/nvim /nvim
RUN ln -s /nvim/bin/nvim /usr/bin/nvim

# add user
RUN adduser -D neovim
USER neovim

# add neovim config
COPY --chown=neovim:neovim config /home/neovim/.config

# add vim-plug
COPY --chown=neovim:neovim --from=tools /tools/plug.vim /home/neovim/.config/nvim/autoload/

# add fzf-native
COPY --chown=neovim:neovim --from=tools /tools/telescope-fzf-native.nvim/build/libfzf.so /home/neovim/

RUN \
    # install python's neovim plugin
    pip install pynvim \
    # install node's neovim plugin
    && yarn global add neovim \
    # install neovim plugins
    && nvim --headless +PlugInstall +qall \
    # install treesitter languages
    && nvim --headless +"TSInstallSync php yaml json css scss html javascript" +q \
    # insert intelephense key
    && mkdir ~/intelephense \
    && echo "$INTELEPHENSE_KEY" > ~/intelephense/licence.txt \
    # install coq deps
    && cd ~/.config/nvim/plugged/coq_nvim \
    && python3 -m coq deps


WORKDIR /data

ENTRYPOINT [ "nvim", "."]

