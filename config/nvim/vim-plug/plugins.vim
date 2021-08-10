call plug#begin()

" theme
Plug 'morhetz/gruvbox'

" statusline
Plug 'hoob3rt/lualine.nvim'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" lsp config helper
Plug 'neovim/nvim-lspconfig'

" search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'mkdir build; mv ~/libfzf.so build'}
Plug 'nvim-telescope/telescope.nvim'

" autocomplete
Plug 'hrsh7th/nvim-compe'

" git
Plug 'lewis6991/gitsigns.nvim'

" comment in/out
Plug 'terrortylor/nvim-comment'

" surround
Plug 'tpope/vim-surround'

" additional text objects
Plug 'wellle/targets.vim'

" switch true/false
Plug 'zef/vim-cycle'

call plug#end()

