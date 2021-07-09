" Mappings
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <C-f> <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-e> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
