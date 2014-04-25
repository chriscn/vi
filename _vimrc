" Useful articles
" VIM plugins: http://mirnazim.org/writings/vim-plugins-i-use/
"

if has('win32') || has('win64')
"    set runtimepath=path/to/home.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,path/to/home.vim/after
endif
let &runtimepath.=',$HOME\vimFiles'

"====== Begin of my setting ======
"
" Samples: http://amix.dk/vim/vimrc.html
"
" Autocomplete:
" - http://vim.wikia.com/wiki/Autocomplete_with_TAB_when_typing_words
"
" Useful articles:
" http://vim.wikia.com/wiki/Open_vimrc_file
" http://kevin-berridge.blogspot.com/2008/09/visual-studio-development.html
" :version
" :echo expand('~')
" :echo $HOME
" :echo $VIM
" :echo $VIMRUNTIME
"
" Plug-ins
" NERD tree: http://www.vim.org/scripts/script.php?script_id=1658
"
"

" Non-vi compitibilitity
set nocompatible


set nu

" line number column width
set nuw=6

" line spacing
set lsp=4

set ff=dos
"let g:loaded_matchparen = 1

" Folding method
" :help folding
" zo - open fold under cursor
" zc - close fold under cursor
" zR - open all folds
" zM - close all folds
set foldmethod=manual
" autocmd zr

" Swap file - disable
set noswapfile

"
" Backup file Setting
"
"set directory^=$HOME/tmp
"set backupdir^=$HOME/tmp
set nobackup
set nowritebackup
set nowb

" Highlight cursor line
set cursorline 
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=black
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=black guifg=white
"autocmd hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=black guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Font
set guifont=Courier_New:h10:cANSI  


" Converting tabs to spaces
set tabstop=4 "set ts=4
set shiftwidth=4 "set sw=4
set softtabstop=4 "set sts=4, makes the spaces feel like real tabs
set expandtab "set et

"autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2


" Enable file type detection
" refer to: http://vim.wikia.com/wiki/Indenting_source_code

" ==========================================================
" Plug-ins
" ==========================================================
" pathogen.vim
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin on
filetype plugin indent on


" Indent Guides
" http://www.vim.org/scripts/script.php?script_id=3361
" git clone git://github.com/nathanaelkane/vim-indent-guides.git 
" IndentGuidesEnable
autocmd VimEnter * :IndentGuidesEnable

" Colortheme: solarized
colorscheme solarized



" ==============================================================================
" Auto Completion
" ==============================================================================
" Omni Complete
" ctrl + n

set ofu=syntaxcomplete#Complete

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
" Disable the TabOrComplete since it doesn't compatible with MacVim
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
":set dictionary="/usr/dict/words"




" ====== Plug-ins =======
" ====== NERD tree =======
" [http://www.vim.org/scripts/script.php?script_id=1658]
" Usage:
"   :NERDTree
"   :NERDToogle
" toggles NERDTree on and off
map <f2> :NERDTreeToggle<cr>
imap <f2> <esc>:NERDTreeToggle<cr>i


"====== END MY SETTINGS ========================================================

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if &sh =~ '\<cmd'
    silent execute '!""d:\Program Files\Vim\vim63\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
  else
    silent execute '!d:\Program" Files\Vim\vim63\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  endif
endfunction

