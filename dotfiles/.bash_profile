parse_git_status() { [[ -n "$(git status --porcelain 2> /dev/null)" ]] && echo " ✗" ; }

parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_status))/" ; }

export PS1="\[\033[32m\]➜ \W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

bind 'set completion-ignore-case on'
