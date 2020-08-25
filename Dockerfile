FROM alpine:latest

RUN apk add --no-cache \
    bash curl gcc git musl-dev neovim neovim-doc nodejs python3-dev py-pip ripgrep yarn \
    php php-ctype php-iconv php-json php-openssl php-phar

COPY nvim /home/neovim/.config/nvim

RUN adduser -D neovim \
    && chmod 777 /usr/local/bin \
    && chown -R neovim:neovim /home/neovim

USER neovim

RUN pip install pynvim \
    && yarn global add neovim \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && nvim --headless +PlugInstall +qall \
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

