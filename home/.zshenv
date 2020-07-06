##############################
# 環境変数

## 言語、文字コードの設定
export LANG=ja_JP.UTF-8
case ${UID} in # http://news.mynavi.jp/column/zsh/024/
0)
    LANG=C
    ;;
esac


##############################
# 自動zcompile[http://blog.n-z.jp/blog/2013-12-10-auto-zshrc-recompile.html]
if [ ! -f ~/.zshenv.zwc -o ~/.zshenv -nt ~/.zshenv.zwc ]; then
   zcompile ~/.zshenv
fi
