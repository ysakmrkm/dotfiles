# 起動時に.bashrc 読み込み
if [ -f ~/.bashrc ] ; then
	. ~/.bashrc
fi

# 起動時に tmux 起動
if ( ! test $TMUX ) && ( ! expr $TERM : "^screen" > /dev/null ) && which tmux > /dev/null; then
	if ( tmux has-session ); then
		session=`tmux list-sessions | grep -e '^[0-9].*]$' | head -n 1 | sed -e 's/^\([0-9]\+\).*$/\1/'`
		if [ -n "$session" ]; then
			echo "Attache tmux session $session."
			tmux attach-session -t $session
		else
			echo "Session has been already attached."
			tmux list-sessions
		fi
	else
		echo "Create new tmux session."
		tmux
	fi
fi

export LANG=ja_JP.UTF-8
alias ls='ls -F -v'
export CLICOLOR=1
export PS1='ysakmrkm@[\W]:'

# PATH は後に書く方が先に適応される
# homebrew
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# npm
PATH=/usr/local/share/npm/bin:$PATH

# Macvim をアプリから読み込み
PATH=/Applications/MacVim.app/Contents/MacOS:$PATH

# gem
[ -x `which gem` ] && PATH="`gem env | perl -ne 'print $1 if /EXECUTABLE DIRECTORY: (.+)$/'`":$PATH

export PATH

