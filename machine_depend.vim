" マシン依存設定の識別子

" 1:dyna_note 仕事ノート（初代）
let g:work_note = 'dyna_note'
" 2:dell_desk 仕事デスク（初代）
let g:work_desk = 'dell_desk'
" 3:vaio_note 個人ノート
let g:my_note_vaio = 'vaio_note'
" 4:dell_workstation 仕事ワークステーション（二代目）
let g:work_worksta = 'dell_workstation'

" マシン識別子
let g:raimu_computer = g:work_worksta

function! ComputerName()
    return g:raimu_computer
endfunction

" ディレクトリ設定
if      ComputerName() == g:work_note
    " バックアップファイルを作るディレクトリ
    let g:my_backup_dir ='C:\Documents and Settings\student\My Documents\903_backup\vim'
    " アンドゥ情報作成ディレクトリ
    " let g:my_undo_dir = 'G:\Documents\803_backup\vim'
elseif  ComputerName() == g:work_desk 
    let g:my_backup_dir ='C:\Documents and Settings\Administrator\My Documents\902_backup\vim'
elseif  ComputerName() == g:my_note_vaio 
elseif  ComputerName() == g:work_worksta 
    let g:my_backup_dir = 'G:\Documents\803_backup\vim'
    let g:my_undo_dir = 'G:\Documents\803_backup\vim'
endif
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
let g:neobundlepath= g:my_plugin_dir .'bundle/neobundle.vim'
let g:neobundlerc= g:my_plugin_dir . 'neobundle'
" evervimの作業ディレクトリ
" let g:evervimpath='$VIM/evernote'
let g:evervimpath= g:my_data_dir . 'evernote'

" qfixhowm
set runtimepath+=~/vimfiles/bundle/qfixapp

let howm_dir='C:\Documents\ and\ Settings\Administrator\My\ Documents\806_memo'
let howm_fileencoding='cp932'
let howm_fileformat='dos'

