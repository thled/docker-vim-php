FROM alpine:latest

RUN apk add --no-cache \
    bash curl git neovim nodejs python3 ripgrep \
    php php-ctype php-iconv php-json php-openssl php-phar

RUN adduser -D neovim \
    # && mkdir -p /home/neovim/.local/share/nvim/shada \
    && chown -R neovim:neovim /home/neovim
    # && chmod 0600 /home/neovim/.local/share/nvim/shada/main.shada

RUN mkdir -p /.composer && chown neovim:neovim /.composer \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER neovim

COPY --chown=neovim nvim /home/neovim/.config/nvim

RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

RUN nvim --headless +PlugInstall +qall

WORKDIR /data

ENTRYPOINT [ "/usr/bin/nvim" ]

