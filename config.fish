# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme sergigp

# Plugins

# autojump
if test -f /Users/sergigp/.autojump/etc/profile.d/autojump.fish; . /Users/sergigp/.autojump/etc/profile.d/autojump.fish; end

# percol
function fish_user_key_bindings
	bind \cr percol_select_history
end

set fish_plugins autojump percol

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# aliases
alias dev="cd ~/dev"
alias e="subl"
alias phpunit="~/.composer/vendor/bin/phpunit"
# alias behat="~/.composer/vendor/bin/behat"
alias cache_osiris='sh ~/cache_osiris.sh'
alias fpm="/usr/local/Cellar/php54/5.4.31/sbin/php54-fpm"
alias pf="phpunit --filter"
alias ba="vendor/bin/behat -p api"
alias editfish="e ~/.config/fish/config.fish"
alias reloadfish="source ~/.config/fish/config.fish"
alias pb="phpunit --exclude-group=integration,external"
alias pi="phpunit --group=integration,external"


function unlinkphp
	brew unlink php53 > /dev/null;
	brew unlink php54 > /dev/null;
	brew unlink php56 > /dev/null;
end

function showphpfpm
	set_color FF0
	php -v;
	set_color purple
	fpm status
	set_color normal
end

function use53
	unlinkphp
	brew link php53 > /dev/null;
	fpm stop > /dev/null;
	showphpfpm
end

function use54
	unlinkphp
	brew link php54 > /dev/null;
	killall php-fpm
	sudo rm /usr/sbin/php-fpm
	sudo ln -s /usr/local/Cellar/php55/5.4.31/sbin/php-fpm /usr/sbin/php-fpm
	fpm start > /dev/null;
	showphpfpm
end

function use56
	unlinkphp
	brew link php56 > /dev/null;
	killall php-fpm
	sudo rm /usr/sbin/php-fpm
	sudo ln -s /usr/local/Cellar/php56/5.6.6/sbin/php-fpm /usr/sbin/php-fpm
	showphpfpm
end

function log_mysql
	mysql -uroot -e "SET GLOBAL general_log = 'ON';"
	mysql -uroot -e "SET GLOBAL general_log_file = '/Users/sergigp/mysql.log';"
	tail -f /Users/sergigp/mysql.log;
end

function uuid_db
	set uuid (uuidgen | sed 's/\-//g')
	echo -n $uuid | pbcopy
	echo $uuid 
end

function uuid_code
	set uuid (uuidgen | tr '[:upper:]' '[:lower:]')
	echo -n $uuid | pbcopy
	echo $uuid 
end

function uuid_to_db
    set uuid (echo $argv | tr '[:lower:]' '[:upper:]' | sed 's/\-//g')
	echo -n $uuid | pbcopy
	echo $uuid
end