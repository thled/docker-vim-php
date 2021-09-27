call plug#begin()

" theme
Plug 'sainnhe/gruvbox-material'

" statusline
Plug 'hoob3rt/lualine.nvim'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" lsp
Plug 'neovim/nvim-lspconfig'

" search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'mkdir build; mv ~/libfzf.so build'}
Plug 'nvim-telescope/telescope.nvim'

" autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" git
Plug 'lewis6991/gitsigns.nvim'

" comment
Plug 'terrortylor/nvim-comment'

" surround
Plug 'tpope/vim-surround'

" additional text objects
Plug 'wellle/targets.vim'

" switch true/false
Plug 'zef/vim-cycle'

call plug#end()

