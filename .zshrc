export TERM=xterm-256color
if [ "$TMUX" = "" ] && [ "$VIM" = "" ]; then TERM=xterm-256color tmux; fi
stty -ixon

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="${ZSH_THEME:-robbyrussell}"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails ruby docker docker-compose sudo git-extras zsh-completions zsh-autosuggestions)
bindkey "^s" sudo-command-line

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/dougui/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ti="tmuxinator start "
# alias vi=nvim
# alias vim=nvim

alias kf="dcr frontend"
alias ka="dcr api"

alias kfz="dcr frontend zsh"
alias kaz="dcr api zsh"

alias gu="git undo"

unalias gr
alias gr="git reset"

unalias gcm
gam() { git add -A  && git commit -m "$*" }
gcm() { git commit -m "$*" }

alias vpn="(pgrep iked || sudo iked) && ikec -r typhon.vpn -u guirec.corbel -p `cat ~/.ike/sites/typhon.password` -a"

export EDITOR=vim

export PATH="${PATH}:/usr/local/bundle/bin"

setxkbmap -option caps:escape
bindkey "^R" history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
# bindkey "^[[D" vi-cmd-mode
# bindkey "^[[C" vi-cmd-mode

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% N]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

export PATH="${PATH}:${HOME}/npm/bin"
export PATH="${PATH}:${HOME}/.npm-global/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

bindkey '^[[1~' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[F' end-of-line

#set history size
export HISTSIZE=50000
#save history after logout
export SAVEHIST=50000
#history file
export HISTFILE=~/.zsh_history
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_ALL_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY
# Share history between all sessions.
setopt SHARE_HISTORY

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Set some basic default aliases
alias rz="r zsh"
alias dcr="dc run --rm"
alias dcu="dc up"
alias r="run"
# alias rake="bin/rake"
alias rails="bin/rails"
alias rspec="bin/rspec"

# Gives the project name corresponding to a directory
dimelo="/workspace/dimelo"
kohorde="/workspace/tiny"
collab="/workspace/collab"

# Change each time we go to a new directory to be customized by project
chpwd () {
    export DEFAULT_CONTAINER="$(basename $PWD)_web_dev"
    export DEFAULT_SERVICE="web"
    export DEFAULT_RUN_COMMAND="while :; do echo 'Hit CTRL+C'; sleep 1; done"
    export DEFAULT_COMPOSE_OPTIONS=""

    export SPRING_SOCKET="tmp/spring.sock"
    export SPRING_SERVER_COMMAND="docker-compose run --rm web bin/spring server"

    # Changes variables and alias dependly of the current project
    case $(pwd -P) in
        ( $dimelo | $dimelo/* )
            export SPRING_SERVER_COMMAND="DISPLAY=:99 docker-compose run --rm web sh -c 'Xvfb :99 -ac & spring server'"
            alias rspec="DISPLAY=:99 bin/spring rspec"

            export DEFAULT_SERVICE="web"
            export DEFAULT_CONTAINER="engagement_console_web_dev"
            export BEFORE_COMMAND="docker exec -d $DEFAULT_CONTAINER spring rails r '1'"
            ;;
        ( $kohorde | $kohorde/* )
            export DEFAULT_CONTAINER="kohorde_api_dev"
            export DEFAULT_SERVICE="api"
            # spring server does not seems to work at the moment
            export BEFORE_COMMAND="docker exec -d $DEFAULT_CONTAINER spring rails r '1'"
            ;;
        ( $collab | $collab/* )
            alias rails="dcr web rails"
            alias rspec="dcr web bin/rspec"
            export DEFAULT_CONTAINER="collab_web_dev"
            export DEFAULT_SERVICE="web"
            ;;
    esac

    # Custom aliases per project
    alias dc="docker-compose $DEFAULT_COMPOSE_OPTIONS"
    alias dcud="dcu $DEFAULT_SERVICE"
}

# Execute the script once when we start a new zsh session
chpwd

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$PATH:`yarn global bin`"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
