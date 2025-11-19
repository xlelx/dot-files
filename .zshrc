# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.ype
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# ENV Variables
export TTD_AUTH="CgsI1qGv2qT9sj4QBRIHa3F6Y2prORogXSt9XFxLYF9fXFsuWVxcLlxZcmliYCclMSU9WUZ9I1wgAQ=="
export KUBECONFIG="$HOME/.kube/ttd:$HOME/.kube/config"
export PROTOBUF_TOOLS_OS="macosx"
export PROTOBUF_TOOLS_CPU="x64"

export HADOOP_HOME=/usr/local/Cellar/hadoop-3.2.1
export JAVA_HOME=$(/usr/libexec/java_home)
export GRADLE_HOME="$HOME/.gradle"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

export NEXUS_MAVEN_READ_USER="maven.r"
export NEXUS_MAVEN_READ_PASS="A@n3vR9gy15W"

export AWS_PROFILE="production-account"

export HOMEBREW_PREFIX="/opt/homebrew"
export DOTNET_ROOT="/usr/local/share/dotnet/"

export GIT_EDITOR="nvim"

## Api.Gateway env vars
export GOPRIVATE=gitlab.adsrvr.org
export CI_SERVER_HOST=gitlab.adsrvr.org
export CI_JOB_TOKEN="Vf-Ctmvj2RkAbPry3qYo"

# Aliases
alias ll="ls -a -l"
alias vim="nvim"
alias python="python3"
alias cd="z"
alias k="kubectl"
alias fd="find"
alias grep="rg"
alias ls="eza"
alias du="dust"
alias tmuxstart="$HOME/.tmux_startup.sh"
alias pip ="pip3"
alias jl="source ~/venvs/jupyterlab/bin/activate && jupyter lab"


# Git aliases
alias gi="git init"
alias gs="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias ga="git add ."
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg='git log --graph --oneline --decorate --all'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'

# vim movement for cli
bindkey -v

gbcb() {
  git branch --show-current
}

cloudlogin() {
  ttd cloudlogin aws && ttd cloudlogin aws -a list && ttd cloudlogin aws -a production-account
}

editZsh(){
    vim ~/.zshrc
    source ~/.zshrc
    echo "New .zshrc sourced."
}

dotnetRootSwitch() {
  if [[ "$DOTNET_ROOT" == "/usr/local/share/dotnet/" ]]; then
    export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"
    echo "DOTNET_ROOT switched to: $DOTNET_ROOT"
  else
    export DOTNET_ROOT="/usr/local/share/dotnet/"
    echo "DOTNET_ROOT switched to: $DOTNET_ROOT"
  fi
}

kill_processes() {
  ps -a | grep $1 | awk '{print $1}' | xargs kill
}

# PATHS
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/ttdsrc/git-utils/git-hooks/alias-bin:$PATH"
export PATH="$HOME/ttdsrc/git-utils/alias-bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HADOOP_HOME/bin:$PATH"
export PATH="$HADOOP_HOME/sbin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/Users/leo.han/dotnet-core-uninstall:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/Users/leo.han/go/bin:$PATH"
function vkey() {
  local cert_name="${HOME}/.ssh/id_ed25519-cert.pub"
  if [[ ! -f "$cert_name" || $(find "$cert_name" -mmin +1440) ]]
  then
    # Authenticate to Vault
    VAULT_ADDR=https://vault.adsrvr.org vault login -method=oidc  -path=ops-sso

    # Reach out to Vault for a cert
    # If your local username differs from your OPS SSO user, replace the $(whoami) with your literal OPS SSO username
    VAULT_ADDR=https://vault.adsrvr.org vault write \
    -field=signed_key ssh-client-signer/sign/ops_sso_user valid_principals=$USER \
    public_key=@/Users/$(whoami)/.ssh/id_ed25519.pub > $cert_name
    
    echo "Cert Generated"
    ssh-add -D && ssh-add --apple-use-keychain && echo "Added to ssh-agent"
  else
    echo "Cert not needed"
  fi
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


eval "$(zoxide init zsh)"
eval "$(jenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2024-12-30 23:49:20
export PATH="$PATH:/Users/leo.han/.local/bin"
export TTD_CLOUDSMITHUSERNAME=leo-han
export TTD_CLOUDSMITHAPITOKEN=ebbc7ca101e457ddc4131d542723de8b2c96a64e

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.local/bin:$PATH"
