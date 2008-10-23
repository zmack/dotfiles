""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" yarr! this be chelu's .vimrc
"""""""""" originally based on vimrc by andrei dragomir and radu dineiu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" stupid thing to set the path on mac if not started from a shell
" nicked from the default vimrc which was not ran at all
if has("macunix") && has("gui_running") && system('ps xw | grep -c "[V]im -psn"') > 0
  " Get the value of $PATH from a login shell.
  if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
    let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
    let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
  endif
endif

" make ~/.vim work on windows and ~/vimfiles on *nix
set runtimepath=$HOME/.vim,$HOME/vimfiles,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,$HOME/vimfiles/after
set directory=$HOME/tmp/vim,$HOME/tmp,/var/tmp,/tmp,c:\\windows\\temp,$TMP,$TEMP

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" INCLUDES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime evil.che.lu.vim
runtime macros/matchit.vim
runtime surround.vim
runtime plugin/FindFile.vim
"runtime allml.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" macvim
if has("gui_macvim")
  let macvim_skip_cmd_opt_movement = 1
endif

"""""""""" general
set nocompatible              " use VI incompatible features
set cpoptions+=I              " keep autoindent - doesn't seem to work tho
set autoread                  " read outside modified files
set encoding=UTF-8
set history=10000             " number of history items
set undolevels=10000
set viminfo=%,h,'1000,"1000,:1000,n~/.viminfo
set writebackup
set writeany                  " write on readonly files
set modelines=0               " disable modelines

"""""""""" searches
set gdefault                  " global search/replace by default
set ignorecase                " ignore case when searching
set smartcase                 " ignore case when searching
set hlsearch                  " highlight last search
set incsearch                 " show matches while searching

"""""""""" input behavior
set mouse=a
set winaltkeys=no
set selectmode=mouse ",key      " when to enter SELECT mode
set selection=exclusive         " windows style
set keymodel=startsel ",stopsel " what to do when moving with SHIFT
set formatoptions=croqn1        " text autoformatting options
set nostartofline               " don't move to start of line after commands
set backspace=eol,start,indent  " backspace over everything
set whichwrap=<,>,h,l,b,s,~,[,]
set iskeyword=@,48-57,128-167,224-235,_
set listchars=tab:>.,trail:.,extends:>,precedes:<,eol:$

"""""""""" visual
set guioptions=ceimMgr        " aA BAD? WHY THE FUCK ARE YOU SETTING b !?! =[
set number                    " show line numbers
set laststatus=2              " always show status line
set scrolloff=2               " minlines to show around cursor
set sidescrolloff=4           " minchars to show around cursor
set shortmess=asTIA           " supress some file messages
set linebreak                 " when wrapping, try to break at characters in breakat
set breakat=\ ^I!@*-+;:,./?   " when wrapping, break at these characters
set showbreak=>               " character to show that a line is wrapped
"set cursorline                " highlight cursor line
set showcmd                   " show number of selected chars/lines in status
let loaded_matchparen = 1     " don't show matching brace when moving around, it's too slow
"NoMatchParen                  " don't show matching brace when moving around, it's too slow
set showmatch                 " briefly jump to matching brace
set matchtime=1               " show matching brace time (1/10 seconds)
set showmode                  " show mode in status when not in normal mode
set virtualedit=block
set noerrorbells
set visualbell                " must turn visual bell on to remove audio bell
set t_vb=                     " turn bells of, must also set this in .gvimrc
set wildmenu                  " nice menu when completing commands
set wildmode=list:longest,full

if has("win32")
  set guifont=DejaVu_Sans_Mono:h10
endif
if has("macunix")
  set antialias
endif
if has("unix")
  set guifont=Monaco\ 9
end
colorscheme desert

"""""""""" windows, tab pages, buffers
set statusline=%-2(%M\ %)%5l,%-5v%<%f\ %m\ \ %{hostname()}:%r%{CwdShort()}%=%(%-5([%R%H%W]\ %)\ %10([%Y]%{ShowFileFormatFlag(&fileformat)}\ %)\ %L\ lines%)
set showtabline=2

" see help for these functions
"set tabline=%!MyTabLine()
" guitablabel is ignored :/
"set guitablabel=%N\ %f
"set guitablabel=%{GuiTabLabel()}

set switchbuf=usetab
set tabpagemax=100
set noequalalways
set guiheadroom=0
set hidden
set splitbelow                " split windows below current one
set title

"""""""""" editing
set ffs=unix,dos,mac          " prefer unix line endings
syntax enable
"filetype plugin indent on
filetype plugin on

"""""""""" netrw
let g:netrw_browsex_viewer="open"

"""""""""" tabs and spaces
call CHELU_spaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" snippetsEmu settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:snip_start_tag = "|>"
"let g:snip_end_tag   = "<|"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" taglist settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_Compact_Format = 1
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_WinWidth = 40 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" MiniBufExplorer / tabbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $HOME/.vim/_mine/tabbar.vim
"let g:Tb_MaxSize = 0
"let g:Tb_SplitBelow = 1
"let g:Tb_MoreThanOne = 0
"let g:Tb_MapCTabSwitchBufs = 1
"let g:Tb_ModSelTarget = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDMapleader = '<SPACE>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" NERDTree settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeChDirMode = 0 " don't change dirs
let NERDTreeWinSize = 60

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" TOhtml
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let use_xhtml = 1
let html_number_lines = 0
let html_ignore_folding = 1
let html_use_css = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" for allml.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
"let g:allml_global_maps = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" autocmds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd BufNewFile,BufReadPre * call CHELU_spaces()
autocmd GUIEnter              * call GuiEnter()
autocmd BufEnter              * call BufEnter()
autocmd TabLeave              * call TabLeave()
if has("macunix")
  "autocmd BufLeave             * call TabLeave()
endif
autocmd VimLeavePre           * call VimLeave()

" filetypes
autocmd! BufRead,BufNewFile *.haml         setfiletype haml
autocmd! BufRead,BufNewFile *.sass         setfiletype sass
autocmd! BufRead,BufNewFile *.as           set filetype=javascript 
autocmd! BufRead,BufNewFile COMMIT_EDITMSG set filetype=gitcommit
autocmd! BufRead,BufNewFile COMMIT_EDITMSG set syntax=diff

"""""""""" match tags in xml like docs
" needed? maybe already from matchit.vim?
"autocmd! FileType html,xhtml,rhtml,xml,sgml,entity,xslt,svg,xsl,xsd
"	\ if !exists("b:match_words") |
"	\ let b:match_ignorecase=0 | let b:match_words =
"	\ '<:>,' .
"	\ '<\@<=!--:-->,'.
"	\ '<\@<=?\k\+:?>,'.
"	\ '<\@<=\([^ \t>/]\+\)\%(\s\+[^>]*\%([^/]>\|$\)\|>\|$\):<\@<=/\1>,'.
"	\ '<\@<=\%([^ \t>/]\+\)\%(\s\+[^/>]*\|$\):/>'
"	\ | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! W :up
command! WW :browse confirm saveas
command! Wq :wq
command! -nargs=1 -complete=file C :call CreateNewFile(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" templates
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" generic templates
let g:template{'_'}{'lorem0'}  = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
let g:template{'_'}{'lorem1'}  = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
let g:template{'_'}{'lorem2'}  = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
let g:template{'_'}{'lorem3'}  = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
let g:template{'_'}{'lorem4'}  = "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
let g:template{'_'}{'lorem5'}  = "Lorem ipsum dolor sit amet"
let g:template{'_'}{'lorem6'}  = "Lorem ipsum"
let g:template{'_'}{'lorem'}  = g:template{'_'}{'lorem0'}

" Vim templates
let g:template{'vim'}{'fun'} = "function! ()\<CR>endfunction\<Up>\<End>\<Left>\<Left>"

" rails - erb
"let g:template{'_'}{'rr'}  = "<%  -%>\<Left>\<Left>\<Left>\<Left>"
"let g:template{'_'}{'re'}  = "<%=  -%>\<Left>\<Left>\<Left>\<Left>"
"let g:template{'_'}{'rrr'} = "<%  %>\<Left>\<Left>\<Left>"
"let g:template{'_'}{'rre'} = "<%=  %>\<Left>\<Left>\<Left>"
"let g:template{'_'}{'cc'} = "/*  */\<Left>\<Left>\<Left>"
"let g:template{'_'}{'hh'} = "<!--  -->\<Left>\<Left>\<Left>\<Left>"
"let g:template{'_'}{'le'} = "{{  }}\<Left>\<Left>\<Left>"
"let g:template{'_'}{'ll'} = "{%  %}\<Left>\<Left>\<Left>"

" rails rspec
let g:template{'ruby'}{'rde'} = "describe \"\" do\n  \n\<BS>end\n\<Up>\<Up>\<Up>" . repeat("\<RIGHT>", 10)
let g:template{'ruby'}{'rit'} = "it \"should \" do\n  \n\<BS>end\n\<BS>\<Up>\<Up>\<Up>" . repeat("\<RIGHT>", 13)
let g:template{'ruby'}{'rbe'} = "before(:each) do\n  \n\<BS>end\n\<Up>\<Up>" . repeat("\<RIGHT>", 2)
let g:template{'ruby'}{'rbea'} = "before do\n  \n\<BS>end\n\<Up>\<Up>" . repeat("\<RIGHT>", 2)
let g:template{'ruby'}{'rhe'} = "module SpecHelper\<CR>  def valid_attributes\<CR>  {\<CR>  : => '',\<CR>\<BS>}\<CR>\<BS>end\<CR>\<BS>end\<CR>" . repeat("\<UP>", 7) . repeat("\<RIGHT>", 7)

" css
let g:template{'css'}{'cl'}  = ". {\<CR>  \<CR>\<BS>}\<UP>\<UP>"
let g:template{'css'}{'id'}  = "# {\<CR>  \<CR>\<BS>}\<UP>\<UP>"
let g:template{'css'}{'ta'}  = " {\<CR> \<CR>\<BS>}\<UP>\<UP>\<Left>"
let g:template{'css'}{'fl'}  = "float: left;\<CR>display: inline;\<CR>"
let g:template{'css'}{'fr'}  = "float: right;\<CR>display: inline;\<CR>"
let g:template{'css'}{'bg'}  = "background: url(../images/.gif) left top no-repeat;" . repeat("\<Left>", 25)
let g:template{'css'}{'bn'}  = "background: none;"
let g:template{'css'}{'bgc'} = "background-color: #;\<Left>"
let g:template{'css'}{'bo'}  = "border: solid 1px #;\<Left>"
let g:template{'css'}{'c'}   = "color: #;\<Left>"
let g:template{'css'}{'fs'}  = "font-size: em;\<Left>\<Left>\<Left>"
let g:template{'css'}{'fb'}  = "font-weight: bold;"
let g:template{'css'}{'fn'}  = "font-weight: normal;"
let g:template{'css'}{'di'}  = "display: inline;"
let g:template{'css'}{'db'}  = "display: block;"
let g:template{'css'}{'dn'}  = "display: none;"
let g:template{'css'}{'pa'}  = "position: absolute;"
let g:template{'css'}{'pr'}  = "position: relative;"
let g:template{'css'}{'tu'}  = "text-decoration: underline;"
let g:template{'css'}{'tn'}  = "text-decoration: none;"
let g:template{'css'}{'vm'}  = "vertical-align: middle;"

" sass
let g:template{'sass'}{'fl'}  = "float: left\<CR>display: inline\<CR>"
let g:template{'sass'}{'fr'}  = "float: right\<CR>display: inline\<CR>"
let g:template{'sass'}{'bg'}  = "background: url(../images/.gif) left top no-repeat" . repeat("\<Left>", 24)
let g:template{'sass'}{'bn'}  = "background: none"
let g:template{'sass'}{'bgc'} = "background-color: #"
let g:template{'sass'}{'bo'}  = "border: solid 1px #"
let g:template{'sass'}{'c'}   = "color: #"
let g:template{'sass'}{'fs'}  = "font-size: em\<Left>\<Left>"
let g:template{'sass'}{'fb'}  = "font-weight: bold"
let g:template{'sass'}{'fn'}  = "font-weight: normal"
let g:template{'sass'}{'di'}  = "display: inline"
let g:template{'sass'}{'db'}  = "display: block"
let g:template{'sass'}{'dn'}  = "display: none"
let g:template{'sass'}{'pa'}  = "position: absolute"
let g:template{'sass'}{'pr'}  = "position: relative"
let g:template{'sass'}{'tu'}  = "text-decoration: underline"
let g:template{'sass'}{'tn'}  = "text-decoration: none"
let g:template{'sass'}{'vm'}  = "vertical-align: middle"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" IMAPs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"runtime imaps.vim
"call IMAP('re', '<%= <++> %>', 'eruby')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""" maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute last command
"inoremap <M-:> <C-o>:echo ':' . @: \| execute @:<CR>
"nnoremap <M-:> :echo ':' . @: \| execute @:<CR>

"vnoremap <silent> <M-{> >gv:<C-u>call Enclose('{', 1)<CR>
"vnoremap <silent> <M-/> :<C-u>call Enclose('/', 0)<CR>

let mapleader = "`"
let maplocalleader = "|"

" Alt-Space is System menu
if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif
 
"""""""""" disable middle mouse button pasting
map   <MiddleMouse>    <Nop>
map   <2-MiddleMouse>  <Nop>
map   <3-MiddleMouse>  <Nop>
map   <4-MiddleMouse>  <Nop>
imap  <MiddleMouse>    <Nop>
imap  <2-MiddleMouse>  <Nop>
imap  <3-MiddleMouse>  <Nop>
imap  <4-MiddleMouse>  <Nop>

"""""""""" copy/paste - mostly stolen from mswin.vim
vnoremap <BS> d

vnoremap <C-X> "+x
vnoremap <S-Del> "+x

vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

map <C-V> "+gP
map <S-Insert> "+gP
"cmap <C-V> <C-R>+
"cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"imap <S-Insert>		<C-V>
"vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" For CTRL-V to work autoselect must be off.
" On Unix we have two selections, autoselect can be used.
if !has("unix")
  set guioptions-=a
endif
 
"""""""""" tabs
nnoremap LL :tabmove<CR>:e<CR>
call KeyMap('ni', 'DLM',  '1',       '1gt')
call KeyMap('ni', 'DLM',  '2',       '2gt')
call KeyMap('ni', 'DLM',  '3',       '3gt')
call KeyMap('ni', 'DLM',  '4',       '4gt')
call KeyMap('ni', 'DLM',  '5',       '5gt')
call KeyMap('ni', 'DLM',  '6',       '6gt')
call KeyMap('ni', 'DLM',  '7',       '7gt')
call KeyMap('ni', 'DLM',  '8',       '8gt')
call KeyMap('ni', 'DLM',  '9',       '9gt')
call KeyMap('ni', 'DLM',  't',       ':tabnew<CR>:tabmove<CR>')
call KeyMap('ni', 'DLM',  ']',       'gt')
call KeyMap('ni', 'DLM',  '[',       'gT')
call KeyMap('ni', 'DLM',  '<Left>',  'gT')
call KeyMap('ni', 'DLM',  '<Right>', 'gt')
call KeyMap('ni', 'D',    '<M-Left>',  ':call MoveTabLeft()<CR>')
call KeyMap('ni', 'D',    '<M-Right>', ':call MoveTabRight()<CR>')
"nnoremap <D-C-Left>  :call MoveTabLeft()<CR> 
"nnoremap <D-C-Right> :call MoveTabRight()<CR> 

"""""""""" buffers and files
call KeyMap('ni', 'DLM',  's',       ':up<CR>')
call KeyMap('ni', 'DLM',  'w',       ':bw<CR>')
call KeyMap('ni', 'L',    'b',       ':tab ball<CR>')

"""""""""" selections
call KeyMap('n',  'DM',  'a' ,      'ggVG')
call KeyMap('ni', '',     '<F2>',    ':let @/ = ""\|nohlsearch<CR>')

"""""""""" toggle switches
call KeyMap('ni', 'L',    'a',       ':set wrap!<CR>')
call KeyMap('ni', 'L',    'l',       ':set list!<CR>')
call KeyMap('ni', 'L',    'p',       ':set paste!<CR>')

"""""""""" undo/redo
call KeyMap('ni', 'CD',   'z',       'u')

"""""""""" indenting
"call KeyMap('n',  '',     '<Tab>',   '>>')
"call KeyMap('n',  'S',    '<Tab>',   '<<')
call KeyMap('v',  '',     '<Tab>',   '>gv')
call KeyMap('v',  'S',    '<Tab>',   '<gv')
inoremap <silent> <S-Tab> <C-o><<<C-o>^
call KeyMap('v',  '',     '>>',   '>gv')
call KeyMap('v',  '',     '<<',   '<gv')

call KeyMap('ni', 'M',    '<Up>',    ':call SwapUp()<CR>')
call KeyMap('ni', 'M',    '<Down>',  ':call SwapDown()<CR>')

"""""""""" misc
inoremap <silent> <Space> <C-R>=ExpandTemplate(1)<CR>
inoremap <silent> > <C-R>=ExpandTag('>')<CR>
inoremap <C-space> <C-p>
call KeyMap('ni', '',     '<Home>',  ':call HomeKey()<CR>')

call KeyMap('n',  'CDLM', '-',       ':call CwdUp()<CR>')
call KeyMap('n',  'CDLM', '=',       ':call CwdDown()<CR>')
call KeyMap('n',  'CDLM', '0',       ':call CwdCurrent()<CR>')

"""""""""" <3 _
" helpers to use _ like a word boundary
nnoremap cr  ct_
nnoremap vr  vt_
nnoremap yr  yt_
nnoremap dr  dt_
nnoremap gur gut_
nnoremap gUr gUt_


nnoremap car  bct_
nnoremap var  bvt_
nnoremap yar  byt_
nnoremap dar  bdt_
nnoremap guar bgut_
nnoremap gUar bgUt_

nnoremap cir  F_lct_
nnoremap vir  F_lvt_
nnoremap yir  F_lyt_
nnoremap dir  F_ldt_
nnoremap guir F_lgut_
nnoremap gUir F_lgUt_

nnoremap >t vat>
nnoremap <t vat<

"inoremap <ESC> <TAB><BS><ESC>
inoremap <S-CR> <C-o>o
inoremap <D-CR> <C-o>O

"""""""""" tools
call KeyMap('ni', 'L',    'f',       ':let @+ = expand("%:p")<CR>')   " copy current filename in clipboard
" TODO
" move these to a function
call KeyMap('ni', 'L',    'e',       ':call BrowserFromCurrentDir()<CR>') " open a file browser in a new tab
call KeyMap('ni', 'L',    'E',       ':call BrowserFromCurrentFilePath()<CR>') " open a file browser in a new tab
call KeyMap('ni', 'L',    'q',       ':exec "NERDTreeToggle " . getcwd()<CR>') " Toggle NERDTree
"call KeyMap('ni', 'L',    'x',       ':ExtractFileToTabpage()<CR>')   " extract current file to a new buffer
call KeyMap('n',  'L',    'r',       ':%s/\n\n/\r/<CR>')
call KeyMap('v',  'L',    'r',       ':s/\n\n/\r/<CR>')
call KeyMap('n',  'L',    'R',       ':%s/\s\s*$//<CR>')
call KeyMap('v',  'L',    'R',       ':s/\s\s*//<CR>')

call KeyMap('n',  'L',    'c',       ':%s/^/#/<CR>')
call KeyMap('v',  'L',    'c',       ':s/^/#/<CR>')
call KeyMap('n',  'L',    'C',       ':%s/^\s*#//<CR>')
call KeyMap('v',  'L',    'C',       ':s/^\s*#//<CR>')

if has("macunix")
  call KeyMap('n',  'DLM',  'k',       ':call GuiSizeNext()<CR>')
  call KeyMap('n',  'DLM',  'K',       ':call GuiSizePrev()<CR>')
  call KeyMap('n',  'LM',   'F11',     ':call ToggleFullSCreen()<CR>')
endif
call KeyMap('nv', 'L',    'y',       '<ESC>:call Yaml_to_spec()<CR>')
call KeyMap('n',  'L',    '`',       ':NERDTreeToggle<CR>')
"call KeyMap('in', 'L',    '/',       '<C-x>/')
"inoremap <Leader>/ <C-x>/
"ab // /

map <leader>hl  :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

