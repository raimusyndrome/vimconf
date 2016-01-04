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
let g:raimu_computer = g:my_note_vaio

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
    let g:my_backup_dir = 'C:\Users\known\Documents\vim\backup'
    let g:my_undo_dir = 'C:\Users\known\Documents\vim\undo'
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
" evervim
" 作業ディレクトリ
if ComputerName() == g:work_desk 
    let g:evervim_workdir = "C:\\Documents\ and\ Settings\\Administrator\\My\ Documents\\802_vim\\evernote"
    "let g:evervim_proxy = "proxy.sso.ntts.co.jp:18080"
endif


" qfixhowm
set runtimepath+=~/vimfiles/bundle/qfixapp

let howm_dir='C:\Documents\ and\ Settings\Administrator\My\ Documents\806_memo'
let howm_fileencoding='cp932'
let howm_fileformat='dos'

" let g:network_proxy = 'proxy.sso.ntts.co.jp:18080'

" ディレクトリ移動(dir)
if      ComputerName() == g:work_note 
    nnoremap [ChDir]m :<C-u>cd C:\Documents and Settings\student\My Documents\Kami Data\標準<CR>
    nnoremap [ChDir]x :<C-u>cd C:\Documents and Settings\student\My Documents\291_Code_work<CR>
    nnoremap [ChDir]c :<C-u>cd C:\Documents and Settings\student\My Documents\210_Billy_TP\svn\tp\src<CR>
    nnoremap [ChDir]r :<C-u>cd C:\Documents and Settings\student\My Documents\210_Billy_TP\svn\tp\site-ruby\bgtester<CR>
    nnoremap [ChDir]g :<C-u>cd C:\Documents and Settings\student\My Documents\210_Billy_TP\git\tp\src<CR>
    "nnoremap [ChDir]gr :cd C:\Documents and Settings\student\My Documents\210_Billy_TP\git\tp\site-ruby\bgtester<CR>
elseif  ComputerName() == g:work_desk 
    nnoremap [ChDir]x :<C-u>cd C:\Documents and Settings\Administrator\My Documents\290_Code_work<CR>
    "nnoremap [ChDir]x :<C-u>cd C:\000_Code_work<CR>
    nnoremap [ChDir]m :<C-u>cd C:\Documents and Settings\Administrator\My Documents\802_vim\memo<CR>
endif

" pathongen
"if g:raimu_computer == 'dyna_note'
if      ComputerName() == g:work_note 
    nmap vba :let g:vimball_home="C:\\Documents\ and\ Settings\\student\\vimfiles\\bundle\\"
"elseif g:raimu_computer == 'dell_desk'
elseif  ComputerName() == g:work_desk 
    nmap vba :let g:vimball_home="C:\\Documents\ and\ Settings\\Administrator\\vimfiles\\bundle\\"
endif

