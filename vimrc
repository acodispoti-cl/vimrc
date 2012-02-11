" Global "{{{
    " General "{{{
        set nocompatible                   " explicitly get out of vi-compatible mode
        set history=100                    " keep 100 lines of command line history
        set clipboard=unnamed              " use clipboard register ‘*’ for all y, d, c, p ops
        set timeoutlen=700                 " Time to wait after ESC (default causes an annoying delay)
        set backspace=2                    " make backspace work normal
        set nostartofline                  " don't jump to first character when paging
        set report=0                       " tell us when anything is changed via :...0
        set hid                            " you can change buffers without saving
        set autowrite                      " Auto save before commands like next and make
        set autoread                       " Set to auto read when a file is changed from the outside
        set fileformats=unix,mac,dos       " support all three, in this order
        set encoding=utf-8
        set printoptions=paper:a4,syntax:n " controls the default paper size and the printing of syntax highlighting (:n -> none)
        set scrolloff=5                    " set X lines to the curors - when moving vertical..
        set sidescrolloff=3
        set diffopt=filler                 " Add vertical spaces to keep right and left aligned
        set diffopt+=iwhite                " Ignore whitespace changes (focus on code changes)
        set esckeys                        " Allow cursor keys in insert mode.
        set ttyfast                        " smoother changes
        " When vimrc is edited, reload it"{{{
            autocmd! bufwritepost .vimrc source %
        "}}}
        " Suffixes that get lower priority when doing tab completion for filenames "{{{
        " These are files we are not likely to want to edit or read.
            set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.exe
        "}}}
        " No bell or flash wanted "{{{
            set novisualbell " No blinking
            set noerrorbells " No noise.
            set vb t_vb=     " disable any beeps or flashes on error
        "}}}
        " Enable mouse"{{{
            set mouse=a
            set mousemodel=popup
            set mousehide
        "}}}
    "}}}
    " Plugins Manager "{{{
    " To disable a plugin, add it's bundle name to the following list
        filetype off                 " deactivate filetype auto detection before loading bundles to force a reload
        " Pathogen "{{{
            call pathogen#runtime_append_all_bundles()
        "}}}
        " Vundle "{{{
            call vundle#rc()
        "}}}
        filetype plugin indent on    " automatically load filetypeplugins
    "}}}
    " Editor Settings "{{{
        set shortmess=atI        " shortens messages to avoid 'press a key' prompt
        set lazyredraw           " do not redraw while running macros (much faster) (Lazy Redraw)
        set equalalways          " Close a split window in Vim without resizing other windows
        set guitablabel=%t
        set number               " turn on line numbers
        set linespace=0          " space it out a little more (easier to read)
        set cmdheight=1          " the command bar is 1 high
        set pumheight=10         " Keep a small completion window
        set laststatus=2         " always show statusline
        set guicursor=a:blinkon0 " cursor-blinking off!!
        set showmode             " If in Insert, Replace or Visual mode put a message on the last line.
        set complete=.,w,b,u,t,i
        set completeopt+=longest
        " wildmode "{{{
            set wildmenu           " nice tab-completion on the command line
            set wildmode=longest:full,list:full
            set wildignore+=*.o,*.a,*.so,*.obj,*.exe,*.lib,*.ncb,*.opt,*.plg,.svn,.git,.hg,.app
        "}}}
        " chars to show for list "{{{
            "set list
            set listchars=tab:→\ ,eol:·
            "set listchars=tab:▸\ ,eol:¬
            "set listchars=tab:>-,trail:·,eol:$
            set listchars+=extends:»,precedes:«
        "}}}
    "}}}
    " Appearance Settings "{{{
        " switch syntax highlighting on, when the terminal has colors "{{{
            if &t_Co > 2 || has('gui_running')
                syntax on
                set t_Co=256
            endif
        "}}}
        " default colorscheme "{{{
            if &t_Co >= 256 || has('gui_running')
                set background=dark
                colorscheme molokai
                "colorscheme eddie
                "colorscheme ambient
                "colorscheme aldmeris
                "colorscheme darkspectrum
                "colorscheme zenburn
                "colorscheme vividchalk
                "colorscheme getafe
                "colorscheme jellybeans
            else
                colorscheme default
            endif
        "}}}
        " GUI options "{{{
            if has('gui_running')
                set lines=50 columns=88
                " guioptions "{{{
                    " m = Menubar
                    " T = Toolbar
                    " t = tearoff menus
                    " a = autoselect
                    " A = -"- only for modeless
                    " c = use console dialogs
                    " f = foreground
                    " g = Grey Menu Items
                    " i = Icon
                    " v = buttons are vertical
                    " e = tabs in gui
                    " This has to be set early
                    " r = show right scroll bar
                    " L = show left scrollbar on split
                    " i = icon
                    set guioptions-=T
                "}}}
                " Linux "{{{
                if has('gui_gtk')
                    set guioptions-=m
                    nnoremap <F8> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
                    set gfn=Liberation\ Mono\ 9
                endif
                "}}}
                " Mac "{{{
                if has('gui_mac') || has('gui_macvim')
                    set guifont=Menlo:h12
                endif
                "}}}
            endif
        "}}}
    "}}}
    " Language Settings "{{{
        highlight SpellBad term=underline gui=undercurl guisp=Orange
        " the following line makes vim ignore camelCase and CamelCase words"{{{
        " so they are not highlighted as spelling mistakes
            au Syntax * syn match CamelCase "\(\<\|_\)\%(\u\l*\)\{2,}\(\>\|_\)\|\<\%(\l\l*\)\%(\u\l*\)\{1,}\>" transparent containedin=.*Comment.*,.*String.*,VimwikiLink contains=@NoSpell contained
        "}}}
    "}}}
    " Files, backups and undo "{{{
    " Turn backup off, since most stuff are in git anyway...
        set nobackup
        set nowb
        set noswapfile
        " enable persistent undo"{{{
        if has('persistent_undo')
            set undodir=$HOME/.vim/.undofile
            set undofile
            set undolevels=100   "maximum number of changes that can be undone
            set undoreload=10000 "maximum number lines to save for undo on a buffer reload
            if ! isdirectory(&undodir)
                call mkdir(&undodir, 'p')
            endif
        endif
    "}}}
    "}}}
    " Text, tab and indent related "{{{
        set shiftwidth=4 " number of spaces for autoindentation
        set tabstop=4
        set smarttab     " insert spaces only at the beginning of the line
        set smartindent  " always set smartindenting on
        set autoindent   " always set autoindenting on
        set expandtab    " use space when <tab> is pressed
        " Highlight problematic whitespace (spaces before tabs) {{{
        hi RedundantSpaces ctermfg=214 ctermbg=160 cterm=bold
        match RedundantSpaces / \+\ze\t/
    " }}}
    "}}}
    " wrap "{{{
        set textwidth=79
        set nowrap             " word wrap
        set wrapscan           " Searches wrap around end of file
        set display=lastline   " don't display @ with long paragraphs
        set lbr                " line break
        set whichwrap+=<,>,h,l " whichwrap -- left/right keys can traverse up/down
    "}}}
    " search config "{{{
        set ignorecase      " select case-insenitiv search
        set smartcase       " No ignorecase if Uppercase chars in search
        set magic           " change the way backslashes are used in search patterns
        set showmatch       " jump to matches during entering the pattern
        set matchtime=2     " How many tenths of a second to blink
        set matchpairs+=<:> " these tokens belong together
        set hlsearch        " highlight all matches...
        set incsearch       " ...and also during entering the pattern
        set gdefault        " By default add g flag to search/replace. Add g to toggle.
        nohlsearch          " avoid highlighting when reloading vimrc
    "}}}
    " folding "{{{
        set foldenable
        "set foldclose=all
        set foldmethod=marker " Markers are used to specify folds.
        set foldlevel=0
    "}}}
"}}}
" Keymappings "{{{
    " Set mapleader
    let mapleader=","
    let g:mapleader=","
    " F2 = Paste Toggle (in insert mode, pasting indented text behavior changes) "{{{
        set pastetoggle=<F2>
    "}}}
    " search+replace word under cursor "{{{
        nnoremap <C-h> :,$s/\<<C-R><C-W>\>/
    "}}}
    "calculate the value in one line "{{{
        map <silent><Leader>cl :call CalcLine(".")<CR>
    "}}}
    " spacebar create/open/close folding "{{{
        nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
        vnoremap <Space> zf
    "}}}
    " Fast editing of .vimrc "{{{
        map <leader>cfg :e! ~/.vimrc <cr>
    "}}}
    " enable/disable list "{{{
        nmap <silent> <leader>L :set nolist!<CR>
    "}}}
    " ,/ turn off search highlighting "{{{
        nmap <leader>/ :nohl<CR>
    "}}}
    "Map escape key to jj -- much faster "{{{
        imap jj <esc>
    "}}}
    " Vertically split window and select it "{{{
        nnoremap <Leader><Leader>w :call SplitScreen()<cr>
    " }}}
    " Sudo to write "{{{
        cmap W :w !sudo tee % >/dev/null
    "}}}
    " Quick yanking to the end of the line"{{{
        nmap Y y$
    "}}}
    " Quick alignment of text"{{{
        nmap <leader>al :left<CR>
        nmap <leader>ar :right<CR>
        nmap <leader>ac :center<CR>
    "}}}
    " Toggle Spellcheck "{{{
        nmap <silent><Leader>ss :call ToggleSpell()<CR>
    "}}}
    " Spell commands "{{{
        map <leader>sn ]s
        map <leader>sp [s
        map <leader>sa zg
        map <leader>s? z=
    "}}}
    " Use tab to indent a line "{{{
        vmap <TAB> >gv
        vmap <S-TAB> <gv
    "}}}
    "  Moving Between Windows "{{{
        nnoremap <Leader>h <C-w>h
        nnoremap <Leader>l <C-w>l
        nnoremap <Leader>j <C-w>j
        nnoremap <Leader>k <C-w>k
    "}}}
    "  When pressing <leader>cd switch to the directory of the open buffer "{{{
        map <leader>cd :cd %:p:h<cr>
    "}}}
"}}}
" Plugins Bundle "{{{
    Bundle 'DrawIt'
    Bundle 'EasyGrep'
    Bundle 'EasyMotion'
    Bundle 'Gundo'
    Bundle 'Tagbar'
    Bundle 'YankRing.vim'
    Bundle 'buftabs'
    Bundle 'matchit.zip'
    Bundle 'scratch.vim'
    Bundle 'gmarik/vundle'
    Bundle 'godlygeek/tabular'
    Bundle 'gregsexton/VimCalc'
    Bundle 'honza/snipmate-snippets'
    Bundle 'hotoo/calendar-vim'
    Bundle 'jiangmiao/auto-pairs'
    Bundle 'kien/ctrlp.vim'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'mkitt/markdown-preview.vim'
    Bundle 'roman/golden-ratio'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/syntastic'
    Bundle 'neocomplcache'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-markdown'
    Bundle 'visualstar.vim'
    Bundle 'xolox/vim-easytags'
"}}}
" Plugins Config "{{{
    " buftabs "{{{
        let g:buftabs_only_basename=1
        noremap <C-left> :bprev<CR>
        noremap <C-right> :bnext<CR>
    "}}}
    "calendar "{{{
        nmap <leader>ca :Calendar<CR>
        let g:calendar_list = [
            \   {'name': 'Tasks', 'path': $HOME.'/.vim/.tasks', 'ext': 'task'},
            \   {'name': 'Diary', 'path': $HOME.'/.vim/.diary', 'ext': 'diary'},
        \ ]
        let g:calendar_current_idx = 1
    "}}}
    " easygrep "{{{
        let g:EasyGrepMode=2
        let g:EasyGrepCommand=1
        let g:EasyGrepRecursive=1
        let g:EasyGrepOpenWindowOnMatch=1
    "}}}
    " easymotion "{{{
        let g:EasyMotion_leader_key = '<Leader>m'
        hi link EasyMotionTarget ErrorMsg
        hi link EasyMotionShade  Comment
    "}}}
    " easytags "{{{
        if has("gui_macvim")
            let g:easytags_cmd = '/usr/local/bin/ctags'
        end
        let g:easytags_cmd = '/usr/bin/ctags'
        let g:easytags_file = $HOME.'/.vim/.tags'
        let g:easytags_updatetime_autodisable = 1
    "}}}
    " gundo "{{{
        nmap <leader>u :GundoToggle<CR>
        let g:gundo_width = 50
        let g:gundo_right = 1
    "}}}
    " markdown preview "{{{
        nmap <silent><leader>p :MDP<CR>
        let g:MarkdownPreviewTMP = $HOME.'/Sites/'
    "}}}
    " ctrlp "{{{
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cache_dir = $HOME.'/.vim/.ctrlp_cache'
        let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
        let g:ctrlp_max_height = 15
        let g:ctrlp_clear_cache_on_exit = 1

        nmap <leader>pb :CtrlPBuffer<CR>
        nmap <leader>pm :CtrlPMRUFiles<CR>

        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
    "}}}
    " NERDTree "{{{
        nmap <silent><Leader>nt :NERDTreeToggle<CR>
        let NERDTreeBookmarksFile = expand($HOME.'/.vim/.NERDTreeBookmarks')
        let NERDTreeShowBookmarks = 1
        let NERDTreeWinPos = "right"
        let NERDTreeWinSize = 45
        let g:NERDTreeChristmasTree = 1
        let g:NERDTreeCaseSensitiveSort = 1
        let g:NERDTreeQuitOnOpen = 1
        let NERDTreeMouseMode=2
        let NERDTreeIgnore=[
                    \'\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
                    \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]
    "}}}
     " neocomplcache "{{{
     " Disable AutoComplPop.
     let g:acp_enableAtStartup = 0
     " Use neocomplcache.
     let g:neocomplcache_enable_at_startup = 1
     " Use smartcase.
     let g:neocomplcache_enable_smart_case = 1
     " Use camel case completion.
     let g:neocomplcache_enable_camel_case_completion = 1
     " Use underbar completion.
     let g:neocomplcache_enable_underbar_completion = 1
     " Set minimum syntax keyword length.
     let g:neocomplcache_min_syntax_length = 3
     let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

     let g:neocomplcache_snippets_dir = $HOME.'/.vim/bundle/snipmate-snippets/snippets/'
     let g:neocomplcache_temporary_dir = $HOME.'/.vim/.neocon'

     " Define keyword.
     if !exists('g:neocomplcache_keyword_patterns')
         let g:neocomplcache_keyword_patterns = {}
     endif
     let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

     " Plugin key-mappings.
     imap <C-CR>     <Plug>(neocomplcache_snippets_expand)
     smap <C-CR>     <Plug>(neocomplcache_snippets_expand)
     inoremap <expr><C-g>     neocomplcache#undo_completion()
     inoremap <expr><C-l>     neocomplcache#complete_common_string()

     " SuperTab like snippets behavior.
     "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

     " Recommended key-mappings.
     " <TAB>: completion.
     inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
     " <C-h>, <BS>: close popup and delete backword char.
     inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
     inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
     inoremap <expr><C-y>  neocomplcache#close_popup()
     inoremap <expr><C-e>  neocomplcache#cancel_popup()

     " Enable omni completion.
     autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
     autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
     autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
     autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
     autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

     " Enable heavy omni completion.
     if !exists('g:neocomplcache_omni_patterns')
         let g:neocomplcache_omni_patterns = {}
     endif
     let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
     "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
     let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
     let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
     let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
     "}}}
    " powerline "{{{
        let g:Powerline_symbols = 'fancy'
        "let g:Powerline_cache_file = ""
    "}}}
    " tabularize "{{{
        if exists(":Tabularize")
            nmap <Leader>a= :Tabularize /=<CR>
            vmap <Leader>a= :Tabularize /=<CR>
            nmap <Leader>a: :Tabularize /:\zs<CR>
            vmap <Leader>a: :Tabularize /:\zs<CR>
        endif
    "}}}
    " tagbar "{{{
        if has("gui_macvim")
            "how to install ctag mac https://weblion.psu.edu/trac/weblion/wiki/MacVim
            let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
        end

        nmap <silent><leader>T :TagbarToggle<CR>

        let g:tagbar_width = 30
        let g:tagbar_autoclose = 1
        let g:tagbar_autofocus = 1
        let g:tagbar_compact = 1
        let g:tagbar_expand = 1
    "}}}
    " scratch "{{{
        " toggle scratch window
        function! ToggleScratch()
            if expand('%') == g:ScratchBufferName
                quit
            else
                Sscratch
            endif
        endfunction

        nmap <leader>s :call ToggleScratch()<CR>
    "}}}
    " syntastic "{{{
        let g:syntastic_enable_signs=1
        let g:syntastic_auto_loc_list=1
        let g:syntastic_auto_jump=1
    "}}}
    " yankring "{{{
        nmap <silent><Leader>yr :YRShow<cr>
        let g:yankring_replace_n_pkey = '<m-p>'
        let g:yankring_replace_n_nkey = '<m-n>'
        let g:yankring_ignore_operator = 'g~ gu gU ! = gq g? > < zf g@'
        let g:yankring_history_file = '/.vim/.yankring_history'
        let g:yankring_map_dot = 0
    "}}}
"}}}
" Functions "{{{
    function! LastModified() "{{{
        if &modified
            let save_cursor = getpos(".")
            let n = min([20, line("$")])
            exe '1,' . n . 's#^\(.\{,10}Last Change:\).*#\1'
                        \ strftime("%a %d/%b/%Y hs %H:%M") . '#e'
            call setpos('.', save_cursor)
        endif
    endfun
    autocmd BufWritePre * call LastModified()
    "}}}
    function! SplitScreen() "{{{
        let col = &columns
        if (col < 89)
            set columns=166
            vsplit
        else
            execute "normal \<C-w>c"
            set columns=88
        endif
    endfunctio
    "}}}
    " Spell Check "{{{
    let b:myLang=0
    let g:myLangList=["disable","pt","en"]
    function! ToggleSpell()
        let b:myLang=b:myLang+1
        if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
        if b:myLang==0
            setlocal nospell
        else
            execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
        endif
        echo "spell checking language:" g:myLangList[b:myLang]
    endfunction
    "}}}
"}}}
" Autocommands "{{{
    if has("autocmd")
        augroup filetypesettings "{{{
            autocmd!
            au FileType c,cpp,h,java        setlocal formatoptions=croql cindent nowrap
            au FileType debchangelog        setlocal expandtab spell spelllang=en
            au FileType mail                setlocal formatoptions=ltcrqna
            au FileType txt                 setlocal formatoptions=ltcrqno2
            au FileType asciidoc,mkd,tex    setlocal formatoptions=ltcrqn
            au FileType xml,docbk,xhtml,jsp setlocal formatoptions=lcrq
            au FileType ruby                setlocal shiftwidth=2
            au FileType help                setlocal nolist textwidth=0
            au FileType org                 setlocal foldminlines=0 foldlevel=1
            au FileType html                setlocal shiftwidth=2 tabstop=2
            au FileType python              setlocal expandtab shiftwidth=4 softtabstop=4

            " when enabling diff for a buffer it should be disabled when the
            " buffer is not visible anymore
            au BufHidden * if &diff == 1 | diffoff | setlocal nowrap | endif

            " Special handling of Makefiles
            au FileType automake,make setlocal list noexpandtab

            " insert a prompt for every changed file in the commit message
            "au FileType svn :1![ -f "%" ] && awk '/^[MDA]/ { print $2 ":\n - " }' %
        augroup END
        "}}}
        "Mark as error two identical words separated by space"{{{
            syntax match DoubleWordErr "\c\<\(\a\+\)\_s\+\1\>"
        "}}}
        "Automatically removing all trailing whitespace"{{{
            autocmd BufWritePre * :%s/\s\+$//e
        "}}}
        " jump to the last position when reopening a file "{{{
        augroup JumpCursorOnEdit
            au!
            autocmd BufReadPost *
                        \ if expand("<afile>:p:h") !=? $TEMP |
                        \ if line("'\"") > 1 && line("'\"") <= line("$") |
                        \ let JumpCursorOnEdit_foo = line("'\"") |
                        \ let b:doopenfold = 1 |
                        \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
                        \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
                        \ let b:doopenfold = 2 |
                        \ endif |
                        \ exe JumpCursorOnEdit_foo |
                        \ endif |
                        \ endif
            " Need to postpone using "zv" until after reading the modelines.
            autocmd BufWinEnter *
                        \ if exists("b:doopenfold") |
                        \ exe "normal zv" |
                        \ if(b:doopenfold > 1) |
                        \ exe "+".1 |
                        \ endif |
                        \ unlet b:doopenfold |
                        \ endif
        augroup END
        "}}}
    endif
"}}}