" vi互換を切る
set nocompatible

"----------------------------------------------------------------------------------
" 基本設定
"----------------------------------------------------------------------------------
" バックアップファイルを作らない
set nobackup

"----------------------------------------------------------------------------------
" 文字
"----------------------------------------------------------------------------------
" 文字コード
set enc=utf-8
" ファイルの文字コード
set fenc=utf-8
" ターミナルの文字コード
set termencoding=utf-8
" 文字コード自動認識
" iso-2022-jpが優先されるので変更してみる
"set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
" フォント指定
set guifont=SauceCodePowerline-Light:h14
set guifontwide=SauceCodePowerline-Light:h14
" 全角記号表示崩れ対策
set ambiwidth=double

"----------------------------------------------------------------------------------
" 検索
"----------------------------------------------------------------------------------
" 検索ワードの大文字小文字を区別しない
set ignorecase
" 検索ワードに大文字小文字が含まれていた場合区別する
set smartcase
" 検索結果ハイライト
set hls

"----------------------------------------------------------------------------------
" 編集
"----------------------------------------------------------------------------------
" バックスペースキーで削除できるものを指定
"  eol    : 改行
"  indent : 行頭のインデント
"  start  : 挿入モード開始位置より手前の文字
set backspace=eol,indent,start
" 新しい行のインデントを現在行と同じにする
set autoindent
" 保存しなくてもバッファを開くようにする
set hidden
" ヤンクしたものをクリップボードにコピー
"  unnamed    : ヤンクしたものをクリップボードにコピー
"  autoselect : 選択されたテキストをクリップボードに 
"set clipboard=unnamed,autoselect
set clipboard=unnamed

"----------------------------------------------------------------------------------
" 表示
"----------------------------------------------------------------------------------
" ターミナル用
"  256色を使えるようにする
set t_Co=256
"  スクロールを早くする
"崩れるっぽい
set ttyfast
set lazyredraw
" カラースキーム選択
colorscheme molokai
" 透過度
set transparency=0
" 行番号表示
set number
" タイトル表示
set title
" コマンド表示
set showcmd
" tmuxなら自動調整されるのでコメントアウトして様子見
" 縦幅
"set lines=43
" 横幅
"set columns=122
" シンタックスハイライト
syntax on
" カーソル形状変更(iTerm2用?)
"  インサートモード:Virtical Bar
let &t_SI = "\e]50;CursorShape=1\x7"
"  ノーマルモード:Box
let &t_EI = "\e]50;CursorShape=0\x7"
" カレントウィンドウのカーソル行をハイライト
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" Tab可視化
set list
" Tab置き換え文字
"  eol : 行の最後
"  tab : tab
set listchars=eol:$,tab:▸=
" 単語途中で折り返しせずホワイトスペースで折り返しする
set linebreak
" 行番号左に1つ余白を追加する
augroup numberwidth
  autocmd!
  autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END

"----------------------------------------------------------------------------------
" ショートカット
"----------------------------------------------------------------------------------
" vimrc 編集
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
" vimrc 反映
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>
" gvimrc 編集
nnoremap <Space>g. :<C-u>edit $MYGVIMRC<Enter>
" gvimrc 反映
nnoremap <Space>sg. :<C-u>source $MYGVIMRC<Enter>
" USキーボード用
"  ; タイプで : を入力
noremap ; :
noremap : ;
" <ESC>2回押しでキーワードハイライトをOFF
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
" コピペした時上書きされないようにする http://qiita.com/items/bd97a9b963dae40b63f5
vnoremap <silent> <C-P> "0p<CR>
" <F6>でノーマルモードからインサートモードに変更・タイムスタンプ挿入・ノーマルモードへ
nnoremap <F6> i<C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR><Esc>
" redraw!
nnoremap <Space>r :<C-u>redraw!<Enter>

"----------------------------------------------------------------------------------
"操作系
"----------------------------------------------------------------------------------
" vimの挿入モードで一定以上入力がなかったら通常モードにしてみる (http://qiita.com/Echos/items/84e87274eef3eeab3b17)
" インサートモードに入るか、入力を行った最後の時間を変数に保存
autocmd! InsertEnter,InsertChange * :let s:last_action_time = localtime()
autocmd! CursorMovedI * :call s:leave_insert_mode() | let s:last_action_time = localtime()
autocmd! InsertCharPre * :call s:leave_insert_mode("call feedkeys('" . v:char . "', 'n')", "let v:char = '' ")

" 最後の入力からこの秒数を超えた時間が経過していればInsertを終了する
let s:wait_sec = 10
function! s:leave_insert_mode(...)
  let s:last_action_time = get(s:, "last_action_time", localtime())
  let l:elapsed_sec = localtime() - s:last_action_time
  " 経過時間が指定待ち時間を超えていれば
  if l:elapsed_sec > s:wait_sec
    call feedkeys("\<ESC>")
    " 文字列として指定されたlambda式を実行
    for action in a:000
      execute action
    endfor
  endif
endfunction

"----------------------------------------------------------------------------------
"プラグイン
"----------------------------------------------------------------------------------
filetype off

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc(expand('~/.vim/bundle/'))

"  プラグイン一覧
NeoBundle 'vim-scripts/autodate.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Lokaltog/powerline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
"NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'skammer/vim-css-color'

filetype plugin on
filetype indent on

syntax on

"autodate.vim(Kaoriya版に付属)
let autodate_keyword_pre = "Last Change:	"
let autodate_keyword_post = "."
let autodate_format = "%Y/%m/%d %H:%M:%S"
" unite.vim
"  入力モードで開始する(要らないかも)
"let g:unite_enable_start_insert=1
"  file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
"  ショートカット設定
"  バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"  ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"  レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"  最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
"  常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
"  全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"  ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"  ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"  ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" emmet-vim
"  dollar_expr : 1 デフォルト $が展開される
"  dollar_expr : 0            $が展開されない
"  filters : 'fc' デフォルト :の後に半角スペース挿入
"  filters : ''              :の後に半角スペース無し
let g:user_emmet_settings = {
\  'lang' : 'ja',
\  'html' : {
\    'dollar_expr' : 0,
\    'snippets' : {
\      'baseurl':"<?php echo BASE_URL,'/'; ?>",
\    },
\  },
\  'php' : {
\    'extends' : 'html',
\  },
\  'mt' : {
\    'extends' : 'html',
\    'snippets' : {
\      'if':'<mt:if tag="${cursor}"></mt:if>',
\    }
\  },
\  'css' : {
\    'filters' : '',
\  },
\  'scss' : {
\    'filters' : '',
\  },
\}
"  展開されるタグをデフォルトのHTML5からXHTMLに変更
let g:emmet_html5 = 0

" Powerline
"  ステータスラインを表示
set laststatus=2
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode
