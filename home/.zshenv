##############################
# 環境変数

## 言語、文字コードの設定
export LANG=ja_JP.UTF-8
# rootユーザはLANG=C http://news.mynavi.jp/column/zsh/024/
case ${UID} in
0)
    LANG=C
    ;;
esac

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


##############################
# 自動zcompile[http://blog.n-z.jp/blog/2013-12-10-auto-zshrc-recompile.html]
if [ ! -f ~/.zshenv.zwc -o ~/.zshenv -nt ~/.zshenv.zwc ]; then
   zcompile ~/.zshenv
fi
