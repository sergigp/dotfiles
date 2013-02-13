alias cl='clear'
alias ll='ls -l'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias st='git st'


cleancode() {

ruta=$1
path=${ruta%/*}
nom=${ruta##*/}
nom=${nom%.inc}

# echo "path = $path, nom = $nom, ruta = $ruta"

if [ ! -f ~/repo_git/"$ruta" ]; then echo "wrong path"; return; fi

cp ~/repo_git/"$ruta" ~/$nom.php && php ~/php-cs-fixer.phar fix ~/$nom.php --fixers=visibility,indentation,trailing_spaces,return,braces,eof_ending,extra_empty_lines; mv ~/$nom.php ~/repo_git/$path/$nom.inc

}
export -f cleancode
