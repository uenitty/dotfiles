##############################
# 環境変数

## 言語、文字コードの設定
export LANG=ja_JP.UTF-8
case ${UID} in # http://news.mynavi.jp/column/zsh/024/
0)
    LANG=C
    ;;
esac

## Homebrew用PATH
#export PATH=/usr/local/bin:$PATH

## rbenv用PATHとrbenv初期化（補完有効化など）
#export RBENV_ROOT=/usr/local/var/rbenv
#if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi



##############################
# 自動zcompile[ihttp://blog.n-z.jp/blog/2013-12-10-auto-zshrc-recompile.html]
if [ ! -f ~/.zshenv.zwc -o ~/.zshenv -nt ~/.zshenv.zwc ]; then
   zcompile ~/.zshenv
fi
