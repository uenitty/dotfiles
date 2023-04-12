##############################
# 初期化

## asdf
. $(brew --prefix asdf)/libexec/asdf.sh


##############################
# 色 http://qiita.com/mollifier/items/40d57e1da1b325903659

## （プロンプトの？）カラー表示を有効にする
autoload -U colors
colors


##############################
# 補完

fpath=(~/.zsh/completion $fpath)

## brew zsh-completions用path
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:${FPATH}
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

## 補完機能を有効にする
autoload -U compinit
compinit

## 補完スタイルの設定
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完で小文字でも大文字にマッチさせる
#zstyle ':completion:*' ignore-parents parent pwd .. # ../の後は今いるディレクトリを補完しない
#zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin # sudoの後ろでコマンド名を補完する
#zstyle ':completion:*' verbose yes # 補完候補を「お節介バージョン（？）」で一覧表示？
#zstyle ':completion:*:default' menu select=1 # 補完候補のカーソル選択を有効に

## オプション
setopt correct # 補完適応前に入力間違いを指摘する
setopt list_packed # 補完リストは詰めて表示する
setopt nolistbeep # 補完リストを表示するときのビープ音を無効にする
setopt combining_chars # 補完時に濁点・半濁点を<3099>、<309a>のようにさせない https://github.com/tasuten/dotfiles/blob/master/.zshrc


##############################
# 履歴

## 履歴の設定
HISTFILE=$XDG_STATE_HOME/zsh/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

## オプション
#setopt hist_ignore_dups  # 直前と同じコマンドラインは履歴に残さない
setopt hist_ignore_all_dups  # 過去に同じコマンドラインがあれば古い方の履歴を削除する
setopt hist_ignore_space # スペースから始まるコマンドラインは履歴に残さない
setopt hist_no_store # historyコマンドを履歴に残さない
setopt hist_reduce_blanks # 履歴に保存するときに余分なスペースを削除する
setopt hist_verify # 履歴から補完したものを即実行せず、実行前に一旦編集可能にする
setopt share_history # 履歴を共有する


##############################
# ターミナルのタイトル

hook__echo_term_title() {
    case "${TERM}" in
    kterm*|xterm*)
        echo -ne "\033]2;${USER}@${HOST} : ${PWD}\007"
        echo -ne "\033]1;${HOST%%.*}: ${PWD:t}/\007"
    ;;
    esac
}


##############################
# プロンプト

## プロンプトの設定
### http://tegetegekibaru.blogspot.jp/2012/08/zsh_2.html

### gitブランチ名を表示するための設定
#### http://liosk.blog103.fc2.com/blog-entry-209.html
#### http://kitak.hatenablog.jp/entry/2013/05/25/103059
#### http://yoshiko.hatenablog.jp/entry/2014/04/02/zshのプロンプトにgitのステータスをシンプル可愛く
#### http://mollifier.hatenablog.com/entry/20090814/p1
#### http://daretoku-unix.blogspot.jp/2015/07/gitzsh.html
#### http://blog.hatak.net/2012/06/15/14100/
#### http://qiita.com/ToruIwashita/items/fa114effda34214c9371
autoload -Uz vcs_info
setopt prompt_subst
#zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' formats '[%b]' # モノクロ
zstyle ':vcs_info:*' actionformats '[%a|%b]' # モノクロ
#zstyle ':vcs_info:*' formats '[%F{green}%b%f]' # カラー
#zstyle ':vcs_info:*' actionformats '[%F{red}%a%f|%F{green}%b%f]' # カラー
hook__call_vcs_info() { vcs_info }
GIT_BRANCH_PROMPT='${vcs_info_msg_0_}'

### 2行カラーver.
PROMPT="%F{magenta}%m%f:%F{green}%n%f %F{blue}%~%f"$'\n'"%# " # 画面左端に出力されるプロンプト
PROMPT2="%_> " # forやwhile/複数行入力時などに表示されるプロンプト
RPROMPT=$GIT_BRANCH_PROMPT # 画面右端に出力されるプロンプト
SPROMPT="correct: %F{magenta}%R%f -> %F{cyan}%r%f ? [n,y,a,e]: " # correctで訂正の候補を出すときに表示されるプロンプト http://loumo.jp/wp/archive/20120501135820/


##############################
# hook関数

autoload -Uz add-zsh-hook
add-zsh-hook precmd hook__echo_term_title
add-zsh-hook precmd hook__call_vcs_info


##############################
# その他オプション

setopt print_eight_bit # 日本語ファイル名を表示可能にする
setopt interactive_comments # '#' 以降をコメントとして扱う
setopt auto_cd # ディレクトリ名だけのときはcdする
setopt auto_pushd # cd -[tab]で過去に入力したディレクトリを補完できるように自動でpushdする
setopt pushd_ignore_dups # pushdで重複したディレクトリをpushしない
setopt extended_glob # 高機能なワイルドカード展開を使用する
#function chpwd() { ls -GAF } # cdの度にlsする（色付き） http://stackstock.net/archives/2400/
#function chpwd() { ls -AF } # cdの度にlsする



##############################
# エイリアス
alias ls='ls -hFG'
alias la='ls -AhFG'
alias ll='ls -lhFG'
alias lla='ls -AlhFG'
alias tree='tree -CFN'
alias pd='popd'



##############################
# 自作関数
delds () {
    printf "> Listing '.DS_Store'...\n"
    find . -name '.DS_Store' -type f -print
    printf "> Are you sure to delete these? [Y/n]: "
    read ans
    if [ $ans = 'Y' ]; then
        printf "> Deleting...\n"
        find . -name '.DS_Store' -type f -delete
        printf "> Complete!\n"
    fi
}


##############################
# 他の設定ファイルを読み込む

if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]; then source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"; fi


##############################
# 自動zcompile[http://blog.n-z.jp/blog/2013-12-10-auto-zshrc-recompile.html]
if [ ! -f $ZDOTDIR/.zshrc.zwc -o $ZDOTDIR/.zshrc -nt $ZDOTDIR/.zshrc.zwc ]; then
   zcompile $ZDOTDIR/.zshrc
fi
