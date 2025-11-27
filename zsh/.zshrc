#######################################
#            PATH + ALIASES
#######################################

# Universal PATH additions
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"   # macOS only, ignored on linux

# macOS GCloud
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/opt/homebrew/share/google-cloud-sdk/bin:$PATH"
fi

# Aliases
alias ls="eza -lh --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first"
alias find-pods="k get pods -A | fzf"
alias ask="codex exec --skip-git-repo-check"
alias k="kubectl"
alias cvpn="openvpn3 session-start --config aws"   


#######################################
#           CUSTOM FUNCTIONS
#######################################

function vz() {
	cursor "#(zoxide  query "$1")"

}

#######################################
#                NVM
#######################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"


#######################################
#       POWERLEVEL10K INSTANT PROMPT
#######################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#######################################
#              OH MY ZSH
#######################################
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

# Fix autosuggestion color for dark themes
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5e81ac"

source $ZSH/oh-my-zsh.sh


#######################################
#        SYNTAX HIGHLIGHTING FIX
#######################################
# MUST be last plugin → loaded AFTER oh-my-zsh
if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


#######################################
#        ZOXIDE (jump around)
#######################################
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi


#######################################
#         POWERLEVEL10K CONFIG
#######################################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# FZF keybindings and completion (Fedora)
[[ -f /usr/share/fzf/shell/key-bindings.zsh ]] && source /usr/share/fzf/shell/key-bindings.zsh
[[ -f /usr/share/fzf/shell/completion.zsh ]] && source /usr/share/fzf/shell/completion.zsh

# FZF keybindings and completion (MacOS)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

