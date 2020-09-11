FROM alpine:latest

ARG INTELEPHENSE_KEY="42"
ENV RIPGREP_CONFIG_PATH "/home/neovim/.config/ripgrep/config"
ENV FZF_DEFAULT_COMMAND "rg --files --hidden"

# install neovim and dependencies
RUN apk add --no-cache \
    neovim neovim-doc \
    # needed by dockerfile
    curl \
    # needed by neovim as provider
    python3-dev py-pip gcc musl-dev \
    nodejs yarn \
    # needed by fzf
    bash ripgrep git \
    # needed by phpactor
    php php-ctype php-curl php-dom php-iconv php-json php-mbstring php-openssl php-phar php-tokenizer

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
    # install coc extensions (one at a time otherwise some fail)
    && nvim --headless +'CocInstall -sync coc-snippets ' +qall \
    && nvim --headless +'CocInstall -sync coc-json' +qall \
    && nvim --headless +'CocInstall -sync coc-yaml' +qall \
    # && nvim --headless +'CocInstall -sync coc-xml' +qall \
    && nvim --headless +'CocInstall -sync coc-markdownlint' +qall \
    && nvim --headless +'CocInstall -sync coc-html' +qall \
    && nvim --headless +'CocInstall -sync coc-css' +qall \
    && nvim --headless +'CocInstall -sync coc-tsserver' +qall \
    && nvim --headless +'CocInstall -sync coc-phpls' +qall \
    # insert intelephense key
    && sed -i "s/{{ nvim_coc_intelephense }}/$INTELEPHENSE_KEY/g" /home/neovim/.config/nvim/coc-settings.json \
    # symlink needed by phpactor
    && ln -s /home/neovim/.config/nvim/plugged/phpactor/bin/phpactor /usr/local/bin/phpactor

# install coc-xml dependencies
# RUN cd /home/neovim \
#     openjdk11 \
#     # install limmex
#     && git clone https://github.com/eclipse/lemminx.git \
#     && cd lemminx && ./mvnw clean verify \
#     && mv org.eclipse.lemminx/taget/org.eclipse.lemminx-uber.jar /home/neovim/.config/coc/extensions/coc-xml-data \
#     && rm -rf /home/neovim/lemminx

WORKDIR /data

ENTRYPOINT [ "/usr/bin/nvim" ]

