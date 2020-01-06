# Internal IP
alias ipi="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# External IP
alias ipe="dig +short myip.opendns.com @resolver1.opendns.com"

