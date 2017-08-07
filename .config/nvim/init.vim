" -------------------------------------------------------------------
" NeoBundle Script Initialisation {{{
" -------------------------------------------------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" }}}
" -------------------------------------------------------------------
NeoBundle 'mhartington/oceanic-next'  " oceanic next color scheme
NeoBundle 'jlanzarotta/bufexplorer'   " buffexplorer for working with multiple buffers
NeoBundle 'vim-airline/vim-airline'   " nice statusline
NeoBundle 'scrooloose/nerdtree'       " filebrowser pane
NeoBundle 'Xuyuanp/nerdtree-git-plugin' 
NeoBundle 'kien/ctrlp.vim'            " quick search

NeoBundle 'pearofducks/ansible-vim'   " Ansible Syntax
NeoBundle 'f-breidenstein/icinga-vim' " Icinga2 Config File Syntax
" -------------------------------------------------------------------
" NeoBundle Script Exectuion {{{ 
" -------------------------------------------------------------------
call neobundle#end()  
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  

" }}}
" -------------------------------------------------------------------
set number nuw=5  " Activate line numbers and reserve 5 digits for it
set cursorline    " Highlight the current line 
set showmatch     " Highlight matching brackets
set scrolloff=5   " Start scrolling at 5 lines left 
set laststatus=2 
set splitbelow    " Always create new splits below the current 
set splitright    " Always create new vsplits right of the current 
set clipboard=unnamed
set backspace=indent,eol,start 

set hlsearch ignorecase incsearch 
set gdefault      " For search & replace automatically use global mode
set smartcase     " If a capital letter is in the search term make search case sensitive

" -------------------------------------------------------------------
" Plugin - vim-airline setup {{{
" -------------------------------------------------------------------
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts=1
" }}}
" -------------------------------------------------------------------
" Plugin - oceanic-next color scheme setup {{{
" -------------------------------------------------------------------

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set number

" Theme
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" }}}
" -------------------------------------------------------------------
" Plugin - NERDtree {{{
" -------------------------------------------------------------------
autocmd vimenter * NERDTree
autocmd vimenter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}
" -------------------------------------------------------------------
" CtrlP Setup {{{
" -------------------------------------------------------------------

let g:ctrlp_match_window_bottom=1
let g:ctrlp_show_hidden=1

" }}}
" -------------------------------------------------------------------
" Filetype Setups {{{
" -------------------------------------------------------------------

" automatically reload .vimrc after it has been edited
autocmd BufWritePost .vimrc source ~/.vimrc
autocmd BufWritePost init.vim source ~/.config/nvim/init.vim

" }}}
" -------------------------------------------------------------------
" Keyboard Setup {{{
" -------------------------------------------------------------------

let mapleader = ","
" Map ; to : in normal mode, to prevent common typos
nnoremap ; : 
noremap <c-f> :call ToggleFold()<cr>
" Stupid Shift Key Fixes {{{
if has("user_commands")
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
" Searching {{{
nmap <space> <esc>/<cr>
nmap <c-space> <esc>?<cr>
nmap <silent> <leader>/ <esc>:nohlsearch<cr> " clear highlighted search
" }}}

" }}}
" -------------------------------------------------------------------
" Functions {{{
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
" }}}
" -------------------------------------------------------------------
" Unsorted stuff & Testing stuff {{{
" -------------------------------------------------------------------


" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set number

" Theme
syntax enable
colorscheme OceanicNext

" }}}
" -------------------------------------------------------------------
" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker :

