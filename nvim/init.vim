"source ~/.config/nvim/avalonia.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/pluginconfigs.vim
source ~/.config/nvim/shortcuts.vim
source ~/.config/nvim/themes.vim

" Set compatibility to Vim only.
"set nocompatible
set nolist
set rnu
" Helps force plug-ins to load correctly when it is turned back on below.
filetype off
" Turn on syntax highlighting.
syntax on
" For plug-ins to load correctly.
filetype plugin indent on
" Turn off modelines
set modelines=0

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Coceal Config
set conceallevel=3
set concealcursor=nvc

"not changing cursor
set guicursor=
" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=1
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Display options
set showmode
set showcmd
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" Show line numbers
set number
" Status bar
set laststatus=2
" Encoding
set encoding=utf-8
" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase
" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Automatically save and load folds
augroup AutoSaveFolds
    autocmd!
    " view files are about 500 bytes
    " bufleave but not bufwinleave captures closing 2nd tab
    " nested is needed by bufwrite* (if triggered via other autocmd)
    " BufHidden for for compatibility with `set hidden`
    autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
augroup end
set viewoptions=folds,cursor
set sessionoptions=folds


" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
au BufNewFile,BufRead *.xaml set filetype=xml
" == AUTOCMD END ================================
autocmd FileType * command! -nargs=0 Prettier :CocCommand prettier.formatFile

"autocmd BufNewFile,BufRead *.txt,*.md,*.json setlocal concealcursor=nvc conceallevel=3
autocmd FileType markdown,json let g:indentLine_enabled=0
