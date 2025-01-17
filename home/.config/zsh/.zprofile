# Homebrew
if type /opt/homebrew/bin/brew >/dev/null 2>&1; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# mise
if type mise >/dev/null 2>&1; then
  eval "$(mise activate zsh --shims)"
fi

# google-cloud-sdk
if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Docker Desktop
export PATH="$PATH:$HOME/.docker/bin"
