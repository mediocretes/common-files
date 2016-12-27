# /etc/skel/.bash_profile:
# $Header: /home/cvsroot/gentoo-src/rc-scripts/etc/skel/.bash_profile,v 1.10 2002/11/18 19:39:22 azarah Exp $

#This file is sourced by bash when you log in interactively.
[ -f ~/.bashrc ] && . ~/.bashrc

if [[ "$SKIP_KEYCHAIN" != "true" ]]; then
  for k in /usr/bin/keychain /opt/local/bin/keychain /usr/local/bin/keychain /opt/boxen/homebrew/bin/keychain; do
      if [ -f $k ]; then
          for i in ~/.ssh/*; do
              [ -f $i ] && [ -f $i.pub ] && eval `$k --eval --agents ssh --inherit any $i`
          done
      fi
  done
fi

cf_date_check_notify
alias reloadhosts="sudo niload -v -m hosts ."
alias ls='ls $LS_OPTIONS -hF'
eval `dircolors ~/DIR_COLORS`
export LS_OPTIONS='--color=auto'
    

# Ruby Enterprise Edition
alias rakeEE="/opt/ruby-enterprise-1.8.7-2010.01/bin/rake"
alias gemEE="/opt/ruby-enterprise-1.8.7-2010.01/bin/gem"
alias rubyEE="/opt/ruby-enterprise-1.8.7-2010.01/bin/ruby"
alias irbEE="/opt/ruby-enterprise-1.8.7-2010.01/bin/irb"

cf_check_for_updates

if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi
if [[ -d "$HOME/.rbenv" ]] ; then eval "$(rbenv init -)"; fi

# Automatic discovery of your code directory
for dir in ~/code ~/projects ~/workspace; do
  if [ -d $dir ]; then
    CODE_DIR=$dir
    break
  fi
done

if [[ -f "$CODE_DIR/eb/bin/eb" ]]; then
  eval "$($CODE_DIR/eb/bin/eb init -)"
fi
