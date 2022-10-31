let g:ycm_python_binary_path = '/usr/bin/python' " this interpreter is used by jedi
let g:ycm_server_python_interpreter = '/usr/bin/python2' " parts of youcompleteme are written in python2
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/thirdparty/ycmd/cpp/ycm/.ycm_extra_conf.py' " just added from the aur script
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_auto_start_csharp_server = 1
" let g:ycm_auto_stop_csharp_server = 1
let g:ycm_auto_start_csharp_server = 0
let g:ycm_auto_stop_csharp_server = 0
let g:ycm_min_num_identifier_candidate_chars = 2 " This option controls the minimum number of characters that a completion candidate coming from the identifier completer must have to be shown in the popup menu.
let g:ycm_filetype_whitelist = { 'python': 1, 'cs': 1, 'javascript': 1, 'scala': 1, 'sh': 1 }
let g:ycm_goto_buffer_command = 'same-buffer'
" Better Completion
set completeopt=longest,menuone,preview
" set completeopt-=preview

