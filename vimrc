" References:
"  http://amix.dk/vim/vimrc.html

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" To work with windows
set runtimepath=~/_vim,~/.vim,$VIMRUNTIME

execute pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'cakebaker/scss-syntax.vim'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set wildmenu "Turn on WiLd menu
set wildmode=longest:full,full

set ruler "Always show current position

"set cmdheight=1 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showcmd		" display incomplete commands

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set t_vb=

 
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

"set statusline+=%#todo#  "switch to todo highlight
"set statusline+=%F       "full filename
"set statusline+=%#error# "switch to error highlight
"set statusline+=%y       "filetype
"set statusline+=%*       "switch back to normal statusline highlight
"set statusline+=%l       "line number

set guitablabel=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system

if has ("win32") 
  set gfn=Lucida\ Console:h9
else
  set gfn="Monospace\ 10"
endif

set guioptions-=T
set background=dark
set t_Co=256
set background=dark
set encoding=utf8

" xterm color scheme
let xterm16_Colormap = 'allblue'
let xterm16_brightness = 'high'
colo xterm16
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab


set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set nowrap

map <leader>t2 :setlocal shiftwidth=2<cr>
map <leader>t4 :setlocal shiftwidth=4<cr>
map <leader>t8 :setlocal shiftwidth=4<cr>

" Make copy/pasta work in gvim
imap <C-S-X> <ESC>"+x
imap <C-S-C> <ESC>"+y 
imap <C-S-V> <ESC>"+gP



""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>


" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Useful on some European keyboards
map ½ $
imap ½ $
vmap ½ $
cmap ½ $


func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
map <C-l> :tabp <CR>
map <C-b> :tabn <CR>
map <C-g> :tabf 
map <C-t> :e 
noremap <C-h>  
map <C-s> :vsplit 
map <C-d> :split 

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

let g:snips_trigger_key = '<C-B>'
let g:snips_trigger_key_backwards = '<C-L>'

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers
try
  set switchbuf=usetab
  set stal=2
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

"" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
au FileType python set nocindent nosmartindent
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au BufNewFile,BufRead *.py set expandtab tabstop=4 shiftwidth=4 softtabstop=4 

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => Eclim Section
""""""""""""""""""""""""""""""

let g:SuperTabDefaultCompletionTypeDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabLongestHighlight = 1

"inoremap <C-h> <C-X><C-U>

" Eclim settings
" ,i imports whatever is needed for current line
nnoremap <silent> <LocalLeader>i :JavaImport<cr>
" ,d opens javadoc for statement in browser
nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
nnoremap <silent> <LocalLeader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
nnoremap <silent> <LocalLeader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='open'

" Remove the completion scratch window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set cot-=preview

:vmap * :<C-U>let old_reg=@"<cr>gvy/<C-R><C-R>=substitute(escape(@",'\/.*$^~[]'),"\n$","","")<CR><CR>:let @"=old_reg<cr>

set formatoptions-=rco

au FileType java set fo-=r
au FileType perl set fo-=r

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let loaded_rainbow = 1


""""""""""""""""""""""""""""""""""
"" Plugin Configurations 
""""""""""""""""""""""""""""""""""

let g:cssColorVimDoNotMessMyUpdatetime = 1


let g:ctrlp_map = "<Leader>r"
let g:ctrlp_cmd = 'CtrlP'

noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>c :NERDTree-cd<CR>
noremap <Leader>a :NERDTree ~/Developer/anthroweb<CR>
noremap <Leader>f :NERDTree ~/Developer/anthroweb/features<CR>


let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Close the nerdtree when opening a file
let g:NERDTreeQuitOnOpen = 1    

" Quit vim if NERDTree is the last open buffe
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'long' ]

" Filename only in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Remove Ex Mode
nnoremap Q <Nop>

