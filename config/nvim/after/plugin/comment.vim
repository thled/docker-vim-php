if !filereadable(expand("~/.config/nvim/plugged/Comment.nvim/lua/Comment/init.lua"))
    finish
endif

lua <<EOF
require('Comment').setup()
EOF
