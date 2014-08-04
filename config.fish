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
alias use53="brew unlink php54 > /dev/null; brew unlink php55 > /dev/null; brew unlink php53 > /dev/null; brew link php53; fpm stop;"
alias use54="brew unlink php53 > /dev/null; brew unlink php55 > /dev/null; brew unlink php54 > /dev/null; brew link php54 > /dev/null; fpm stop > /dev/null; fpm start > /dev/null; php -v; fpm status"
alias use55="brew unlink php53 > /dev/null; brew unlink php54 > /dev/null; brew unlink php55 > /dev/null; brew link php55; fpm stop"




# Track the last non-empty command. It's a bit of a hack to make sure
# execution time and last command is tracked correctly.
set -l cmd_line (commandline)
if test -n "$cmd_line"
    set -g last_cmd_line $cmd_line
    set -ge new_prompt
else
    set -g new_prompt true
end
 
# Show last execution time and growl notify if it took long enough
set -l now (date +%s)
if test $last_exec_timestamp
    set -l taken (math $now - $last_exec_timestamp)
    if test $taken -gt 10 -a -n "$new_prompt"
        error taken $taken
        echo "Returned $last_status, took $taken seconds" | \
            growlnotify -s $last_cmd_line
        # Clear the last_cmd_line so pressing enter doesn't repeat
        set -ge last_cmd_line
    end
end
set -g last_exec_timestamp $now



# Show loadavg when too high
set -l load1m (uptime | grep -o '[0-9]\+\.[0-9]\+' | head -n1)
set -l load1m_test (math $load1m \* 100 / 1)
if test $load1m_test -gt 100
    error load $load1m
end