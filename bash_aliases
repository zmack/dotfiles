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
function gco {
  if [ -z "$1" ]; then
    git checkout master
  else
    git checkout $1
  fi
}

# rails
alias ms="mongrel_rails start"
alias mig="rake db:migrate"
alias migt="rake db:migrate RAILS_ENV=test"

