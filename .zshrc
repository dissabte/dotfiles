export LC_ALL=en_US.UTF-8
export EDITOR=vim
export VISUAL=vim

export PATH=~/bin:$PATH


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt append_history
setopt share_history
setopt hist_ignore_space

DIRSTACKSIZE=30
setopt auto_pushd
setopt pushd_minus

bindkey -e

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' '' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle :compinstall filename '/Users/oleh/.zshrc'

autoload -Uz compinit
compinit

########## aliases ##########
# Some shortcuts for different directory listings
alias ls='ls -Gh'       # classify files in colour
eval $(thefuck --alias) # https://github.com/nvbn/thefuck

########## aliases end ##########

# make ^W delete to nearest slash
# https://unix.stackexchange.com/a/250700/25880
# http://www.zsh.org/mla/users/2001/msg00870.html
my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

######### prompt ##########
autoload -Uz vcs_info
vcs_info

precmd() {
	vcs_info
}

setopt prompt_subst

zstyle ':vsc_info:git:*' enable true
zstyle ':vcs_info:*' actionformats \
    '%F{yellow}[%F{green}%b%F{white}|%F{red}%a%F{yellow}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{yellow}[%F{green}%b%F{yellow}]%f '

zstyle ':vcs_info:*' enable git

RPROMPT="$vcs_info_msg_0_"
PROMPT="%n@%m %F{blue}%1~%f%(!.#.$) "



export PATH="/usr/local/opt/curl/bin:$PATH"

# Powerlevel9k, https://github.com/bhilburn/powerlevel9k
STEP_BACK="\e[1D"
DEFAULT_BACKGROUND=234

# prompt
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(icons_test)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(!.#.$) "

# context
POWERLEVEL9K_CONTEXT_TEMPLATE="$STEP_BACK%n@%m"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=$DEFAULT_BACKGROUND

# dir
DIR_FOREGROUND="white"
DIR_BACKGROUND=17
POWERLEVEL9K_DIR_HOME_BACKGROUND="$DIR_BACKGROUND"
POWERLEVEL9K_DIR_HOME_FOREGROUND="$DIR_FOREGROUND"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="$DIR_BACKGROUND"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="$DIR_FOREGROUND"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="$DIR_BACKGROUND"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="$DIR_FOREGROUND"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="$DIR_BACKGROUND"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="$DIR_FOREGROUND"
POWERLEVEL9K_DIR_ETC_FOREGROUND="$DIR_FOREGROUND"
POWERLEVEL9K_DIR_ETC_BACKGROUND="$DIR_BACKGROUND"

# status
POWERLEVEL9K_STATUS_CROSS=true

source  ~/powerlevel9k/powerlevel9k.zsh-theme
