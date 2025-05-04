" vimrc for vim
" This file is copied and modified from NTU CSIE linux.csie.org

" ================================
" Configuration for Old Terminals and from Files 
" ================================

" If no screen, use color term
if ($TERM == "vt100")
  " xterm-color / screen
  set t_Co=8
  set t_AF=[1;3%p1%dm
  set t_AB=[4%p1%dm
endif

if filereadable($VIMRUNTIME . "/vimrc_example.vim")
 so $VIMRUNTIME/vimrc_example.vim
endif

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
 so $VIMRUNTIME/macros/matchit.vim
endif

" ================================
" Colorscheme and Lightline
" ================================

syntax on
" colorscheme hybrid
" colorscheme onedark
colorscheme catppuccin_mocha " catppuccin_mocha, catppuccin_latte, catppuccin_frappe, catppuccin_macchiato

" lightline statusbar plugin
let g:lightline = {'colorscheme': 'catppuccin_macchiato'} " 'wombat'

hi CursorLine cterm=NONE ctermbg=238
hi LineNr ctermfg=grey guifg=#999999
hi Pmenu ctermfg=15 ctermbg=0 " Change YouCompleteMe panel color


" ==================================
" General Configuration
" ==================================

set background=dark
set nu
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ai
set ruler
set mouse=a
set noeb
set wrap
set scrolloff=3

set nocompatible
set wildmenu
set backup		" keep a backup file
" set textwidth=78
" set shiftwidth=4
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set showmatch
set whichwrap+=<,>,[,]	" allow going to the next/last line with left/arrow keys
set laststatus=2 " always show the status line
set noshowmode " -- INSERT -- is no longer used with lightline.vim installed
set cursorline
set shortmess-=S

" VIM 6.0,
if version >= 600
    set nohlsearch
    set foldmethod=marker
    set foldlevel=1
    set fileencodings=ucs-bom,utf-8,sjis,big5,latin1
else
    set fileencoding=taiwan
endif

" Tab key binding
if version >= 700
  
  map g1 :tabn 1<CR>
  map g2 :tabn 2<CR>
  map g3 :tabn 3<CR>
  map g4 :tabn 4<CR>
  map g5 :tabn 5<CR>
  map g6 :tabn 6<CR>
  map g7 :tabn 7<CR>
  map g8 :tabn 8<CR>
  map g9 :tabn 9<CR>
  map g0 :tabn 10<CR>
  map gc :tabnew<CR>
  map gn :tabn<CR>
  map gp :tabp<CR>

  highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
  highlight TabLine    term=bold cterm=bold
  highlight clear TabLineFill

end

" Window key binding
map <leader>w <C-w>

" Sync all windows to the current line position
function! SyncBufferWindowsToCursor()
	let current_win = winnr() " Get the current window number
	let current_buf = bufnr('%') " Get the current buffer number
	let current_line = line('.') " Get the current line number
	windo if bufnr('%') == current_buf | execute current_line | endif 
	" Move to the original window
	execute current_win . "wincmd w"
endfunction
nnoremap <leader>sl :call SyncBufferWindowsToCursor()<CR>

set splitright

" Crontabs must be edited in place
au BufRead /tmp/crontab* :set backupcopy=yes

" Save backup files in ~/vimtmp/
set backupdir=.backup/,~/.vimtmp/,/tmp/,.
set directory=.swp/,~/.vimtmp/,/tmp/,.
set undodir=.undo/,~/.vimtmp/,/tmp/,.

" Set UNIX fileformat
set fileformat=unix


" ================================
" Auto-suggestions
" ================================

let g:loaded_youcompleteme = 1 " 0: Enable YCM; 1: Disable YCM (used when Copilot is available)
" let g:copilot_filetypes = { '*': v:false } " Disable Copilot
highlight CopilotSuggestion guifg=#90ACC0 ctermfg=10 " Change Copilot suggestion color


" ================================
" Plugins
" Follow github.com/tpope/vim-pathogen
" ================================

execute pathogen#infect()

filetype plugin indent on


" VimTex Configuration
let g:vimtex_view_method = 'skim'
let g:vimtex_quickfix_open_on_warning = 0


" =================================
" Set cursor shape for different modes
" =================================
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_te.="\e[0 q"


" =================================
" Specific Commands for Filetype
" =================================
" Set sage syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END

autocmd Filetype tex inoremap $ $$<Left>
