cal plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-jp/vimdoc-ja'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'w0rp/ale'

cal plug#end()

let g:go_def_mode = 'gopls'
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_disabled = []

let g:ale_sign_column_always = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 1
let g:ale_sign_error = '💥'
let g:ale_sign_warning = '💣'
let g:ale_linters = {
            \ 'go': ['gopls'],
            \ }
let g:ale_go_langserver_executable = 'gopls'

if has('autocmd')
    aug ReadFile
        au!
        au BufRead * if line('''"') > 0 && line('''"') <= line('$') | cal execute('norm g`"zz') | en
    aug END
en

ru ftplugin/man.vim
let g:ft_man_open_mode = 'vert'

se hlg=ja,en
se kp=:Man
se spr
se ea
se nu
se noswf nobk
se sm mat=1
se hls is sc
se mouse=a
se nofen fdm=indent
se cb^=unnamedplus
se ls=2
se cot=menuone,noselect
se wmnu wim=longest,full
se stal=2
se ve=all
se ts=4 sts=4 sw=4 et ai si sta
se tm=100
se bg=dark

filet plugin indent on
syn on
colo gruvbox
