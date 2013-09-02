set nocompatible                  " Must come first because it changes other options.
filetype off                      " Necessary on some Linux distros for pathogen to properly load bundles

" *********************************************
" *          Vundle - Vim Plugins             *
" *********************************************
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/L9.git'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/AutoTag'
Bundle 'godlygeek/tabular'
Bundle 'skalnik/vim-vroom'
Bundle 'majutsushi/tagbar'
Bundle 'airblade/vim-gitgutter'
Bundle 'sandeepravi/refactor-rails.vim'
Bundle 'terryma/vim-expand-region'
"Bundle 'ngmy/vim-rubocop'
Bundle 'git://gist.github.com/287147.git'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'

Bundle 'unimpaired.vim'
Bundle 'vim-indent-object'
" *********************************************
" *                 Settings                  *
" *********************************************
set encoding=utf-8
syntax enable
filetype plugin indent on         " load file type plugins + indentation

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Show matching brackets/parenthesis

set nowrap                        " don't wrap lines
set tabstop=2 shiftwidth=2        " a tab is two spaces (or set this to 4)
set expandtab                     " use spaces, not tabs (optional)
set backspace=indent,eol,start    " backspace through everything in insert mode"
set autoindent                    " match indentation of previous line
set pastetoggle=<F2>

set incsearch                     " Find as you type search
set hlsearch                      " Highlight search terms
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set foldmethod=indent             "fold based on indent
set foldnestmax=3                 "deepest fold is 3 levels
set nofoldenable                  "dont fold by default

set hidden                        " Handle multiple buffers better.
set title                         " Set the terminal's title
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight current line
set wildmode=list:longest         " Complete files like a shell.
set wildmenu                      " Enhanced command line completion.
set wildignore=*.o,*.obj,*~       " Stuff to ignore when tab completing
set novisualbell
set noerrorbells
set history=1000                  " Store lots of :cmdline history

set scrolloff=3
set sidescrolloff=7

set splitbelow
set splitright

set mouse-=a
set mousehide
set ttymouse=xterm2
set sidescroll=1

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in one location
set timeoutlen=500

set laststatus=2                  " Show the status line all the time
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P


set t_Co=256                      " Set terminal to 256 colors
set background=dark
colorscheme Tomorrow-Night-Bright


autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufRead,BufNewFile *.thor set filetype=ruby

" *********************************************
" *                 Functions                 *
" *********************************************

" Find Cucumber's unused steps
command! CucumberFindUnusedSteps :call CucumberFindUnusedSteps()
function! CucumberFindUnusedSteps()
  let olderrorformat = &l:errorformat
  try
    set errorformat=%m#\ %f:%l
    cexpr system('bundle exec cucumber --no-profile --no-color --format usage --dry-run features \| grep "NOT MATCHED BY ANY STEPS" -B1 \| egrep -v "(--\|NOT MATCHED BY ANY STEPS)"')
    cwindow
  finally
    let &l:errorformat = olderrorformat
  endtry
endfunction

" Ack current word in command mode
function! AckGrep(word)
  if empty(a:word)
    let word = expand("<cword>")
  else
    let word = a:word
  endif

  cgetexpr system("ag --search-files ".word)
  cw
endfunction

function! AckVisual()
  normal gv"xy

  let escape_chars = ['(', ')']
  for char in escape_chars
    let @x = escape(@x, char)
  endfor

  call AckGrep(shellescape(@x))
endfunction

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" *********************************************
" *               Key Bindings                *
" *********************************************
let mapleader = ","

" Clear last search highlighting
nnoremap <Space> :noh<cr>

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Open the definition in a new split
nnoremap <c-\> <c-w>g<c-]>

" Insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" Shortcut for =>
imap <C-l> <Space>=><Space>

" Convert old hash to new Ruby 1.9 syntax
map <leader>: :%s/:\(\w\+\)\(\s*=>\s*\)/\1: /gc<CR>

" indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" F7 reformats the whole file and leaves you where you were (unlike gg)
map <silent> <F7> mzgg=G'z :delmarks z<CR>:echo "Reformatted."<CR>

" open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" rename current file
map <leader>n :call RenameFile()<cr>

" AckGrep current word
map <leader>a :call AckGrep('')<CR>
" AckVisual current selection
vmap <leader>a :call AckVisual()<CR>
command! -nargs=? Ag call AckGrep(<q-args>)

" File tree browser - backslash
map \ :NERDTreeToggle<CR>
" File tree browser showing current file - pipe (shift-backslash)
map \| :NERDTreeFind<CR>

let g:vroom_map_keys = 0
silent! map <unique> <Leader>t :VroomRunTestFile<CR>
silent! map <unique> <Leader>T :VroomRunNearestTest<CR>
silent! map <unique> <Leader>w :!bundle exec cucumber --profile=wip<CR>

nnoremap <silent> <F9> :TagbarToggle<CR>

"Run Ruby code analyzer
map <leader><leader> :RuboCop<cr>

" *********************************************
" *           Plugin Customization            *
" *********************************************

"# ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" vim-gitgutter
highlight clear SignColumn

" *********************************************
" *        Local Vimrc Customization          *
" *********************************************

"# 1303290923: make 'find' search file in the current project
set path=$PWD/**
inoremap jj <ESC>

"# 130821: new tab and close tabe
if version >= 700
    map <C-t>n <Esc>:tabnew<CR>
    map <C-t>x <Esc>:tabclose<CR>
    "map <C-w> <Esc>:tabclose<CR> " it's for change window layout
endif

"1308241133: delete All.
nmap dA :%d<CR>

"toggle set number mode
set number
nnoremap <F3> :set nonumber!<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee % > /dev/null

"1308301011: take from rails best practice.
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

nmap <leader>l :set list!<cr>
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸–,eol:¶,trail:❖,nbsp:¬

"1308301045: my map key
map <leader>R :source ~/.vimrc<cr>
map <leader>cl :set cursorline!<cr>
map <leader>cc :set cursorcolumn!<cr>

"1309021051: map key to refrsh ctag
:nnoremap <f5> :!ctags -R<CR>
