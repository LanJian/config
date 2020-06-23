# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs vcs time)
POWERLEVEL9K_CONTEXT_TEMPLATE=$'\ue795'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='201'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='017'
POWERLEVEL9K_DIR_HOME_FOREGROUND='044'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='044'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='044'
POWERLEVEL9K_DIR_ETC_FOREGROUND='044'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_STATUS_OK_BACKGROUND='017'
POWERLEVEL9K_HISTORY_BACKGROUND='013'
POWERLEVEL9K_HISTORY_FOREGROUND='044'
POWERLEVEL9K_TIME_BACKGROUND='201'
POWERLEVEL9K_TIME_FOREGROUND='255'
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.work_aliases ]; then
  . ~/.work_aliases
fi


# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if [ "$TERM"=="xterm" ]; then
  export TERM=xterm-256color
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

bindkey \^U backward-kill-line

##(cd $HOME/project/tangshi && bundle exec ruby print_random_poem.rb)
#
##foo () {r=$(( $RANDOM % 50 )); if [ $r -eq 5 ]; then sl; else ls; fi}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#eval "$(thefuck --alias)"

#if [[ -z "$TMUX" ]]
#then
  #exec tmux new-session
#fi

autoload -U compinit && compinit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload bashcompinit
bashcompinit

source <(gopass completion zsh | head -n -1 | tail -n +2)

eval "$(jira --completion-script-zsh)"

compdef _gopass gopass

export YVM_DIR=/home/jackhxs/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

[[ -s "/home/jackhxs/.gvm/scripts/gvm" ]] && source "/home/jackhxs/.gvm/scripts/gvm"
