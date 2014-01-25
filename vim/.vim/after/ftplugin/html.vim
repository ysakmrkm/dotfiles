if exists("b:did_ftplugin_html")
  finish
endif

" オートインデントさせない
setlocal noautoindent
setlocal nosmartindent
" タブ表示幅
setlocal tabstop=4
" タブ挿入幅
setlocal shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
setlocal noexpandtab

let b:did_ftplugin_html = 1
