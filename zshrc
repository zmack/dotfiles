# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="goat-candy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/projects/gogo/gogo.plugin.zsh
source ~/.private/statuspage.io

bindkey -v
bindkey "^R" history-incremental-search-backward
setopt APPEND_HISTORY
HISTSIZE=1000000

# bash
alias reload="source ~/.profile"
alias rc='vim ~/.profile && source ~/.profile'
alias ls='ls -G'

# git svn
alias gs="git svn"
alias gsr="git svn rebase"
alias gsd="git svn dcommit"

# git
alias gl="git log"
alias ga="git add"
alias gr="git reset"
alias gst="git status"

alias gd="git diff"
alias gdc="git diff --cached"

alias g-update-deleted="git ls-files -z --deleted | git update-index -z --remove --stdin"
#alias gstt="git ls-files --exclude-per-directory=.gitignore --exclude-from=.git/info/exclude --others --modified -t"
alias gfr="git fetch && git rebase refs/remotes/origin/master"
alias mozilla="curl --user-agent 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.1.4) Gecko/20091016 Firefox/3.5.4'"

alias gb="git branch"
alias gba="git branch -a -v"

alias gci="git commit"
alias gco="git checkout"

alias gg="cd \$GEM_HOME"

alias kc="kubectl"
alias kcp="kc --context=production"

# Leeeeewh
function le() {
  if (( $# == 0 )); then
    ls -alht | head
  else
    ls -alht | head -n $1
  fi
}

source /usr/local/share/chruby/chruby.sh
source /Users/zmack/perl5/perlbrew/etc/bashrc

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home/"
# Customize to your needs...
export GOPATH=/Users/zmack/projects/go
export PATH=/Users/zmack/bin:$GOPATH/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Commands
export EDITOR=/usr/local/bin/vim
export XDG_CONFIG_HOME=/Users/zmack/projects/
export DISABLE_SPRING=true
chruby 2.2.0

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/zmack/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/zmack/google-cloud-sdk/completion.zsh.inc'
