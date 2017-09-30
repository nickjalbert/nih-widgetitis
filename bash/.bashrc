# Git alias
alias gga='git add'
alias ggp='git push origin `git rev-parse --abbrev-ref HEAD`'
alias ggl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias ggf='git fetch'
alias ggs='git status'
alias ggd='git diff'
alias ggm='git commit -m'
alias ggma='git commit -am'
alias ggb='git branch'
alias ggc='git checkout'
alias ggra='git remote add'
alias ggra='git remote add'
alias ggr='git rebase'
alias ggpur='git pull --rebase'
alias ggpun='git pull'
alias ggcl='git clone'

# Bash options
shopt -s histappend
export HISTIGNORE="ignoredups:&:ls:[bf]g:exit"
export HISTSIZE=100000
export HISTFILESIZE=200000
set -o vi
shopt -s checkwinsize
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Environment
export PATH=$PATH

# Virtual env
if [ ! -e $HOME/.virtualenvs ]; then
    mkdir -p $HOME/.virtualenvs
fi
if [ -e /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
elif [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi
export WORKON_HOME=$HOME/.virtualenvs/

# Python startup
export PYTHONSTARTUP=$HOME/.pystartup
if [ ! -e $PYTHONSTARTUP ]; then
    echo "import atexit" > $PYTHONSTARTUP
    echo "import os" >> $PYTHONSTARTUP
    echo "import readline" >> $PYTHONSTARTUP
    echo "import rlcompleter" >> $PYTHONSTARTUP
    echo "import sys" >> $PYTHONSTARTUP
    echo "hist = os.path.join(os.environ['HOME'], '.pyhist')" >> $PYTHONSTARTUP
    echo "try:" >> $PYTHONSTARTUP
    echo "    readline.read_history_file(hist)" >> $PYTHONSTARTUP
    echo "except IOError:" >> $PYTHONSTARTUP
    echo "    pass" >> $PYTHONSTARTUP
    echo "readline.parse_and_bind('bind -v')" >> $PYTHONSTARTUP
    echo "readline.parse_and_bind('bind ^I rl_complete')" >> $PYTHONSTARTUP
    echo "atexit.register(readline.write_history_file, hist)" >> $PYTHONSTARTUP
    echo "del os, hist" >> $PYTHONSTARTUP
fi


# Vi key bindings etc
if [ ! -e $HOME/.editrc ]; then
    echo "bind -v" > $HOME/.editrc
fi 

if [ ! -e $HOME/.inputrc ]; then
    echo "set editing-mode vi" > $HOME/.inputrc
fi

if [ ! -e $HOME/.gitconfig ]; then
    echo "[user]" > $HOME/.gitconfig
    echo "    name = Nick Jalbert" > $HOME/.gitconfig
    echo "    email = nickjalbert@gmail.com" > $HOME/.gitconfig
    echo "[core]" > $HOME/.gitconfig
    echo "    editor = /usr/bin/vim" > $HOME/.gitconfig
fi 

