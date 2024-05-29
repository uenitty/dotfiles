# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh

# google-cloud-sdk
if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]; then source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"; fi

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
