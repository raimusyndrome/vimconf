" Vim 個人設定
" 
" by raimusyndrome
" 
"---------------------------------------------------------------------------
" 初期化
autocmd!
" vim設定リポジトリのディレクトリ
if has('win32') || has('win64') 
    let $MYVIMREPO = $VIM . '/vimconf'
else
    let $MYVIMREPO = $HOME . '/.vim/vimconf'
endif
" マシン依存設定の識別子
" if filereadable($MYVIMREPO . '/machine_depend.vim')
if filereadable( $MYVIMREPO . '/machine_depend.vim')
    source $MYVIMREPO/machine_depend.vim
endif

" userautoloadディレクトリ
" 分割した設定ファイルをuserautoloadに置き、
" このコマンドでフォルダに入れたすべての設定ファイルが自動的に読み込まれる。
" :runtime! $HOME/userAutoload/*.vim

"---------------------------------------------------------------------------
" カラーに関する設定
"
" デフォルトカラー
colorscheme default
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (GUI使用時)
" uniteの一覧の色を見やすく変更
highlight Pmenu ctermbg=5 guibg=DarkMagenta
" color variation
"highlight Pmenu ctermbg=white
"highlight Pmenusel cterm=underline ctermfg=blue ctermbg=white

" カーソル行の強調表示
if v:version >= 700
 set cursorline "カーソル行を強調
 highlight CursorLine guibg=lightblue ctermbg=lightgray
endif
syntax on "シンタックスハイライト

"---------------------------------------------------------------------------
" 編集・表示設定

" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 行番号を非表示 (number:表示)
set number
" インデントの画面上での幅
set shiftwidth=4
" Tabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set softtabstop=0
" カーソル行の上下表示幅
set scrolloff=5
" ステータスラインの表示
set laststatus=2

"---------------------------------------------------------------------------
" エンコード

" Vim内部の文字コード
if has('win32') || has('win64')
    set encoding=cp932
else
    set encoding=utf-8
endif
"set encoding=euc-jp
" ターミナルの文字コード
set termencoding=utf-8
"set termencoding=eud-jp
" ファイルのデフォルト文字コード
set fileencoding=utf-8
" 解釈可能な文字コード
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932,sjis,cp20932,ucs-bom
" デフォルトのEOL
if has('win32') || has('win64')
    set fileformat=dos
else
    set fileformat=unix
endif
" 解釈可能なEOL
set fileformats=unix,dos,mac


"---------------------------------------------------------------------------
" バックアップ設定
"
" バックアップをとる
set backup
"set nobackup
" バックアップファイルを作るディレクトリ(dir)
if exists("g:my_backup_dir")
    let &backupdir = g:my_backup_dir
else
    set backupdir=$HOME
endif
" スワップファイルを作るディレクトリ(dir)
" バックアップディレクトリと同じディレクトリにスワップを作成する
let &directory = &backupdir 
" 無限UNDO
if has('persistent_undo')
    if exists('g:my_undo_dir')
        let &undodir = g:my_undo_dir
    else
        set undodir = $HOME
    endif
    set undofile
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定
"
" ウインドウの幅
set columns=155
" ウインドウの高さ
set lines=45
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

"---------------------------------------------------------------------------
" ファイルタイプ設定

"filetype indent on "ファイルタイプによるインデントを行う
"filetype plugin on "ファイルタイプによるプラグインを使う
" ファイルタイプに応じてテンプレートを自動読み込み
"autocmd BufNewFile * silent! 0r $VIM/templates/%:e.tpl
" バッファを開いた時に、カレントディレクトリを自動で移動
"autocmd BufEnter * execute ":lcd " . expand("%:p:h")
" 保存時にタグを作成する
" autocmd BufWritePost *.c,*.cc,*.cpp,*.h silent !ctags -a --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ <afile>

" インクルード補完用設定（C++）
" augroup cpp-path
    " autocmd!
    " autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/usr/lib/c++/v1
" augroup END

"---------------------------------------------------------------------------
" キーバインド
"
" カーソル移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>

" ウィンドウ分割・移動
nnoremap <silent> <F4> :<C-u>sp<CR>
nnoremap <silent> <S-F4> :<C-u>vs<CR>
nnoremap <F5> <C-w>w
inoremap <F5> <ESC><C-w>w

" ディレクトリ移動(dir)
" %:h=バッファのファイルがあるディレクトリのパス
nnoremap [ChDir] <Nop>
nmap jd [ChDir]
" バッファのファイルがあるディレクトリに移動
nnoremap <silent> [ChDir]b :<C-u>cd %:h<CR>

" ファイルを開く
" %=バッファのファイルパス
" %<=拡張子を除いたバッファのファイルパス
" %:t=バッファのファイル名

" ヘッダファイルを開く
nnoremap jfh :<C-u>find %<.h<CR>
" autocmd FileType cpp nnoremap <buffer> jfc :<C-u>find %<.cpp<CR>
autocmd FileType cpp nnoremap <buffer> jfc :<C-u>find %<.c<CR>
" autocmd FileType c nnoremap <buffer> jfc :<C-u>find %<.c<CR>

" 設定ファイル読み込み
nnoremap lrc :<C-u>source $MYVIMRC<CR>
" 設定ファイル編集
if has('win32') || has('win64')
    nnoremap erc :<C-u>e $MYVIMREPO\vimrc<CR>
else
    nnoremap erc :<C-u>e $MYVIMRC<CR>
endif

" qでウィンドウを閉じる
autocmd FileType help,twitvim,taglist nnoremap <buffer> q <C-w>c
" エラーメッセージを表示
"nnoremap <C-M> :messages<CR>
" カーソル行をコメントアウト
"autocmd FileType vim  nnoremap <buffer> <C-@> I"<ESC>

"---------------------------------------------------------------------------
" プラグイン

"==========================================================================
" プラグイン管理
" neobundle.vim 
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~\\vimfiles\\bundle\\neobundle.vim
    call neobundle#rc(expand('~/vimfiles/neobundle'))
endif

" 必須　------------------------------------------------------------------
" プラグイン管理
NeoBundleFetch 'https://github.com/Shougo/neobundle.vim.git'
" ユーティリティ
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/tsukkee/unite-tag'
" NeoBundle 'https://github.com/h1mesuke/unite-outline'
NeoBundle 'https://github.com/Shougo/unite-outline'
NeoBundle 'https://github.com/tsukkee/unite-help'
NeoBundle 'https://github.com/osyo-manga/unite-quickfix.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/scrooloose/nerdcommenter'
" NeoBundleLazy 'https://github.com/kana/vim-altr'
NeoBundle 'https://github.com/kana/vim-altr'
NeoBundle 'https://github.com/tpope/vim-surround.git'
" 開発
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundleLazy 'https://github.com/vim-jp/cpp-vim' , { 
    \ 'autoload' : {'filetypes' :  'cpp' }
    \ }
NeoBundle 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'
" 補完
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
" NeoBundle 'https://github.com/Shougo/neocomplete.vim'
" NeoBundle 'https://github.com/Shougo/neosnippet'
" NeoBundleLazy 'https://github.com/osyo-manga/vim-stargate', {
"   \ 'autoload' : {'filetypes' : 'cpp'}
"   \ }
" 表示
" NeoBundle 'https://github.com/bling/vim-airline'
" NeoBundle "https://github.com/osyo-manga/unite-airline_themes'
NeoBundle 'https://github.com/itchyny/lightline.vim'
" オプション -------------------------------------------------------------
" プラグイン管理
NeoBundle 'https://github.com/tpope/vim-pathogen.git'
" サービス利用
NeoBundle 'https://github.com/ujihisa/blogger.vim'
NeoBundle 'https://github.com/basyura/TweetVim.git'
NeoBundle 'https://github.com/tyru/open-browser.vim.git'
NeoBundle 'https://github.com/basyura/twibill.vim.git'
NeoBundle 'https://github.com/mattn/webapi-vim.git'
NeoBundle 'https://github.com/majutsushi/tagbar.git'   " ctags利用のoutline表示
NeoBundle 'https://github.com/mattn/gist-vim'  " gist連携
" カラースキーム
NeoBundle 'https://github.com/jeffreyiacono/vim-colors-wombat'
NeoBundle 'https://github.com/thinca/vim-guicolorscheme.git'
" NeoBundle 'http://www.vim.org/scripts/download_script.php?src_id=13400' , { 'type__filename' : 'wombat256.vim' , 'script_type' : 'colors' }
" 不要？
"NeoBundle 'https://github.com/Shougo/clang_complete.git'
"NeoBundle 'https://github.com/Shougo/echodoc.git'
"NeoBundle 'https://github.com/Shougo/vim-vcs.git'
"NeoBundle 'https://github.com/Shougo/vinarise.git'

filetype plugin on
filetype indent on

" pathongen
" bundle配下をプラグインとして読み込む
" call pathogen#runtime_append_all_bundles()
" ヘルプを表示可能にする
" call pathogen#helptags()

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"==========================================================================
" unite.vim
" get from http://d.hatena.ne.jp/ruedap/20110110/vim_unite_plugin
"
" Prefix key
nnoremap [Unite] <Nop>
nmap , [Unite]
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> [Unite]b :<C-u>Unite buffer<CR>
" ファイル一覧（現在バッファのディレクトリ）
nnoremap <silent> [Unite]l :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ファイル一覧（カレントディレクトリ）
nnoremap <silent> [Unite]f :<C-u>UniteWithCurrentDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> [Unite]r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> [Unite]m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> [Unite]u :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> [Unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" unite-online
nnoremap <silent> [Unite]o :<C-u>Unite -vertical -winwidth=30 outline<CR>

" tagbar
nnoremap <silent> to :TagbarToggle<CR>
" 左側に表示する
let g:tagbar_left = 1
" 表示幅
" let g:tagbar_width = 40
" タグジャンプ後自動クローズ
let g:tagbar_autoclose = 1
" 表示後自動フォーカス
let g:tagbar_autofocus = 1
" ソート実行有無
let g:tagbar_sort = 0
" コンパクト表示
" let g:tagbar_compact = 1


" Twitvim
" Twitter Prefix
"nnoremap [Twit] <Nop>
"nmap tw [Twit]
" 投稿
"nmap [Twit]p :PosttoTwitter
" タイムライン表示
"nmap [Twit]f :FriendsTwitter
" リスト表示
"nmap [Twit]lv :ListTwitter voice
" リスト一覧
"nmap [Twit]l :OwnedListsTwitter

let twitvim_count = 100
let twitvim_enable_ruby = 1
if exists('g:network_proxy')
    let twitvim_proxy = g:network_proxy
endif
"let twitvim_proxy_login_b64 = 
" ブラウザコマンドを指定してもうまく起動しない？
"let twitvim_browser_cmd = "firefox.exe"
"let twitvim_browser_cmd = "C:\Program\ Files\Mozilla\ Firefox\firefox.exe"

" Open Browser
" let g:openbrowser_open_commands = ['firefox.exe']
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" TweetVim
" トークンの格納ディレクトリ
"let g:tweetvim_config_dir = ''
if exists('g:network_proxy')
    let $http_proxy = g:network_proxy
    let $HTTPS_PROXY = g:network_proxy
endif

" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" 補完候補の数
let g:neocomplcache_max_list = 30

" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }

" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" snippets expand key
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" close and cancel key maps
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" inoremap <expr><C-m>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
" 1番目の候補を自動選択
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

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

" HTML.vim
" :filetype plugin on
" ツールバーオフ
let g:no_html_toolbar = 'yes'
" マップをxhtml用にする（+小文字になる）
"let g:do_xhtml_mappings = 'yes'
" デフォの文字コード ;ct で使用
let g:html_default_charset = 'utf-8'
" TABのマッピングを禁止
let g:no_html_tab_mapping = 'yes'

" QuickRun
" let g:quickrun_config = {
" \ 'cpp/vc': {
" \   'exec': ['%c %o %s /nologo /Fo%s:p:r.obj /Fe%s:p:r.exe > nul',
" \             '%S:p:r.exe %a', 'del %s:p:r.exe %s:p:r.obj'],
" \ },
" \}
let g:quickrun_config = {}
let g:quickrun_config.groovy = {'command' : 'groovyclient'}

" nerdcommenter
" Nerd_Commenter の基本設定
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1

" language
" let NERD_c_alt_style = 1
let g:NERDCustomDelimiters = {
    \ 'c' : { 'left' : '//', 'leftAlt': '//*', 'rightAlt': '*//' },
    \}

" Key Map
" Prefix key
" nnoremap [NERD] <Nop>
" nmap , [NERD]
" nnoremap [NERD]<Space> <Plug>NERDCommenterToggle
" vnoremap [NERD]<Space> <Plug>NERDCommenterToggle
nmap ,<Space> <Plug>NERDCommenterToggle " なぜかnoremapにすると上手くいかない
vmap ,<Space> <Plug>NERDCommenterToggle
 
" c.vim
":filetype plugin on

" fugitive
" Prefix key
nnoremap [Git] <Nop>
nmap @ [Git]
" 状態確認
nnoremap [Git]s :Gstatus<CR>
" ステージ（git add）
nnoremap [Git]w :Gwrite<CR>
" コミット（git commit）
nnoremap [Git]c :Gcommit<CR>
" 直前のリビジョンを表示
nnoremap [Git]r :Gread<CR>
" diff表示
nnoremap [Git]d :Gdiff<CR>
" blame表示
nnoremap [Git]b :Gblame<CR>
            
" vim-altr
" nnoremap <Leader>a <Plug>(altr-forward)
" nnoremap jfa <Plug>(altr-forward)
" nmap <Leader>a <Plug>(altr-forward)
" nmap jfa <Plug>(altr-forward)
nmap <F2> <Plug>(altr-forward)

" DoxygenToolkit
let g:load_doxygen_syntax=1
let g:DoxygenToolkit_startCommentTag = "/*! "
let g:DoxygenToolkit_startCommentBlock = "/*"
let g:DoxygenToolkit_briefTag_pre = "\\brief "
let g:DoxygenToolkit_paramTag_pre = "\\param "
let g:DoxygenToolkit_paramTag_post = " [I/O] "
let g:DoxygenToolkit_returnTag = "\\return \n * \\retval"

" vim戦闘力計測
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)


