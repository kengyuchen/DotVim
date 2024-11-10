" This file is copied and modified from linux.csie.org

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

syntax on
" colorscheme hybrid
" colorscheme onedark
colorscheme catppuccin_macchiato " catppuccin_mocha, catppuccin_latte, catppuccin_frappe, catppuccin_macchiato

" lightline statusbar plugin
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ }
let g:lightline = {
	\ 'colorscheme': 'catppuccin_macchiato',
    \ }


set background=dark
set nu
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
hi CursorLine cterm=NONE ctermbg=238
" hi Visual cterm=bold ctermbg=238
hi LineNr ctermfg=grey
hi Pmenu ctermfg=15 ctermbg=0 " Change YouCompleteMe panel color


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
if 0 " version >= 700
  map  <C-c> :tabnew<CR>
  imap <C-c> <ESC>:tabnew<CR>
  map  <C-k> :tabclose<CR>
  map  <C-p> :tabprev<CR>
  imap <C-p> <ESC>:tabprev<CR>
  map  <C-n> :tabnext<CR>
  "imap <C-n> <ESC>:tabnext<CR>
  map <F4> :set invcursorline<CR>

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

" Crontabs must be edited in place
au BufRead /tmp/crontab* :set backupcopy=yes

" Save backup files in ~/vimtmp/
set backupdir=.backup/,~/.vimtmp/,/tmp/,.
set directory=.swp/,~/.vimtmp/,/tmp/,.
set undodir=.undo/,~/.vimtmp/,/tmp/,.

" Set UNIX fileformat
set fileformat=unix



" Follow github.com/tpope/vim-pathogen
execute pathogen#infect()


" Follow https://medium.com/rahasak/vim-as-my-latex-editor-f0c5d60c66fa
" Use :LLPStartPreview to preview latex document
autocmd Filetype tex setl updatetime=2
let g:livepreview_previewer = 'open -a Preview'
let g:livepreview_engine = '~/bin/pdflatex'
let g:livepreview_use_biber = 1

filetype plugin indent on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_te.="\e[0 q"
