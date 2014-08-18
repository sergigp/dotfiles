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
alias phpunit='vendor/bin/phpunit'
alias behat='vendor/bin/behat'
alias cache_osiris='sh ~/cache_osiris.sh'
alias fpm="/usr/local/Cellar/php54/5.4.31/sbin/php54-fpm"
# alias use53="brew unlink php54 > /dev/null; brew unlink php55 > /dev/null; brew unlink php53 > /dev/null; brew link php53; fpm stop;"
#alias use54="brew unlink php53 > /dev/null; brew unlink php55 > /dev/null; brew unlink php54 > /dev/null; brew link php54 > /dev/null; fpm stop > /dev/null; fpm start > /dev/null; php -v; fpm status"
#alias use55="brew unlink php53 > /dev/null; brew unlink php54 > /dev/null; brew unlink php55 > /dev/null; brew link php55; fpm stop"
alias frontal-ssh="ssh -i ~/.ssh/akamon -p 8822 sergi.gonzalez@frontales01.prod.akamon.com"

function unlinkphp
	brew unlink php54 > /dev/null;
	brew unlink php55 > /dev/null;
	brew unlink php53 > /dev/null;
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
	fpm stop > /dev/null;
	fpm start > /dev/null;
	showphpfpm
end

function use55
	unlinkphp
	brew link php55 > /dev/null;
	fpm stop > /dev/null;
	showphpfpm
end