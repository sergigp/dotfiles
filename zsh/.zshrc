export DOTFILES_PATH=$HOME/.dotfiles
export ZSH=${HOME}/.oh-my-zsh


ZSH_CUSTOM=${DOTFILES_PATH}/zsh
ZSH_THEME="sergi"

plugins=(autojump percol zsh-autosuggestions)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


######################################################################
###############################  ALIASES  ############################
######################################################################
alias e="subl"
alias editzsh="e ~/.zshrc"
alias reloadzsh="source ~/.zshrc"
alias scala="scala -Dscala.color"


######################################################################
#############################  FUNCTIONS  ############################
######################################################################

function uuid {
	uuid= uuidgen | tr '[:upper:]' '[:lower:]'
	echo -n $uuid | pbcopy
	echo $uuid 
}

function viewport {
	lsof -n -i4TCP:$argv
}

function log_mysql {
	rm /Users/sergigp/mysql.log;
	touch /Users/sergigp/mysql.log;
	mysql -uroot -e "SET GLOBAL general_log = 'ON';"
	mysql -uroot -e "SET GLOBAL general_log_file = '/Users/sergigp/mysql.log';"
	tail -f /Users/sergigp/mysql.log;
}

function perf {
  curl -o /dev/null -s -w "%{time_connect} + %{time_starttransfer} = %{time_total}\n" "$1"
}

function stg-product {
	PRODUCTID=$1
	result=$(aws dynamodb get-item --table-name stg__chat__products-product_id --key "{\"product_id\": {\"S\": \"$PRODUCTID\"}}")
	echo $result | jq .
}


function pro-product {
	PRODUCTID=$1
	result=$(aws dynamodb get-item --table-name pro__chat__products-product_id --key "{\"product_id\": {\"S\": \"$PRODUCTID\"}}")
	echo $result | jq .
}


eval "$(direnv hook zsh)"

