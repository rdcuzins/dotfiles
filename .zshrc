# plugins - using zap (https://github.com/zap-zsh/zap)
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "romkatv/powerlevel10k"
plug "zap-zsh/exa"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "zsh-users/zsh-syntax-highlighting"

# exports
export EDITOR="nvim"
export TERMINAL="foot"
export BROWSER="firefox"
export TERM="xterm-256color"
export DOTFILES="$HOME/.dotfiles"
export REPOS="$HOME/opt/repos"
export HRULEWIDTH=73
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export GO111MODULE="on"
export PATH="$GOPATH/bin:$GOBIN:$SCRIPTS:/usr/local/share/gems:$USER/.gem/ruby:$HOME/opt/work/bin:$HOME/bin:$PATH"

# aliases
alias docker="podman"
alias dot="cd $DOTFILES"
alias gb="git rev-parse --abbrev-ref HEAD"
alias vz="$EDITOR $HOME/.zshrc"
alias vb="$EDITOR $HOME/.bashrc"
alias chmox="chmod +x"
alias lg="lazygit"
alias nvim="lvim"

if command -v bat &>/dev/null; then
  alias cat='bat -pp --theme "Visual Studio Dark+"'
  alias catt='bat --theme "Visual Studio Dark+"'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source virtualenvironment
VENV="/usr/local/bin/virtualenvwrapper.sh"
[[ -f "$VENV" ]] && source "$VENV" &>/dev/null
(cat ~/.cache/wal/sequences &)
