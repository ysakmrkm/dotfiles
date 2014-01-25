if exists("b:did_ftplugin_css")
  finish
endif

" タブ表示幅
setlocal tabstop=4
" タブ挿入幅
setlocal shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
setlocal noexpandtab

let b:did_ftplugin_css = 1
