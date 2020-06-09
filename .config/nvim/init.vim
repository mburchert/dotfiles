" Section: [init  ] Plug initialisation and auto installation 

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo 'Installing vim-plug ...' 
  echo '' 
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
call plug#begin('~/.config/nvim/plugged')

" Section: [plugin] vim-buffet 

  " Buffet is used for showing the tabline like in many ide. There is also a 
  " keybindindung to switch with leader + <num> to switch the buffer to the 
  " according number. 

Plug 'bagrat/vim-buffet'              " Buffet for showing the tabline
function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=66  ctermfg=33  guibg=#bdae93 guifg=#282828
  " BuffetActiveBuffer - an active buffer (a non-current buffer visible in a non-current window).
  hi! BuffetBuffer        cterm=NONE ctermbg=214 ctermfg=33  guibg=#504945 guifg=#bdae93
  " BuffetModCurrentBuffer - the current buffer when modified.
  " BuffetModActiveBuffer - a modified active buffer (a non-current buffer visible in a non-current window).
  hi! BuffetModBuffer     cterm=NONE ctermbg=235 ctermfg=166 guibg=#00FFFF guifg=#000000 
  hi! BuffetTrunc         cterm=NONE ctermbg=235 ctermfg=33  guibg=#FF0000 guifg=#000000
  hi! BuffetTab           cterm=NONE ctermbg=241 ctermfg=33  guibg=#665c54 guifg=#000000
endfunction
let g:buffet_show_index = 1
let g:buffet_modified_icon = "+"
nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 <Plug>BuffetSwitch(10)

" Section: [plugin] gruvbox color scheme

Plug 'gruvbox-community/gruvbox'
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
" Show special characters in dark grey.
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
highlight NonText guifg=#3c3c3c
set list

" Section: [plugin] LeaderF - for quicksearch files in the current subpathes

  " LeaderF is used for quicksearching files in the current subpathes of the 
  " current open path. 

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_WindowPosition = 'popup'

" Section: [plugin] NERDTree

  " Together with nerdtree we ware installing the git plugin to show some
  " nice icons in front of the files. 

Plug 'scrooloose/nerdtree'            " The nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'    " Show some nice git status in the nerdtree 
let NERDTreeShowHidden=1

  " We are closing NERDTree if it's the last open buffer
if !(has('gui_vimr'))
  autocmd vimenter * NERDTree
  autocmd vimenter * wincmd w
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

"Section: [plugin] vim-tmux-navigator

Plug 'christoomey/vim-tmux-navigator' " Vim / Tmux Navigation 
  " Also allow switching splits with the same keys as with tmux panes
map <C-j> <C-W>j " Switch split downwards 
map <C-k> <C-W>k " Switch split upwards 
map <C-h> <C-W>h " Switch split leftwards
map <C-l> <C-W>l " Switch split rightwards

" Section: [plugin] coc 
  " Together with coc we are installing vim-snippets which is a repository
  " for a wast amount of snippets for major languages. This will be used
  " by the snippets lsp of CoC. 

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'honza/vim-snippets'
  let g:coc_global_extensions = ['coc-solargraph', 'coc-vimlsp', 'coc-yaml', 'coc-json', 'coc-go', 'coc-snippets']
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  let g:coc_snippet_next = '<tab>'
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Section: [plugin] vim-gitgutter 

  Plug 'airblade/vim-gitgutter'  

" Section: [syntax] vim-fish
Plug 'dag/vim-fish'
autocmd FileType fish setlocal ts=2 sts=2 sw=2 expandtab

" Section: [plugin] todo.txt

Plug 'freitass/todo.txt-vim'
" Section: [syntax] Dockerfile

  " This is used for dockerfile syntax and snippets

Plug 'ekalinin/Dockerfile.vim'

" Section: [base  ] generic vim settings

set nocompatible
syntax on
filetype plugin indent on
set number               " activate line numbers
set nuw=5                " reserve 5 digits for line numbers
set splitbelow           " create new splits below to the current one
set splitright           " create new splits right to the current one
set nowrap               " don't wrap long lines
set cursorline           " highlight the current line
set showmatch            " highlight matching brackets
set scrolloff=5          " start scrolling if 5 lines left on screen 
set termencoding=utf-8
set relativenumber       " Show relative line numbers
set mouse=a
set colorcolumn=80,100
set cot=noselect,menu,menuone
set modelineexpr
set cmdheight=2 " Give more space for displaying messages.
let g:mapleader = ' '

" Section: [base  ] statusline 

set statusline=
set statusline+=\ %f      " Show the filename of the current buffer incl. Path
set statusline+=%M        " Show ,+ if the file is edited
set statusline+=%R        " Show ,ro is the file is readonly
set statusline+=%=        " Jump to the right
set statusline+=ft:%Y " Show filetype
set statusline+=\ \|\     " Show seperator
set statusline+=enc:%{&fileencoding?&fileencoding:&encoding} " Show encoding
set statusline+=\ \|\     " Show seperator
set statusline+=ff:%{&fileformat}                          " Show fileformat
set statusline+=\ \|\     " Show seperator
set statusline+=pos:%l:%c\ \(%p%%\) " Show position as line, columns, percent of file
set statusline+=\         " Show a last space 

" Section: [base  ] code folding

  function! ToggleFold() " {{{
    if foldlevel('.') != 0
      if foldclosed('.') < 0
        foldclose
    	else
    		foldopen
    	endif
    endif
    echo
  endfun 
  noremap <c-f> :call ToggleFold()<cr>

" Section: [base  ] some stupid shift key fixes 
  " for some reason I keep the shift time quite often too long pressed
  " and therefor get an error. This is just a trick to defeat my muscle
  " memory. 

if has('user_commands')
  command! -bang -nargs=* -complete=file E e<bang> <args>
  command! -bang -nargs=* -complete=file W w<bang> <args>
  command! -bang -nargs=* -complete=file Wq wq<bang> <args>
  command! -bang -nargs=* -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

" Section: [base  ] filetype settings 

  " Here I collect filetype settings which are not fitting in any other
  " category. 

  " automatically reload .vimrc after it has been edited
autocmd BufWritePost .vimrc source ~/.vimrc
"  autocmd BufWritePost init.vim source ~/.config/nvim/init.vim

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufReadPost *.yaml.tmpl set filetype=yaml

" Section: [misc  ] different stuff, without an idea where to put atm

  " Syntax Files
  Plug 'hashivim/vim-terraform'
  let g:terraform_fold_sections=1
  let g:terraform_fmt_on_save=1
  let g:terraform_completion_keys = 1
  let g:terraform_registry_module_completion = 0
  autocmd BufReadPost *.tf set foldmarker={,} foldlevel=0 ts=2 sw=2 sts=2
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  let g:go_highlight_structs = 1 
  let g:go_highlight_methods = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_function_parameters = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_extra_types = 1
  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go set foldmethod=syntax 

" Section: [final ] load plugins and do some aftercare

call plug#end()
colorscheme gruvbox

" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:'=':
