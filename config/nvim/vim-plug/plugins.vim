call plug#begin()

" theme
Plug 'morhetz/gruvbox'

" statusline
Plug 'itchyny/lightline.vim'

" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" autocomplete + navigation
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'mhinz/vim-signify'

" comment in/out
Plug 'tpope/vim-commentary'

" surround
Plug 'tpope/vim-surround'

" additional text objects
Plug 'wellle/targets.vim'

" switch true/false
Plug 'zef/vim-cycle'

" phpactor
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}

" php syntax
Plug 'StanAngeloff/php.vim'

" twig syntax
Plug 'lumiliet/vim-twig'

call plug#end()

