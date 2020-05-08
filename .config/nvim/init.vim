" @todo Deoplete for Terraform: https://github.com/juliosueiras/vim-terraform-completion#deoplete-config
function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=235 ctermfg=33  guibg=#00FF00 guifg=#000000
  hi! BuffetModBuffer     cterm=NONE ctermbg=235 ctermfg=166 guibg=#00FF00 guifg=#000000 
" BuffetActiveBuffer - an active buffer (a non-current buffer visible in a non-current window).
" BuffetModCurrentBuffer - the current buffer when modified.
" BuffetModActiveBuffer - a modified active buffer (a non-current buffer visible in a non-current window).
  hi! BuffetBuffer  cterm=NONE ctermbg=235 ctermfg=33 guibg=#00FF00 guifg=#000000
  hi! BuffetTrunc  cterm=NONE ctermbg=235 ctermfg=33 guibg=#00FF00 guifg=#000000
  hi! BuffetTab cterm=NONE ctermbg=235 ctermfg=33 guibg=#00FF00 guifg=#000000
endfunction
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
"  Plug 'iCyMind/NeoSolarized'           " Solarized Colorscheme for NeoVim using truecolor
  Plug 'altercation/vim-colors-solarized' " Solarized Colorscheme 
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
  Plug 'scrooloose/nerdtree'            " The nerdtree
  Plug 'Xuyuanp/nerdtree-git-plugin'    " Show some nice git status in the nerdtree 
  Plug 'christoomey/vim-tmux-navigator' " Vim / Tmux Navigation 
  Plug 'dense-analysis/ale'             " Asynchronous Lint Engine 
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'airblade/vim-gitgutter'         " Show git information in front of the line numbers
  Plug 'bagrat/vim-buffet'              " Buffet for showing the tabline
  " Syntax Files
  Plug 'ekalinin/Dockerfile.vim'  " Dockerfile sytnax and snippets
  Plug 'hashivim/vim-terraform'
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
  " }}}
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
  "  set termguicolors
"  set background=dark
"let g:solarized_termcolors=256
"  colorscheme NeoSolarized
"  " Enable true color 启用终端24位色
"  if exists('+termguicolors')
"    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"    set termguicolors
"  endif
  " Show special characters 
  set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
  highlight NonText guifg=#3f3f3f
  set list
" }}}
" vim keyboard setup {{{ 
  let g:mapleader = ' '
  map <C-j> <C-W>j " Switch split downwards 
  map <C-k> <C-W>k " Switch split upwards 
  map <C-h> <C-W>h " Switch split leftwards
  map <C-l> <C-W>l " Switch split rightwards
" }}}
" -------------------------------------------------------------------
" Filetype Setups {{{
  " -------------------------------------------------------------------
  " automatically reload .vimrc after it has been edited
  autocmd BufWritePost .vimrc source ~/.vimrc
  autocmd BufWritePost init.vim source ~/.config/nvim/init.vim

  autocmd BufReadPost *.tf set foldmarker={,} foldlevel=0 ts=2 sw=2 sts=2
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
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
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#option('sources', { '_': ['ale'] })
" }}}
" Plugin NerdTree {{{
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
endfun " }}}
noremap <c-f> :call ToggleFold()<cr>
set mouse=a

" vim:set foldmarker={{{,}}} foldlevel=0 fdm=marker ts=2 sw=2 sts=2 et :
