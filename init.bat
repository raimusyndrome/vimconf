@echo off
 
rem コメント
 
rem 環境変数の設定
set REPO_NAME="vimconf"
   
rem このバッチが存在するフォルダをカレントに
pushd %0\..
cls
 
rem 本体処理
  
pushd ..
mklink _vimrc %REPO_NAME%\vimrc
mklink _gvimrc %REPO_NAME%\gvimrc

pause
exit
