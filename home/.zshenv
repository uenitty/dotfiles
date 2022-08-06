# 言語、文字コードの設定
export LANG=ja_JP.UTF-8

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"


##############################
# 自動zcompile[http://blog.n-z.jp/blog/2013-12-10-auto-zshrc-recompile.html]
if [ ! -f $ZDOTDIR/.zshenv.zwc -o $ZDOTDIR/.zshenv -nt $ZDOTDIR/.zshenv.zwc ]; then
   zcompile $ZDOTDIR/.zshenv
fi
