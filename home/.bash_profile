#Homebrew
export PATH=/usr/local/bin:$PATH

#rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#Gem
#export GEM_HOME=/usr/local/var/gem
#export GEM_SPEC=/usr/local/var/gem
#export PATH=$GEM_HOME/bin:$PATH

#PHP
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# 履歴
export HISTSIZE=1000000 # 履歴サイズ
export HISTCONTROL=ignoreboth:erasedups # 直前の履歴と重複する場合は残さない（ignoredups） + 空白から始めたコマンドは残さない（ignorespace） + 過去に同じコマンドラインがあれば古い方の履歴を削除する（erasedups）
export HISTIGNORE=ls*:exit:which*:history* # 履歴に残さないコマンド
