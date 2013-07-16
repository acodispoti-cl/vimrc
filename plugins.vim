" PLUGINS CONFIG
" calendar
"map <leader>ca :Calendar<CR>
"let g:calendar_list = [
"\   {'name': 'Tasks', 'path': $HOME.'/.vim/.tasks', 'ext': 'task'},
"\   {'name': 'Diary', 'path': $HOME.'/.vim/.diary', 'ext': 'diary'},
"\ ]
"let g:calendar_current_idx = 1

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cache_dir = $HOME.'/.vim/.ctrlp_cache'
let g:ctrlp_follow_symlinks = 1

nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>m :CtrlPMRUFiles<CR>

let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

" easymotion
let g:EasyMotion_leader_key = '<Leader>e'
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" fugitive
nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gd :Gdiff<CR>
nmap <silent> <leader>gc :Gcommit<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :Glog<CR>
nmap <silent> <leader>gp :Git push<CR>

" indentline
let g:indentLine_char = '│'

" less
nmap <Leader>css :w <BAR> !lessc % > %:t:r.css<CR><space>

" markdown preview
nmap <silent><leader>p :MDP<CR>
let g:MarkdownPreviewTMP = $HOME.'/Sites/'

" NERDcommenter
let NERDSpaceDelims=1

" NERDTree
nmap <silent><Leader>nt :NERDTreeToggle<CR>
let g:NERDTreeBookmarksFile = expand($HOME.'/.vim/.NERDTreeBookmarks')
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeChDirMode = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 45
let g:NERDTreeChristmasTree = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMouseMode=2
let g:NERDTreeIgnore=[
      \'\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
      \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]

" powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
if &t_Co >= 256 || g:OS#gui
  let g:Powerline_symbols = 'fancy'
endif

" rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" sexy scroller
if g:OS#unix
  let g:SexyScroller_EasingStyle = 1
endif

" syntastic
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_auto_jump=0
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" tabularize
if exists(":Tabularize")
  vmap <Leader>t=  :Tabularize /=<CR>
  vmap <Leader>t3  :Tabularize /#<CR>
  vmap <Leader>t'  :Tabularize /'<CR>
  vmap <Leader>t'' :Tabularize /"<CR>
  vmap <Leader>t0  :Tabularize /)/r1c1l0<CR>
  vmap <Leader>t== :Tabularize /=/r1c1l0<CR>
  vmap <Leader>t:  :Tabularize /:\zs<CR>
endif

" tagbar
if g:OS#mac
  "how to install ctag mac https://weblion.psu.edu/trac/weblion/wiki/MacVim
  let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
endif
let g:tagbar_width = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_expand = 0
nmap <silent><leader>T :TagbarToggle<CR>

" undotree
nmap <leader>u :UndotreeToggle<CR>

" ultisnips
if g:OS#gui
  let g:UltiSnipsExpandTrigger="<C-Space>"
  let g:UltiSnipsJumpForwardTrigger="<C-Space>"
else
  let g:UltiSnipsExpandTrigger="<C-@>"
  let g:UltiSnipsJumpForwardTrigger="<C-@>"
endif

" YouCompleteMe
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_add_preview_to_completeopt = 1
