

# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

HISTFILESIZE=100000
HISTSIZE=10000

shopt -s histappend
shopt -s checkwinsize
shopt -s extglob
shopt -s globstar
shopt -s checkjobs

alias bat='bat -pp --theme base16-256 --italic-text always'
alias c='fzf-cd-widget'
alias cp='cp -iv'
alias curl='curl -v'
alias df='df -h'
alias du='du -h'
alias gD='nvim -c :Gdiff'
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

alias la='exa --git -a'
alias ll='exa -l -g -a --sort=modified --git'
alias ls='exa --git'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias nix-repl='nix repl'
alias p='bat'
alias pc='bat -d --color=always'
alias rm='rm -iv'
alias sudo='sudo '

alias vimdiff='nvim -d'
alias xargs='xargs '

if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
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
    *MacBook*)     DEVICE="";;
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
    *macos*)                 ICON="";;
    *)                       ICON="";;
esac

if [ -f ~/.config/starship.toml ]; then
  export STARSHIP_DISTRO="$ICON "
  export STARSHIP_DEVICE="$DEVICE"
  export STARSHIP_CONFIG=~/.config/starship.toml
  eval "$(starship init bash)"
fi

# disable standard terminal function CTRL-Q and CTRL-S
# to stop output and resume
stty -ixon

# use the vi keymap


if [ -e "$HOME/.zprofile" ]; then
    source "$HOME/.zprofile"
fi

# make sure prompt gets printed on a new line

export PROMPT_EOL_MARK=%B%S%#%s%b


# Make directory listing when chaging directory {{{
function chpwd() {
    if [ ! -t 1 ]; then
        # don't generate output when changing directory in a script
        return
    fi
    local listing="$(exa -l --sort=modified -r --git --color=always)"
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

# These global aliases will be replaced
# by the respective command. These are evaluated
# before any other expansion takes place.
alias P=" pbpaste | "
alias Y=" | pbcopy"
alias L=" | less"
alias V=" | vimpager"
alias S=" | rg -n "
alias C=" | rg -c "
alias F=" | tail -f "
alias T=" | tail"
alias H=" | head"
alias W=" | entr "
alias NE=" 2>/dev/null"
alias X=" | xargs"
alias X1=" | xargs -N 1"
alias XRG=" | xargs rg "
alias LL=" | while IFS= read line; do "



export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
alias ll='ls -l'
alias vi='nvim'
alias vim='nvim'
