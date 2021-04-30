# dotfiles

## Mac移行手順

1. App Storeにログイン
1. Xcodeをインストール
1. このリポジトリを `~/Development/com` ディレクトリ配下にclone
1. `./home` ディレクトリ配下を `~` ディレクトリ配下にコピー（Finderで隠しファイルは `⌘+Shift+.` で表示）
    1. `shopt -s dotglob`
    1. `cp -r ./home/* ~`
    1. `shopt -u dotglob`
1. 秘密鍵やトークンなどは別の方法でコピー
1. [Homebrew](https://github.com/Homebrew/brew)をインストール
1. `./Brewfile` の中身を調整（ `#` でコメントアウト）
1. `brew bundle` を実行（[Homebrew/homebrew-bundle](https://github.com/Homebrew/homebrew-bundle)）
1. iTermのProfilesで `./term_profiles` ディレクトリ配下のプリセットをimport
