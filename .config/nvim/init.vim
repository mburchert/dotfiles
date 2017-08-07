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
NeoBundle 'mhartington/oceanic-next' " oceanic next color scheme
NeoBundle 'jlanzarotta/bufexplorer'  " buffexplorer for working with multiple buffers
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
" Keyboard Setup {{{
" -------------------------------------------------------------------

let mapleader = ","
" Map ; to : in normal mode, to prevent common typos
nnoremap ; : 
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
" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker :

