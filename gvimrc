" gvim 個人設定
"
" by raimusyndrome
"

"---------------------------------------------------------------------------
" ウインドウ設定:
"
" ウインドウの幅・高さ
if      ComputerName() == g:work_note 
    set columns=150
    set lines=45
elseif  ComputerName() == g:work_desk
    set columns=150
    set lines=60
elseif  ComputerName() == g:work_worksta
    set columns=180
    set lines=60
endif
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

"---------------------------------------------------------------------------
" カラー設定
"
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (GUI使用時)
colorscheme wombat "（暗め）
"colorscheme newspaper "（明るめ）

"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  " Windows用（デフォルト）
  "set guifont=MS_Gothic:h12:cSHIFTJIS
  set guifont=MS_Gothic:h10:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" キーバインド

" 設定ファイル読み込み
nnoremap lrc :source $MYVIMRC<CR>:source $MYGVIMRC<CR>
nnoremap lrg :source $MYGVIMRC<CR>
" 設定ファイル編集
nnoremap erg :e $MYGVIMRC<CR>

