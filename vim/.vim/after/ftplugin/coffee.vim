if exists("b:did_ftplugin_coffee")
  finish
endif

" タブ表示幅
setlocal tabstop=2
" タブ挿入幅
setlocal shiftwidth=2
" タブをタブとして扱う(スペースに展開しない)
setlocal expandtab
" オートインデント
setlocal autoindent
" 折り畳み
setlocal foldmethod=marker commentstring=#%s

let b:did_ftplugin_coffee = 1 
