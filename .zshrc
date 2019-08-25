# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export SBT_OPTS="-Xmx2G"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="xiong-chiamiov-plus"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git command-not-found ubuntu tmux pip sudo docker docker-compose gitignore maven kubectl zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/ju.perez/bin:/home/juanantonio/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# binding to accept the autosuggest
bindkey '^⇧ ' autosuggest-accept

# User specific aliases and functions
export ANSIBLE_HOSTS=/etc/ansible/hosts

# Alias for salt keys
#alias sk="ssh salt.test.foo sudo salt-key"
# Show host that contain the first parameter
function sk() { ssh salt.test.foo "sudo salt-key|grep -i '$1'"; }
#Enter in the first host that match with the parameter
function ssk() { ssh $(sk "$1"|head -n1); }

# Aparition
#export MONGODB_URI_APARITION=mongodb://127.0.0.1:27017/machines?replicaSet=gendbmongodb
#export MONGODB_URI_APARITION=mongodb://localhost:27017/
export MONGODB_URI_APARITION=mongodb://gen-db-mongodb-data01.gtl.test.foo:27017,gen-db-mongodb-data02.gtl.test.foo:27017/machines?replicaSet=gendbmongodb
#function aparition() {
#  docker run --rm -it --link some-mongo -e MONGODB_URI=${MONGODB_URI_APARITION} docker-registry.test.foo/aparition:latest aparition ${@};
#}
function aparition() {
  docker run --rm -it -e MONGODB_URI=${MONGODB_URI_APARITION} docker-registry.test.foo/aparition:latest aparition ${@};
}

#Azure CLI autocompletation
autoload -U +X bashcompinit && bashcompinit
source /usr/local/etc/bash_completion.d/az

# Function to put your work time in personio
function time_logger(){

  if [ -z $1 ]; then
    echo "Putting hours for ->" $(date +"%Y-%m-%d");
    ~/projects/personio-timelogger/client/venv/bin/python ~/projects/personio-timelogger/client/personio-timelogger.py $(date +"%Y-%m-%d");
  else
    echo "Putting hours for ->" ${@}
    ~/projects/personio-timelogger/client/venv/bin/python ~/projects/personio-timelogger/client/personio-timelogger.py $1;
  fi

}
