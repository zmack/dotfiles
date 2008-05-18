export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
export PATH=~/work/gems/giston/bin:$PATH
export PATH=~/work/gems/braid/bin:$PATH
export PATH=~/work/sdk/air/bin:$PATH
export PATH=~/.gems/bin:$PATH
export PATH=~/bin:$PATH
export PATH=~/bin/chelu:$PATH
export PATH=/usr/local/git/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH

export MANPATH=~/man:/usr/local/git/man:$MANPATH

. ~/bin/aliases

# don't use gems as root
#alias gemi='gem install --no-rdoc --no-ri -y'
#alias gemi='gem install -y'

export DISPLAY=:0.0
export EDITOR=v
export PAGER=less
export VIM_APP_DIR=/Applications
export INPUTRC=~/.inputrc

# have git-svn working with just port install git-core, without +svn
export PERL5LIB=/usr/local/svn/perl:/usr/local/svn/perl/darwin-thread-multi-2level

# completion
complete -C ~/.bash_completion.d/rake-complete.rb -o default rake
source ~/.bash_completion.d/git-completion.bash

# prompt
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

