" SET COLOR

set t_Co=16
set t_Sf=[3%p1%dm
set t_Sb=[4%p1%dm

" SET STD C SYNTAX
let c_cpp_comments = 0

let c_syntax_for_h = 1
let c_C94 = 1
let c_C99_warn = 1
let c_cpp_warn = 1
let c_warn_8bitchars = 1
let c_warn_multichar = 1
let c_warn_digraph = 1
let c_warn_trigraph = 1
let c_no_octal = 1

let c_comment_strings = 1
let c_comment_numbers = 1
let c_comment_types = 1
let c_comment_date_time = 1

" SET FUNC ShowBlockName()
"  au CursorHold * call ShowBlockName('quiet')

  " Show the name of the function we're in on the message line; pnuemonic [[
  map <silent> g[[ :call ShowBlockName()<CR>

  " Disable ShowBlockName (once); to prevent the CursorHold autocommand from
  " overwriting something in the command window (e.g., SyntaxAttr() output).
  map <silent> g]] :call ShowBlockName('OFF')<CR>


  " Tweak commands like [d so that they disable ShowBlockName so
  " it doesn't obliterate the output of this command.
  nnoremap [d :call ShowBlockName('[d')<CR>
  nnoremap [i :call ShowBlockName('[i')<CR>

autocmd FuncUndefined * exe 'runtime autoload/' . expand('<afile>') . '.vim'
" remove all trailing spaces (space or tab) before saving a file
" autocmd BufWritePre * :%s/\s\+$//e
function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" default color scheme
color solarized

" SET SYNTAX ON
syntax on

set tabstop=4
" set textwidth=70
set expandtab
set shiftwidth=8

" Show line column number "
set ruler
set number
" set autoindent                 " it doesn't work well with Windows clipboard copy-paste.

" Enable backspace in insert mode
set backspace=indent,eol,start

" set ignore case
" set ignorecase

" VIM 7.0
"syntax enable                  " enable syntax highlighting
"set previewheight=12           " set gdb window initial height
"run macros/gdb_mappings.vim    " source key mappings listed in this
                               " document
"set asm=0                      " don't show any assembly stuff
"set gdbprg=gdb\ -q             " set GDB invocation string (default 'gdb')

