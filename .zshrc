typeset -U path cdpath fpath manpath

source $HOME/.config/zsh/zsh-autosuggestions.zsh

# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="100000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

if [[ $options[zle] = on ]]; then
  . $HOME/.config/zsh/fzf-completion.zsh
  . $HOME/.config/zsh/fzf-keybindings.zsh
fi

# find out which distribution we are running on
LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
  _distro="macos"

  # on mac os use the systemprofiler to determine the current model
  _device=$(system_profiler SPHardwareDataType | awk '/Model Name/ {print $3,$4,$5,$6,$7}')

  case $_device in
    *MacBook*)     DEVICE="";;
    *mini*)        DEVICE="󰇄";;
    *)             DEVICE="";;
  esac
fi

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="";;
    *)                       ICON="";;
esac

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [ -f ~/.config/starship.toml ]; then
  export STARSHIP_DISTRO="$ICON"
  export STARSHIP_DEVICE="$DEVICE"
  export STARSHIP_CONFIG=~/.config/starship.toml
  eval "$(starship init zsh)"
fi

# disable standard terminal function CTRL-Q and CTRL-S
# to stop output and resume
stty -ixon

# use the vi keymap
setopt vi

if [ -e "$HOME/.zprofile" ]; then
    source "$HOME/.zprofile"
fi

# make sure prompt gets printed on a new line
setopt PROMPT_SP
setopt PROMPT_CR
export PROMPT_EOL_MARK=%B%S%#%s%b


# Make directory listing when chaging directory {{{
function chpwd() {
    if [ ! -t 1 ]; then
        # don't generate output when changing directory in a script
        return
    fi
    local listing="$(eza -l --sort=modified -r --git --color=always)"
    local numdisplayfiles=22
    local numfiles="$(echo "$listing" | wc -l)"
    echo "$listing" | head -n"$numdisplayfiles"
    [ "$numfiles" -gt "$numdisplayfiles" ] \
        && echo -e "\e[3m  (there are $((numfiles - numdisplayfiles)) more files in this folder)\e[23m"
}
# }}}
#
f() {
  local searchterm="''${1:-""}"
  shift
  local out="$(rg -n "$searchterm" "$@" | fzf | cut -d: -f1-2)"
  local file="''${out%:*}"
  if [ -n "$file" ]; then
    "$EDITOR" "$file" +"$(printf "%s\n" "$out" | cut -d: -f2)"
  fi
  return $?
}
zle -N fzf-search-files
bindkey '^F' fzf-search-files

# shift-tab : go backward in menu (invert of tab)
bindkey '^[[Z' reverse-menu-complete

# make sure the FZF keybindings work
# bindkey '^I' fzf-completion #, disabled as it breaks on NixOS
bindkey '\ef' fzf-file-widget
bindkey '\ec' fzf-cd-widget
bindkey '^R' fzf-history-widget

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
bindkey '^X^E' edit-command-line

# make most keybindings also work in vim normal mode
bindkey -v '^A' beginning-of-line
bindkey -v '^B' backward-char
bindkey -v '^E' end-of-line
bindkey -v '^W' backward-delete-word
bindkey -v '^K' kill-line
bindkey -v '^T' transpose-chars
bindkey -v '^[f' forward-word
bindkey -v '^[b' backward-word
bindkey -v '^P' up-line-or-history
bindkey -v '^N' down-line-or-history
bindkey -v '^O' vi-cmd-mode
bindkey -v '^[' vi-cmd-mode
bindkey '^[[1;5C' forward-word # arrow-key right
bindkey '^[[1;5D' backward-word # arrow-key left
bindkey '  ' autosuggest-accept
bindkey '^S' autosuggest-execute

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# in some terminals the delete character doesn't
# work properly, so make sure it's bound
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

# These global aliases will be replaced
# by the respective command. These are evaluated
# before any other expansion takes place.
alias -g P=" pbpaste | "
alias -g Y=" | pbcopy"
alias -g L=" | less"
alias -g V=" | vimpager"
alias -g S=" | rg -n "
alias -g C=" | rg -c "
alias -g F=" | tail -f "
alias -g T=" | tail"
alias -g H=" | head"
alias -g W=" | entr "
alias -g NE=" 2>/dev/null"
alias -g X=" | xargs"
alias -g X1=" | xargs -N 1"
alias -g XRG=" | xargs rg "
alias -g LL=" | while IFS= read line; do "



export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

alias ll='ls -l'
alias vi='nvim'
alias vim='nvim'


# Aliases
alias bat='bat -pp --theme base16-256 --italic-text always'
alias c='fzf-cd-widget'
alias cp='cp -iv'
alias curl='curl -v'
alias df='df -h'
alias du='du -h'
alias gD='nvim -c :Gdiff'
alias gL='vim -s /nix/store/q66nfnfmyj2wv4azkqvqzxr91z69ydp4-vim-git-log .'
alias gS='vim -c '\'':Gstatus'\'' -c '\''wincmd w'\'' -c '\''close'\'' +/Unstaged'
alias ga='git a'
alias gap='git ap'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gcf='git commit --fixup=`fzf-commit`'
alias gco='git co'
alias gcop='git cop'
alias gcp='git cp'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdt='git difftool'
alias gf='git f'
alias gfwd='git forward'
alias gfx='git rebase --autostash --autosquash --interactive'
alias github='gh'
alias gk='git k'
alias gkp='git kp'
alias gl='git log'
alias glp='git log --patch'
alias gm='git m'
alias gmt='git mergetool'
alias gp='git p'
alias gpl='git pl'
alias gplr='git plr'
alias grep='grep --color=auto'
alias gs='git status'
alias gu='git unstage'
alias gundo='git undo'
alias gup='git up'
alias gx='git undo'
alias home-config='vim ~/.config/nixpkgs/home.nix'
alias hs='home-manager switch'
alias hsu='nix-channel --update && home-manager switch'
alias la='eza --git -a'
alias ll='eza -l -g -a --sort=modified --git'
alias ls='eza --git'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias nix-repl='nix repl'
alias p='bat'
alias pc='bat -d --color=always'
alias rm='rm -iv'
alias sudo='sudo '
alias system-config='sudo vim /etc/nixos/configuration.nix'
alias vimdiff='nvim -d'
alias xargs='xargs '


export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
if command -v kubectl &> /dev/null
then
    export KUBECONFIG=~/.kube/config
    source <(kubectl completion zsh)
    alias k=kubectl
    complete -F __start_kubectl k
fi

if [ -f ~/.zshenv ]; then
    source ~/.zshenv
fi

if [ -f ~/.zshcustom ]; then
    source ~/.zshcustom
fi

if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi

eval $(thefuck --alias)

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
