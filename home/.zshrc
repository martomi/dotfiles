alias ls='ls -G' # colorized output
export EDITOR='vim'
bindkey -e
export PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%~%{$reset_color%} "

alias vimrc='vim ~/.vimrc'
alias tmuxconf='vim ~/.tmux.conf'
alias zshrc='vim ~/.zshrc'
