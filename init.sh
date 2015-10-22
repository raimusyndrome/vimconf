#!/bin/sh
# home directoryで実行する

REPO_DIR=.vim/vimconf
cd ~
ln -s $REPO_DIR/vimrc .vimrc
ln -s $REPO_DIR/gvimrc .gvimrc

# デフォルトのディレクトリ作成
# mkdir ~/vimdata
# mkdir ~/backup
# mkdir ~/undo

