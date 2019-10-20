alias ls='ls -G' # colorized output
export PS1='\u@\h:\[\e[33m\]\w\[\e[0m\]\$ '
export EDITOR='vim'

alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'
alias bashrc='vim ~/.bashrc'

alias pushdotfiles='cd ~/Documents/Development/dotfiles/ && cp ~/.vimrc . && cp ~/.tmux.conf . && cp ~/.bashrc . &&
  git diff'

# Let pyenv manage the global python version
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
