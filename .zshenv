# Only source this once
if [[ -z "$__HM_ZSH_SESS_VARS_SOURCED" ]]; then
  export __HM_ZSH_SESS_VARS_SOURCED=1
fi

export EDITOR="vim"
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_COMPLETION_TRIGGER="\\"
export FZF_CTRL_R_OPTS="--sort --exact"
export FZF_CTRL_T_COMMAND="fd --type f"
export FZF_CTRL_T_OPTS="--preview 'file {}; head {}'"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--height 40% --border"
export FZF_TMUX="1"
export FZF_TMUX_HEIGHT="30%"
export LANG="de_DE.UTF-8"
export LANGUAGE="de_DE.UTF-8"
export LC_ADDRESS="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"
export LC_COLLATE="de_DE.UTF-8"
export LC_CTYPE="de_DE.UTF-8"
export LC_MEASUREMENT="de_DE.UTF-8"
export LC_MESSAGES="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_NAME="de_DE.UTF-8"
export LC_NUMERIC="de_DE.UTF-8"
export LC_PAPER="de_DE.UTF-8"
export LC_TIME="de_DE.UTF-8"
# export PAGER="vimpager -u ~/.vimpagerrc"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgrep-config.txt"
# export VIMPAGER_RC="$HOME/.vimpagerrc"
# export VIMPAGER_VIM="vim"
export VISUAL="vim"
export XDG_CONFIG_HOME="$HOME/.config"

if [[ -f "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi
