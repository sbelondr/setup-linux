# Function

# Read markdown file

unalias md
md() {
	pandoc "$1" | lynx -stdin
}

# alias

alias vi="vim"
alias emacs="emacs -nw"

# env

export USER_42="sbelondr"
export VISUAL=vim
export EDITOR="$VISUAL"
