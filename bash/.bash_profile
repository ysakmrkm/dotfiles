# 起動時に.bashrc 読み込み
if [ -f ~/.bashrc ] ; then
	. ~/.bashrc
fi

export LANG=ja_JP.UTF-8
export CLICOLOR=1
export PS1='ysakmrkm@[\W]:'
alias ls='ls -F -v -a'

# 起動時に tmux 起動
#if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
#	if ( tmux has-session ); then
#		session=`tmux list-sessions | grep -e '^[0-9].*]$' | head -n 1 | sed -e 's/^\([0-9]\+\).*$/\1/'`
#		if [ -n "$session" ]; then
#			echo "Attache tmux session $session."
#			tmux attach-session -t $session
#		else
#			echo "Session has been already attached."
#			tmux list-sessions
#		fi
#	else
#		echo "Create new tmux session."
#		tmux
#	fi
#fi

if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    #elif type screen >/dev/null 2>&1; then
    #    screen -rx || screen -D -RR
    fi
fi

# PATH は後に書く方が先に適応される
# homebrew
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Mysql
PATH=/usr/local/mysql/bin:$PATH

# npm
PATH=/usr/local/share/npm/bin:$PATH

# Macvim をアプリから読み込み
PATH=/Applications/MacVim.app/Contents/MacOS:$PATH

# gem
[ -x `which gem` ] && PATH="`gem env | perl -ne 'print $1 if /EXECUTABLE DIRECTORY: (.+)$/'`":$PATH

export PATH

# brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

# PHP
export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"