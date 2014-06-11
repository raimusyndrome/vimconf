" マシン依存設定
" ディレクトリ設定
" バックアップファイルを作るディレクトリ
let g:my_backup_dir = $VIM . 'backup'
" アンドゥ情報作成ディレクトリ
let g:my_undo_dir = $VIM . 'undo'
" スワップファイルを作るディレクトリ(dir)
let g:my_swap_dir = g:my_backup_dir

if has('win32') || has('win64') 
    " プラグインディレクトリパス
    let g:my_plugin_dir='~/vimfiles/'
    " データディレクトリパス
    let g:my_data_dir='~/vimdata/'
else
    let g:my_plugin_dir='~/.vim/'
    let g:my_data_dir='~/vimdata/'
endif

" neobundleのパス
" let g:neobundlepath='~/vimfiles/bundle/neobundle.vim'
" let g:neobundlerc='~/vimfiles/neobundle'
let g:neobundlepath= g:my_plugin_dir .'neobundle/neobundle.vim'
let g:neobundlerc= g:my_plugin_dir . 'neobundle'
" evervimの作業ディレクトリ
" let g:evervimpath='$VIM/evernote'
let g:evervimpath= g:my_data_dir . 'evernote'

" qfixhowm
" set runtimepath+=~/vimfiles/bundle/qfixapp

" let howm_dir='C:\Documents\ and\ Settings\Administrator\My\ Documents\806_memo'
" let howm_fileencoding='cp932'
" let howm_fileformat='dos'

" Proxy設定
let g:network_proxy = 'proxy.sso.ntts.co.jp:18080'

