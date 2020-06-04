" -------------------------------------------------------------------
" Plugin buffet: Configuration {{{ 
" This needs to be done before loading the plugin otherwise it will 
" not be triggered correctly
" -------------------------------------------------------------------
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
" }}}
" -------------------------------------------------------------------
" vim-plug initialisation and auto installation {{{
" -------------------------------------------------------------------
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    echo 'Installing vim-plug ...' 
    echo '' 
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.config/nvim/plugged')
" }}}
" plugins {{{
  "Plug 'iCyMind/NeoSolarized'           " Solarized Colorscheme for NeoVim using truecolor
  "Plug 'altercation/vim-colors-solarized' " Solarized Colorscheme 
  Plug 'jacoborus/tender.vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  Plug 'scrooloose/nerdtree'            " The nerdtree
  Plug 'Xuyuanp/nerdtree-git-plugin'    " Show some nice git status in the nerdtree 
  Plug 'christoomey/vim-tmux-navigator' " Vim / Tmux Navigation 
  Plug 'dense-analysis/ale'             " Asynchronous Lint Engine 
  Plug 'juliosueiras/vim-terraform-completion'
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'airblade/vim-gitgutter'         " Show git information in front of the line numbers
  Plug 'bagrat/vim-buffet'              " Buffet for showing the tabline
  "Plug 'vim-syntastic/syntastic'
  " Syntax Files
  Plug 'ekalinin/Dockerfile.vim'  " Dockerfile sytnax and snippets
  Plug 'hashivim/vim-terraform'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'aserebryakov/vim-todo-lists'
  " Experimental Plugins
" }}}
" vim-plug execution {{{
  call plug#end()
" }}}
" -------------------------------------------------------------------
" generic vim settings {{{
" -------------------------------------------------------------------
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
  "set mouse=a
  set colorcolumn=80,100
  set cot=noselect,menu,menuone
" Give more space for displaying messages.
set cmdheight=2
" }}}
" -------------------------------------------------------------------
" colorscheme setting {{{
" -------------------------------------------------------------------
  " NeoSolarized Dark {{{
  "set background=dark
  "colorscheme NeoSolarized
  "" Enable true color 启用终端24位色
  "if exists('+termguicolors')
  "  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  "  set termguicolors
  "endif
  "" Show special characters 
  "set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
  "highlight NonText guifg=#3c3c3c
  "set list
  " }}}
  " Tender {{{ 
  "if (has("termguicolors"))
  "  set termguicolors
  "endif
  "syntax enable
  "colorscheme tender
  "" Show special characters
  "set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
  "highlight NonText guifg=#3c3c3c
  "set list
  "" }}}
  " Gruvbox {{{ 
  if (has("termguicolors"))
    set termguicolors
  endif
  syntax enable
  colorscheme gruvbox
  " Show special characters
  set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
  highlight NonText guifg=#3c3c3c
  set list
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  " }}}
" }}}
" -------------------------------------------------------------------
" vim keyboard setup {{{ 
" -------------------------------------------------------------------
  let g:mapleader = ' '
  map <C-j> <C-W>j " Switch split downwards 
  map <C-k> <C-W>k " Switch split upwards 
  map <C-h> <C-W>h " Switch split leftwards
  map <C-l> <C-W>l " Switch split rightwards
" }}}
" -------------------------------------------------------------------
" Vim StatusLine {{{
" -------------------------------------------------------------------
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
" }}}
" -------------------------------------------------------------------
" Filetype Setups {{{
  " -------------------------------------------------------------------
  " automatically reload .vimrc after it has been edited
  autocmd BufWritePost .vimrc source ~/.vimrc
  autocmd BufWritePost init.vim source ~/.config/nvim/init.vim

  autocmd BufReadPost *.tf set foldmarker={,} foldlevel=0 ts=2 sw=2 sts=2
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufReadPost *.yaml.tmpl set filetype=yaml
" }}} 
" -------------------------------------------------------------------
" Stupid Shift Key Fixes {{{
" -------------------------------------------------------------------
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
" }}}
" -------------------------------------------------------------------
" Plugin Leaderf {{{
  let g:Lf_PreviewInPopup = 1
  let g:Lf_ShortcutF = '<C-P>'
  let g:Lf_WindowPosition = 'popup'
" }}}
" Plugin Deoplete {{{ 
"   let g:deoplete#enable_at_startup = 1
"   let g:deoplete#delimiters = ['/','.']
"   let g:deoplete#sources#go = 'vim-go'
"   "let g:deoplete#keyword_patterns = {}
"   "let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'
"   call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
"   call deoplete#custom#option('omni_patterns', { 'complete_method': 'omnifunc', 'terraform': '[^ *\t"{=$]\w*' })
"   call deoplete#custom#option('sources', { '_': ['ale'] })
"   let g:deoplete#omni_patterns = {}
"   " (Optional)Hide Info(Preview) window after completions
"   autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"   autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 
"   let g:deoplete#enable_at_startup = 1
" }}}
" Plugin NerdTree {{{
  let NERDTreeShowHidden=1
  " We are closing NERDTree if it's the last open buffer
  if !(has('gui_vimr'))
  	autocmd vimenter * NERDTree
  	autocmd vimenter * wincmd w
  	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  endif
" }}}
" Plugin vim-terraform {{{
  let g:terraform_fold_sections=1
  let g:terraform_fmt_on_save=1
" }}}
" Plugin vim-buffet {{{
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
" }}}
" Plugin vim-terraform {{{ 
  " (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
  let g:terraform_completion_keys = 1
  " (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
  let g:terraform_registry_module_completion = 0
" }}}
" Plugin vim-go {{{
" -------------------------------------------------------------------
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
" }}}
" -------------------------------------------------------------------
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
" }}}
" -------------------------------------------------------------------
" (Optional)Remove Info(Preview) window
"set completeopt-=preview

let g:coc_global_extensions = ['coc-solargraph', 'coc-vimlsp', 'coc-yaml', 'coc-json', 'coc-go']

"call deoplete#initialize()
" vim:set foldmarker={{{,}}} foldlevel=0 fdm=marker ts=2 sw=2 sts=2 et :
