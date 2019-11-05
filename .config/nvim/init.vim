scriptencoding utf-8
" -------------------------------------------------------------------
" enable true color support {{{
" -------------------------------------------------------------------
""  if has('nvim') || has('termguicolors')
""    set termguicolors
""  endif
" }}}
" -------------------------------------------------------------------
" vim-plug initialisation and auto installation {{{
" -------------------------------------------------------------------

	if empty(glob('~/.config/nvim/autoload/plug.vim'))
		echo 'Installing vim-plug ...' 
		echo '' 
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
	call plug#begin('~/.config/nvim/plugged')
" }}} 
" -------------------------------------------------------------------
"Plug 'iCyMind/NeoSolarized'           " Solarized Colorscheme for NeoVim using truecolor
"Plug 'altercation/vim-colors-solarized'
Plug 'danilo-augusto/vim-afterglow'
Plug 'cloudhead/neovim-fuzzy'         " Fuzzy file searcher 
Plug 'w0rp/ale'                       " Asynchronous syntax checker
Plug 'christoomey/vim-tmux-navigator' " Vim / Tmux Navigation 
Plug 'scrooloose/nerdtree'            " The nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'    " Show some nice git status in the nerdtree 
Plug 'jlanzarotta/bufexplorer'        " buffexplorer for working with multiple buffers
Plug 'airblade/vim-gitgutter'         " Show git information in front of the line numbers
Plug 'vim-airline/vim-airline'        " Have a nice statusline
Plug 'vim-airline/vim-airline-themes' " Have a nice statusline - themes
Plug 'tpope/vim-commentary'           " Comment lines
Plug 'Raimondi/delimitMate'           " Automatically close brackets and quotes etc.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } " Code completion 
Plug 'SirVer/ultisnips'               " Snippet engine 
Plug 'honza/vim-snippets'             " Some default snippets
Plug 'godlygeek/tabular'              " Tabularize source

" Syntax Highlights and Language specific stuff {{{ 
Plug 'pearofducks/ansible-vim'  " Ansible Syntax Highlighting
Plug 'Glench/Vim-Jinja2-Syntax' " Jinja2 syntax Highlighting
Plug 'ekalinin/Dockerfile.vim'  " Dockerfile sytnax and snippets
" }}}

" @TODO still missing is some autocomplete framework 
" @TODO missing is a nice configuration for neovim-fuzzy

" -------------------------------------------------------------------
" vim-plug execution {{{
	call plug#end()
" }}}
" -------------------------------------------------------------------
colorscheme afterglow
" " configure NeoSolarized colorscheme {{{ 
" 	" default value is "normal", Setting this option to "high" or "low" does use the 
" 	" same Solarized palette but simply shifts some values up or down in order to 
" 	" expand or compress the tonal range displayed.
" 	let g:neosolarized_contrast = 'normal'

" 	" Special characters such as trailing whitespace, tabs, newlines, when displayed 
" 	" using ":set list" can be set to one of three levels depending on your needs. 
" 	" Default value is "normal". Provide "high" and "low" options.
" 	let g:neosolarized_visibility = 'normal'

" 	" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" 	" style more, set this value to 0.
" 	let g:neosolarized_vertSplitBgTrans = 1

" 	" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized 
" 	" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:  
" 	let g:neosolarized_bold = 1
" 	let g:neosolarized_underline = 1
" 	let g:neosolarized_italic = 0
	
" 	set background=dark
" 	colorscheme NeoSolarized
" " }}}
" configure solarized theme 
"syntax enable
"set background=dark
"colorscheme solarized

" configure neovim-fuzzy {{{
	" neovim-fuzzy needs to have 
	" * neovim >= 0.1.5
  	" * fzy
  	" * rg[1] or ag[2] >= 0.33.0
	" installed.
	nnoremap <C-p> :FuzzyOpen<CR>
" }}}
" configure ale {{{
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" }}}
" configure vim-tmux-navigator {{{ 
" }}} 
" configure nerdtree {{{
if !(has('gui_vimr'))
	autocmd vimenter * NERDTree
	autocmd vimenter * wincmd w
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif
" }}}
" configure nerdtree-git-plugin {{{
" }}}
" configure bufexplorer {{{
" }}}
" configure vim-gitgutter {{{
" }}}
" configure vim-airline {{{ 
let g:airline_powerline_fonts = 1
" }}}
" configure vim-airline-themes {{{
"let g:airline_theme='solarized'
let g:airline_theme = 'afterglow'
" }}}
" configure vim-commentary {{{ 
" }}}
" configure delimitMate {{{
" }}}
" configure YouCompleteMe {{{
let g:ycm_server_python_interpreter="/usr/bin/python2.7"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" }}}
" configure ultisnips {{{ 
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
" }}}
" configure vim-snippets {{{ 
" }}} 
" configure tabular {{{
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
" }}}
" -------------------------------------------------------------------
" configure ansible-vim {{{ 
let g:ansible_unindent_after_newline = 1   " indentation will completely reset (unindent to column 0) after two newlines in insert-mode
let g:ansible_name_highlight = 'd'         " This option enables/changes highlight of a name: key for self-documentation
let g:ansible_extra_keywords_highlight = 1 " Highlight the following additional keywords in playbooks: register always_run changed_when failed_when no_log args vars delegate_to ignore_errors

" }}}
" -------------------------------------------------------------------
" Filetype Setups {{{
	" automatically reload .vimrc after it has been edited
	autocmd BufWritePost .vimrc source ~/.vimrc
	autocmd BufWritePost init.vim source ~/.config/nvim/init.vim
  autocmd BufWritePost *.tf silent !terraform fmt %
  autocmd BufWritePost *.tf e
" }}} 
" -------------------------------------------------------------------
set number nuw=5  " Activate line numbers and reserve 5 digits for it
set relativenumber " Show relative line numbers
set splitbelow    " Always create new splits below the current 
set splitright    " Always create new vsplits right of the current 
set nowrap        " Don't wrap long lines 
set cursorline    " Highlight the current line 
set showmatch     " Highlight matching brackets
set scrolloff=5   " Start scrolling at 5 lines left 
" Setup searching {{{
set hlsearch ignorecase incsearch 
set gdefault      " For search & replace automatically use global mode
set smartcase     " If a capital letter is in the search term make search case sensitive
" }}} 
set shell=/bin/zsh
" -------------------------------------------------------------------
" Keyboard Setup {{{
let g:mapleader = ' '

" Remap ESC
imap fj <esc>
imap jf <esc>
" }}}
" Stupid Shift Key Fixes {{{
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
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
" -------------------------------------------------------------------
" vim:set foldmarker={{{,}}} foldlevel=0 fdm=marker ts=2 sw=2 sts=2 et :
