call plug#begin()

" theme
Plug 'sainnhe/gruvbox-material'

" statusline
Plug 'hoob3rt/lualine.nvim'

" syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" lsp
Plug 'neovim/nvim-lspconfig'

" search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'mkdir build; mv ~/libfzf.so build'}
Plug 'nvim-telescope/telescope.nvim'

" autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

" git
Plug 'lewis6991/gitsigns.nvim'

" comment
Plug 'numToStr/Comment.nvim'

" surround
Plug 'tpope/vim-surround'

" additional text objects
Plug 'wellle/targets.vim'

" switch true/false
Plug 'zef/vim-cycle'

" ai assistance
Plug 'github/copilot.vim'

call plug#end()

