# dotfiles

## Mac移行手順

1. App Storeにログイン
1. Xcodeをインストール
1. ```sh
   # このリポジトリを `~/Development` ディレクトリ配下にclone
   % git clone https://github.com/uenitty/dotfiles.git ~/Development/dotfiles
   ```
1. ```sh
   # `./home` ディレクトリ配下を `~` ディレクトリ配下にコピー
   % rsync -av ./home/ ~
   ```
1. 秘密鍵やトークンなどは別の方法でコピー
1. ```sh
   # ssh接続に切り替え
   % git remote set-url origin git@github.com:uenitty/dotfiles.git
   ```
1. [Homebrew](https://github.com/Homebrew/brew)をインストール
1. `./Brewfile` の中身を調整（ `#` でコメントアウト）
1. `brew bundle` を実行（[Homebrew/homebrew-bundle](https://github.com/Homebrew/homebrew-bundle)）
1. iTermのProfilesで `./term_profiles` ディレクトリ配下のプリセットをimport
