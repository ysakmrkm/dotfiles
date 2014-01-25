"----------------------------------------------------------------------------------
" 文字
"----------------------------------------------------------------------------------
" フォント指定
set guifont=SauceCodePowerline-Light:h14
set guifontwide=SauceCodePowerline-Light:h14

"----------------------------------------------------------------------------------
" 検索
"----------------------------------------------------------------------------------
"----------------------------------------------------------------------------------
" 編集
"----------------------------------------------------------------------------------
"----------------------------------------------------------------------------------
" 表示
"----------------------------------------------------------------------------------
" カラースキーム選択
colorscheme molokai
" 背景透明度
set transparency=10

if has('multi_byte_ime') || has('xim')
	highlight Cursor guifg=NONE guibg=green
	highlight CursorIM guifg=NONE guibg=#da1f50
	highlight Search guifg=NONE guibg=#da1f50
end

"----------------------------------------------------------------------------------
" ショートカット
"----------------------------------------------------------------------------------
"----------------------------------------------------------------------------------
"プラグイン
"----------------------------------------------------------------------------------

"map <D-w> :q<CR>
"map <D-t> :tabnew<CR>
"map <D-n> :new<CR>
"map <D-S-t> :browse tabe<CR>
"map <D-S-n> :browse split<CR>
"map <D-]> :tabn<CR>
"map <D-[> :tabp<CR>
"map <D-M-Right> :tabn<CR>
"map <D-M-Left> :tabp<CR>
"imap <D-M-Right> <C-o>:tabn<CR>
"imap <D-M-Left> <C-o>:tabp<CR>
"nmap <ESC><ESC> :nohlsearch<CR><ESC>
"
""if has('gui_macvim')
"    set showtabline=2	" タブを常に表示
"	set ft=html
"	autocmd Filetype html set omnifunc=htmlcomplete#CompleteTags
"	autocmd Filetype php set omnifunc=phpcomplete#CompletePHP
"	autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"	autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"
"	"<F6>  文頭にタイムスタンプを挿入してinsertモードへ移行
"	inoremap <F6> <C-R>=strftime("%Y/%m/%d %H:%M")<CR>
""endif
