FROM alpine:latest

ENV RIPGREP_CONFIG_PATH "/home/neovim/.config/ripgrep/config"
ENV FZF_DEFAULT_COMMAND "rg --files --hidden"
ENV INTELEPHENSE_KEY "42"

# install neovim and dependencies
RUN apk add --no-cache \
    neovim neovim-doc \
    # needed by Dockerfile
    curl \
    # needed by neovim as provider
    python3-dev py-pip gcc musl-dev \
    nodejs yarn \
    # needed by fzf
    bash ripgrep git \
    # needed by Phpactor
    php php-ctype php-iconv php-json php-openssl php-phar

COPY config /home/neovim/.config

RUN adduser -D neovim \
    && chmod 777 /usr/local/bin \
    && chown -R neovim:neovim /home/neovim

USER neovim

RUN \
    # install pythons neovim plugin
    pip install pynvim \
    # install nodes neovim plugin
    && yarn global add neovim \
    # install phps composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    # install plugin manager for neovim
    && curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    # install neovim plugins
    && nvim --headless +PlugInstall +qall \
    # install CoC extensions (one at a time otherwise some fail)
    && nvim --headless +'CocInstall -sync coc-snippets ' +qall \
    && nvim --headless +'CocInstall -sync coc-vimlsp' +qall \
    && nvim --headless +'CocInstall -sync coc-json' +qall \
    && nvim --headless +'CocInstall -sync coc-yaml' +qall \
    && nvim --headless +'CocInstall -sync coc-xml' +qall \
    && nvim --headless +'CocInstall -sync coc-markdownlint' +qall \
    && nvim --headless +'CocInstall -sync coc-html' +qall \
    && nvim --headless +'CocInstall -sync coc-css' +qall \
    && nvim --headless +'CocInstall -sync coc-tsserver' +qall \
    && nvim --headless +'CocInstall -sync coc-phpls' +qall

WORKDIR /data

ENTRYPOINT [ "/usr/bin/nvim" ]

