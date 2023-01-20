# dotfiles

## Mac移行手順

1. App Storeにログインする
1. Xcodeをインストールする
1. このリポジトリを `~/Development` ディレクトリ配下にcloneする
    - ```sh
      git clone https://github.com/uenitty/dotfiles.git ~/Development/dotfiles
      ```
1. `./home` ディレクトリ配下を `~` ディレクトリ配下にコピーする
    - ```sh
      rsync -av ./home/ ~
      ```
1. 旧Macの「リモートログイン」を一時的に有効化し、秘密鍵やトークンなどをコピーする
    - ```sh
      rsync -auvzE --progress 旧Macのユーザー名@旧MacのIPアドレス:'~/.ssh/id_*' ~/.ssh
      ```
1. ssh接続に切り替える
    - ```sh
      git remote set-url origin git@github.com:uenitty/dotfiles.git
      ```
1. [Homebrew](https://github.com/Homebrew/brew)をインストールする
1. `./Brewfile` の中身を調整する（ `#` でコメントアウト）
1. `brew bundle` を実行する（[Homebrew/homebrew-bundle](https://github.com/Homebrew/homebrew-bundle)）
1. iTermのProfilesで `./term_profiles` ディレクトリ配下のプリセットをimportする
