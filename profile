export PATH=~/.gems/bin:$PATH
export PATH=~/src/homebrew/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/bin/zmack:$PATH
export PATH=~/.gem/ruby/1.8/bin:$PATH

# RVM
if [ -f ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
if [ -f ~/.rvm/current ] ; then source ~/.rvm/current ; fi

if [ -f ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi
if [ -f ~/.macprofile ] ; then source ~/.macprofile ; fi

# don't use gems as root
#alias gemi='gem install --no-rdoc --no-ri -y'
#alias gemi='gem install -y'

export DISPLAY=:0.0
export EDITOR=vim
export PAGER=less
export INPUTRC=~/.inputrc

# completion
complete -C ~/.bash_completion.d/rake-complete.rb -o default rake
source ~/.bash_completion.d/git-completion.bash

# prompt
# \[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\]

PS1='[\[\033[01;32m\]\u@\h\[\033[01;34m\] \W\[\033[01;36m\]$(__git_ps1 " (%s)")\[\033[01;33m\]$rvm_prompt\[\033[00m\]]\$ '
